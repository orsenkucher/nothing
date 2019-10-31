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

const addTasksURL = "https://us-central1-crystal-factory.cloudfunctions.net/AddTasks"

func sendData() {
	var tasks []model.Task
	dat, err := ioutil.ReadFile("data/tasks.json")
	core.Check(err)
	fmt.Print(string(dat))
	json.Unmarshal(dat, &tasks)
	fmt.Println(len(tasks))
	/*tasks = []model.Task{model.Task{
		Question:    "?",
		Explanation: "~",
		Answers:     []string{"!"},
	}} //*/
	SendTasks(tasks, "errudidtion")
}

// SendTasks is public
func SendTasks(tasks []model.Task, group string) {
	tasksQuerie := struct {
		Tasks []model.Task `json:"tasks"`
		Group string       `json:"group"`
	}{
		Tasks: tasks,
		Group: group,
	}
	strb, _ := json.Marshal(&tasksQuerie)
	http.Post(addTasksURL, "application/json", bytes.NewBuffer(strb))
}
