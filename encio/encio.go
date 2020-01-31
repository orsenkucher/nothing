package encio

import (
	"bytes"
	"crypto/aes"
	"crypto/cipher"
	"crypto/rand"
	"crypto/sha256"
	"fmt"
	"io"
	"io/ioutil"
	"path"
	"strings"
)

// EncIO is an encryption key in its core.
// We advise to .gitignore **/*.secret* files.
type EncIO []byte

func NewEncIO(key string) EncIO {
	bytes := []byte(key)
	sha := sha256.New()
	_, err := sha.Write(bytes)
	if err != nil {
		panic(err)
	}
	bytes = sha.Sum(nil)
	return EncIO(bytes)
}

const (
	sec = ".secret"
	enc = ".enc"
)

type encFile struct {
	base, dir string
	insidx    int
	sec, enc  []byte
}

// ReadFile will retrieve bytes from file.
// File name argument should drop dot[secret|enc] part.
// It is ok to have "name.[secret|enc].ext" files on disk.
// If key was wrong, you'll receive random mess and no error!
func (key EncIO) ReadFile(file string) ([]byte, error) {
	if ef, err := findFile(file); err == nil {
		if ef.sec != nil {
			if ef.enc != nil && bytes.Equal(key.decrypt(ef.enc), ef.sec) {
				return ef.sec, nil
			} // if sec == enc
			name := ef.makePath(enc)
			enc := key.encrypt(ef.sec)
			err := toFile(name, enc)
			return ef.sec, err
		}
		return key.decrypt(ef.enc), nil
	} else {
		return nil, err
	}
}

func toFile(file string, bytes []byte) error {
	return ioutil.WriteFile(file, bytes, 0644)
}

func (ef *encFile) fromFile(class string) ([]byte, error) {
	return ioutil.ReadFile(ef.makePath(class))
}

func (ef *encFile) makeName(class string) string {
	if ef.insidx > 0 {
		return ef.base[:ef.insidx] + class + ef.base[ef.insidx:]
	} // if insertion index is available
	if class == sec {
		return ef.base
	} // in case .secret is not used in secret file name
	ext := path.Ext(ef.base)
	body := strings.TrimSuffix(ef.base, ext)
	return body + class + ext // creds + .enc + .json
}

func (ef *encFile) makePath(class string) string {
	return path.Join(ef.dir, ef.makeName(class))
}

func (ef *encFile) match(name string, class string) bool {
	matched := ef.base == strings.ReplaceAll(name, class, "")
	if matched {
		ef.insidx = strings.Index(name, class)
	}
	return matched
}

func findFile(file string) (encFile, error) {
	dir := path.Dir(file)
	ef := encFile{base: path.Base(file), dir: dir}
	files, err := ioutil.ReadDir(dir)
	if err != nil {
		return ef, err
	}
	for _, f := range files {
		if !f.IsDir() {
			name := f.Name()
			if ef.match(name, sec) {
				if ef.sec, err = ef.fromFile(sec); err != nil {
					return ef, err
				}
			} else if ef.match(name, enc) {
				if ef.enc, err = ef.fromFile(enc); err != nil {
					return ef, err
				}
			}
		}
	}
	if append(ef.sec, ef.enc...) != nil {
		return ef, nil
	} else {
		return ef, fmt.Errorf("%s not found", file)
	}
}

func (key EncIO) encrypt(plain []byte) []byte {
	// Making AES cipher [32 bytes]
	block, err := aes.NewCipher(key)
	if err != nil {
		panic(err)
	}

	// initialization vector + data
	ciphered := make([]byte, aes.BlockSize+len(plain))
	iv := ciphered[:aes.BlockSize]
	if _, err := io.ReadFull(rand.Reader, iv); err != nil {
		panic(err)
	}

	stream := cipher.NewCFBEncrypter(block, iv)
	stream.XORKeyStream(ciphered[aes.BlockSize:], plain)
	return ciphered
}

func (key EncIO) decrypt(ciphered []byte) []byte {
	ciphered = append(ciphered[:0:0], ciphered...) // copy
	block, err := aes.NewCipher(key)
	if err != nil {
		panic(err)
	}

	// Before even testing the decryption
	if len(ciphered) < aes.BlockSize {
		panic("Text is too short")
	}

	// parse encrypted data for IV
	iv := ciphered[:aes.BlockSize]
	ciphered = ciphered[aes.BlockSize:]
	stream := cipher.NewCFBDecrypter(block, iv)
	stream.XORKeyStream(ciphered, ciphered)
	return ciphered
}
