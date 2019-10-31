package functions

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"

	"cloud.google.com/go/firestore"
	"github.com/orsenkucher/nothing/data/model"
)

type taskWithID struct{
	task model.Task
	ID int64 `json:"id"`
}

func getTask(tdoc *firestore.DocumentRef) model.Task {
	var t model.Task
	snap, _ := tdoc.Get(globalCtx)
	snap.DataTo(&t)
	return t
}

func getUserSolvedTasks(group string, ID string) []bool {
	return []bool{}
}

// GiveTasks is public
func GiveTasks(w http.ResponseWriter, r *http.Request) {
	str, _ := ioutil.ReadAll(r.Body)
	var querie struct {
		Group string   `json:"group"`
		Count int      `json:"count"`
		IDs   []string `json:"ids"`
	}
	json.Unmarshal(str, &querie)

	counter := getCounter(storeClient.Doc("Tasks/" + querie.Group))
	//avaliableTasks := make([]bool, counter, counter)
	if counter < querie.Count {
		querie.Count = counter
	}
	tasks := make(taskWithID, 0, querie.Count)
	for i := 0; i < querie.Count; i++ {
		tasks = append(tasks, taskWithID{task :getTask(ctx, client.Doc("Tasks/"+strconv.Itoa(i))), ID:i})
	}
	resp, _ := json.Marshal(tasks)
	fmt.Fprint(w, string(resp))
}
