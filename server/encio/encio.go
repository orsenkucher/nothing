package encio

import (
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

// EncIO is an encryption key in its core
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
	base     string
	sec, enc []byte
}

// ReadFile will retrieve bytes from file.
// File name argument should drop dot[secret|enc] part.
// It is ok to have "name.[secret|enc].ext" files on disk.
func (key EncIO) ReadFile(file string) ([]byte, error) {
	if ef, err := findFile(file); err == nil {
		if ef.sec != nil {
			name := path.Join(path.Dir(file), ef.makeName(sec))
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

func (ef *encFile) makeName(class string) string {
	ext := path.Ext(ef.base)
	body := strings.TrimSuffix(ef.base, ext)
	return body + class + ext // creds + .enc + .json
}

func (ef *encFile) match(name string, class string) bool {
	return ef.base == strings.ReplaceAll(name, class, "")
}

func findFile(file string) (encFile, error) {
	ef := encFile{base: path.Base(file)}
	files, err := ioutil.ReadDir(path.Dir(file))
	if err != nil {
		return ef, err
	}
	for _, f := range files {
		if !f.IsDir() {
			name := f.Name()
			if ef.match(name, sec) {
				ef.sec, err = ioutil.ReadFile(file)
				return ef, err // if secret found the job is done
			}
			if ef.match(name, enc) {
				if ef.enc, err = ioutil.ReadFile(file); err != nil {
					return ef, err
				}
			}
		}
	}
	if ef.enc == nil { // if no enc, then nothing found at all
		return ef, fmt.Errorf("%s not found", file)
	} else {
		return ef, nil
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
