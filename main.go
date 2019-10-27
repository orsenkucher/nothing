package main

import (
	"bytes"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"

	"github.com/orsenkucher/nothing/fbclients"
	"github.com/orsenkucher/nothing/functions"
)

func check(err error) {
	if err != nil {
		panic(err)
	}
}

func main() {
	var querie struct {
		Count int      `json:"count"`
		IDs   []string `json:"ids"`
	}
	querie.Count = 3
	querie.IDs = []string{}

	strb, _ := json.Marshal(querie)
	resp, _ := http.Post("https://us-central1-crystal-factory.cloudfunctions.net/GiveTasks", "application/json", bytes.NewBuffer(strb))
	str, _ := ioutil.ReadAll(resp.Body)
	fmt.Println(string(str))
}

func sendData() {
	var tasks []functions.Task
	dat, err := ioutil.ReadFile("data/tasks.json")
	check(err)
	fmt.Print(string(dat))
	json.Unmarshal(dat, &tasks)
	fmt.Println(len(tasks))
	/*tasks = []functions.Task{functions.Task{
		Question:    "?",
		Explanation: "~",
		Answers:     []string{"!"},
	}}//*/
	fbclients.SendTasks(tasks)
}
