package functions

import (
	"context"
	"encoding/json"
	"io/ioutil"
	"log"
	"net/http"
	"strconv"

	"cloud.google.com/go/firestore"
	"github.com/orsenkucher/nothing/data/model"
)

// Counter is int
type Counter struct {
	Counter int `firebase:"counter" json:"counter"`
}

func getCounter(ctx context.Context, cdoc *firestore.DocumentRef) int {
	var c Counter
	snap, _ := cdoc.Get(ctx)
	snap.DataTo(&c)
	return c.Counter
}

// AddTasks is Schedule
func AddTasks(w http.ResponseWriter, r *http.Request) {
	str, _ := ioutil.ReadAll(r.Body)
	var tasks []model.Task
	json.Unmarshal(str, &tasks)

	ctx := context.Background()
	client, err := firestore.NewClient(ctx, "crystal-factory")
	if err != nil {
		log.Fatalf("create client: %v", err)
	}
	counter := getCounter(ctx, client.Doc("Tasks/Counter"))

	for _, task := range tasks {
		client.Doc("Tasks/"+strconv.Itoa(counter)).Set(ctx, task)
		counter++
	}

	client.Doc("Tasks/Counter").Set(ctx, Counter{Counter: counter})
}
