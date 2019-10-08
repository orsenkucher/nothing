package tasks

// gcloud functions deploy HelloGet --runtime go111 --trigger-http
import (
	"fmt"
	"net/http"
)

// HelloGet is an HTTP Cloud Function.
func HelloGet(w http.ResponseWriter, r *http.Request) {
	fmt.Fprint(w, "Hello, World!")
}
