package fbclients

import (
	"bytes"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"

	"github.com/orsenkucher/nothing/core"
	"github.com/orsenkucher/nothing/data/model"
)

const addProblemsURL = "https://us-central1-crystal-factory.cloudfunctions.net/AddProblems"

// SendData send problems from json
func SendData() {
	var problems []model.Problem
	dat, err := ioutil.ReadFile("data/problems.json")
	core.Check(err)
	json.Unmarshal(dat, &problems)
	/*problems = []model.Problem{{
		Question:    "?",
		Explanation: "~",
		Answers:     []string{"!"},
	}} //*/
	// print()
	SendProblems(problems, "logic")
}

// SendProblems sends problems to firestore
func SendProblems(problems []model.Problem, group string) {
	problemsQuery := struct {
		Problems []model.Problem `json:"problems"`
		Group    string          `json:"group"`
	}{
		Problems: problems,
		Group:    group,
	}
	strb, _ := json.Marshal(&problemsQuery)
	fmt.Printf("Sending %v bytes\n", len(strb))
	http.Post(addProblemsURL, "application/json", bytes.NewBuffer(strb))
	fmt.Println("done")
	fmt.Println(string(strb))
}
