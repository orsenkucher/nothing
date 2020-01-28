package encio

import (
	"crypto/aes"
	"crypto/cipher"
	"crypto/rand"
	"crypto/sha256"
	"errors"
	"io"
	"io/ioutil"
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

func (key EncIO) encrypt(plain []byte) []byte {
	// Making AES cipher [32 bytes]
	if len(key) != 32 {
		panic(errors.New("len(key)!=32"))
	}
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

func fromFile(file string) ([]byte, error) {
	return ioutil.ReadFile(file)
}
