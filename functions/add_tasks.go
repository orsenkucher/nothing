package functions

import (
	"encoding/json"
	"io/ioutil"
	"net/http"
	"strconv"

	"cloud.google.com/go/firestore"
	"github.com/orsenkucher/nothing/data/model"
)

// Counter is int
type Counter struct {
	Counter int `firebase:"counter" json:"counter"`
}

func getCounter(cdoc *firestore.DocumentRef) int {
	var c Counter
	snap, err := cdoc.Get(globalCtx)
	if err != nil {
		cdoc.Set(globalCtx, Counter{Counter: 0})
		return 0
	}
	snap.DataTo(&c)
	return c.Counter
}

// AddTasks is Schedule
func AddTasks(w http.ResponseWriter, r *http.Request) {
	str, _ := ioutil.ReadAll(r.Body)
	var tasks struct {
		Tasks []model.Task `json:"tasks"`
		Group string       `json:"group"`
	}
	json.Unmarshal(str, &tasks)

	counter := getCounter(storeClient.Doc("Tasks/" + tasks.Group))

	for _, task := range tasks.Tasks {
		storeClient.Doc("Tasks/"+tasks.Group+"/Tasks/"+strconv.Itoa(counter)).Set(globalCtx, task)
		counter++
	}

	storeClient.Doc("Tasks/"+tasks.Group).Set(globalCtx, Counter{Counter: counter})
}
