package main

import (
	"bytes"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
)

func main() {
	query := struct {
		Group    string `json:"group"`
		ID       string `json:"id"`
		Problems []int  `json:"problems"`
		Answers  []bool `json:"answers"`
	}{
		Group:    "logic",
		ID:       "4VFtjjzlmSglRaEQ4p5b7zdAQxo1",
		Problems: []int{1, 2, 6},
		Answers:  []bool{true, false, true},
	}

	strb, _ := json.Marshal(&query)
	fmt.Println(string(strb))
	resp, _ := http.Post("https://us-central1-crystal-factory.cloudfunctions.net/ProcessAnswers", "application/json", bytes.NewBuffer(strb))
	body, _ := ioutil.ReadAll(resp.Body)
	fmt.Println(string(body))
}
