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

// AddProblems is Schedule
func AddProblems(w http.ResponseWriter, r *http.Request) {
	str, _ := ioutil.ReadAll(r.Body)
	var problems struct {
		Problems []model.Problem `json:"problems"`
		Group    string          `json:"group"`
	}
	json.Unmarshal(str, &problems)

	counter := getCounter(storeClient.Doc("problems/" + problems.Group))

	for _, problem := range problems.Problems {
		storeClient.Doc("problems/"+problems.Group+"/problems/"+strconv.Itoa(counter)).Set(globalCtx, problem)
		counter++
	}

	storeClient.Doc("problems/"+problems.Group).Set(globalCtx, Counter{Counter: counter})
}
