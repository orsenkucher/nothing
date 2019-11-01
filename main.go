package main

import (
	"bytes"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
)

func main() {
	fmt.Println(string([]byte{123, 34, 105, 100, 34, 58, 32, 34, 52, 86, 70, 116, 106, 106, 122, 108, 109, 83, 103, 108, 82, 97, 69, 81, 52, 112, 53, 98, 55, 122, 100, 65, 81, 120, 111, 49, 34, 44, 32, 34, 103, 114, 111, 117, 112, 34, 58, 32, 34, 108, 111, 103, 105, 99, 34, 44, 32, 34, 115, 117, 109, 109, 97, 114, 121,
		34, 58, 123, 34, 50, 49, 34, 58, 116, 114, 117, 101, 44, 34, 52, 56, 34, 58, 102, 97, 108, 115, 101, 44, 34, 54, 48, 34, 58, 102, 97, 108, 115, 101, 44, 34, 54, 51, 34, 58, 102, 97, 108, 115, 101, 125}))
	//fmt.Println(base64.StdEncoding.DecodeString("AgE="))
	//fmt.Println(base64.StdEncoding.EncodeToString([]byte{1, 2, 3, 4, 5}))
	query := struct {
		Group   string       `json:"group"`
		ID      string       `json:"id"`
		Summary map[int]bool `json:"summary"`
	}{
		Group: "logic",
		ID:    "4VFtjjzlmSglRaEQ4p5b7zdAQxo1",
	}

	query.Summary = make(map[int]bool)
	query.Summary[1] = true
	query.Summary[123] = true
	query.Summary[7] = true

	strb, _ := json.Marshal(&query)
	fmt.Println(string(strb))
	resp, _ := http.Post("https://us-central1-crystal-factory.cloudfunctions.net/ProcessAnswers", "application/json", bytes.NewBuffer(strb))
	body, _ := ioutil.ReadAll(resp.Body)
	fmt.Println(string(body))
}
