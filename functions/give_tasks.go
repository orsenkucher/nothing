package functions

import (
	"context"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"strconv"

	"cloud.google.com/go/firestore"
)

func getTask(ctx context.Context, tdoc *firestore.DocumentRef) Task {
	var t Task
	snap, _ := tdoc.Get(ctx)
	snap.DataTo(&t)
	return t
}

// GiveTasks is public
func GiveTasks(w http.ResponseWriter, r *http.Request) {
	str, _ := ioutil.ReadAll(r.Body)
	var querie struct {
		Count int      `json:"count"`
		IDs   []string `json:"ids"`
	}
	json.Unmarshal(str, &querie)

	ctx := context.Background()
	client, err := firestore.NewClient(ctx, "crystal-factory")
	if err != nil {
		log.Fatalf("create client: %v", err)
	}
	counter := getCounter(ctx, client.Doc("Tasks/Counter"))
	if counter < querie.Count {
		querie.Count = counter
	}
	tasks := make([]Task, 0, querie.Count)
	for i := 0; i < querie.Count; i++ {
		tasks = append(tasks, getTask(ctx, client.Doc("Tasks/"+strconv.Itoa(i))))
	}
	resp, _ := json.Marshal(tasks)
	fmt.Fprint(w, string(resp))
}
