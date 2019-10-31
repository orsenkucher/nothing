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
	fmt.Print(string(dat))
	json.Unmarshal(dat, &problems)
	fmt.Println(len(problems))
	/*problems = []model.Problem{{
		Question:    "?",
		Explanation: "~",
		Answers:     []string{"!"},
	}} //*/
	SendProblems(problems, "errudidtion")
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
	http.Post(addProblemsURL, "application/json", bytes.NewBuffer(strb))
}
