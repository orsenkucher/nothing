package fbclients

import (
	"bytes"
	"encoding/json"
	"net/http"

	"github.com/orsenkucher/noting/functions"
)

const addTasksURL = "https://us-central1-crystal-factory.cloudfunctions.net/AddTasks"

// SendTasks is public
func SendTasks(tasks []functions.Task) {
	strb, _ := json.Marshal(&tasks)
	http.Post(addTasksURL, "application/json", bytes.NewBuffer(strb))
}
