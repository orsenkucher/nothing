package tasks

// gcloud functions deploy HelloGet --runtime go111 --trigger-http
import (
	"context"
	"fmt"
	"log"
	"net/http"

	"cloud.google.com/go/firestore"
)

// Task is struct contains task
type Task struct {
	Question    string `firestore:"question"`
	Explanation string `firestore:"explanation"`
	Answer      string `firestore:"answer"`
}

func show(ctx context.Context, doc *firestore.DocumentRef, w http.ResponseWriter) {
	docsnap, _ := doc.Get(ctx)
	dataMap := docsnap.Data()
	fmt.Fprint(w, dataMap, "\n")
}

// HelloGet is an HTTP Cloud Function.
func HelloGet(w http.ResponseWriter, r *http.Request) {
	ctx := context.Background()

	client, err := firestore.NewClient(ctx, "crystal-factory")
	if err != nil {
		log.Fatalf("create client: %v", err)
	}

	task := client.Doc("Tasks/listtest")
	task.Set(ctx, Task{
		Question:    "Question?",
		Explanation: "explanation~",
		Answer:      "answer!",
	})

	show(ctx, task, w)
	fmt.Fprint(w, "Hello, World!")
}
