package encio

import (
	"fmt"
	"os"
	"strings"
	"testing"
)

const pass = "password"

var key EncIO

func TestMain(m *testing.M) {
	key = NewEncIO(pass)
	os.Exit(m.Run())
}

func TestKey(t *testing.T) {
	fmt.Println("Generated key:", key)
	if len(key) != 32 {
		t.Error("Generated key is not len of 32")
	}
}

func TestEnc(t *testing.T) {
	fmt.Println("Using key", key)
	mydata := "This is my data to encrypt"
	mybytes := []byte(mydata)
	enc := key.encrypt(mybytes)

	newKey := NewEncIO(pass)
	dec := newKey.decrypt(enc)
	decdata := string(dec)

	if strings.Contains(string(enc), mydata) {
		t.Error("Ты наркоман что-ли??")
	}

	if mydata != decdata {
		t.Errorf("my != dec, %s != %s", mydata, decdata)
	}

	fmt.Println("ENC:", string(enc))
	fmt.Println("DEC:", decdata)
}
