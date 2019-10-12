package tasks

// gcloud functions deploy HelloGet --runtime go111 --trigger-http
import (
	"context"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"

	"cloud.google.com/go/firestore"
)

// Task is public
type Task struct {
	Question    string   `firestore:"question" json:"question"`
	Explanation string   `firestore:"explanation" json:"explanation"`
	Answer      []string `firestore:"answer" json:"answer"`
}

func show(ctx context.Context, doc *firestore.DocumentRef, w http.ResponseWriter) {
	docsnap, _ := doc.Get(ctx)
	dataMap := docsnap.Data()
	fmt.Fprint(w, dataMap, "\n")
}

func getTask(ctx context.Context, doc *firestore.DocumentRef) Task {
	var t Task
	docsnap, _ := doc.Get(ctx)
	docsnap.DataTo(&t)
	return t
}

// HelloGet is an HTTP Cloud Function.
func HelloGet(w http.ResponseWriter, r *http.Request) {
	str, _ := ioutil.ReadAll(r.Body)
	taskSlice := []Task{}
	json.Unmarshal(str, &taskSlice)
	fmt.Fprint(w, string(str), "\n")
	fmt.Fprint(w, taskSlice)
	ctx := context.Background()
	client, err := firestore.NewClient(ctx, "crystal-factory")
	if err != nil {
		log.Fatalf("create client: %v", err)
	}

	task := client.Doc("Tasks/test")
	task.Set(ctx, Task{
		Question:    "Question?",
		Explanation: "explanation~",
		Answer:      []string{"ans1", "ans2"},
	})
}
