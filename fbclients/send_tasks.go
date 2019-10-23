package fbclients

import (
	"bytes"
	"encoding/json"
	"net/http"

	"github.com/orsenkucher/crystalpuzzle/functions"
)

// SendTasks is public
func SendTasks(tasks []functions.Task) {
	strb, _ := json.Marshal(&tasks)
	http.Post("https://us-central1-crystal-factory.cloudfunctions.net/AddTasks", "application/json", bytes.NewBuffer(strb))
}
