package main

import (
	"fmt"
	"io/ioutil"
	"net/http"
	"testing"
)

//SendSomething SendSomething
func TestSendSomething(t *testing.T) {
	//a := 2
	//b := 2

	resp, _ := http.Get("http://localhost:9090/Sergey?a=2&b=2")
	str, _ := ioutil.ReadAll(resp.Body)
	defer resp.Body.Close()
	fmt.Println(string(str))
}
