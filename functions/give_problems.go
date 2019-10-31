package functions

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"net/http"
	"strconv"

	"cloud.google.com/go/firestore"
	"github.com/orsenkucher/nothing/data/model"
)

func getProblem(tdoc *firestore.DocumentRef) model.Problem {
	var t model.Problem
	snap, _ := tdoc.Get(globalCtx)
	snap.DataTo(&t)
	return t
}

func getUserSolvedProblems(group string, ID string) []bool {
	return []bool{}
}

type problemWithID struct {
	model.Problem
	ID int `json:"id"`
}

// GiveProblems is public
func GiveProblems(w http.ResponseWriter, r *http.Request) {
	str, _ := ioutil.ReadAll(r.Body)
	var querie struct {
		Group string   `json:"group"`
		Count int      `json:"count"`
		IDs   []string `json:"ids"`
	}
	json.Unmarshal(str, &querie)

	counter := getCounter(storeClient.Doc("problems/" + querie.Group))
	//avaliableProblems := make([]bool, counter, counter)
	if counter < querie.Count {
		querie.Count = counter
	}
	problems := make([]problemWithID, 0, querie.Count)
	for i := 0; i < querie.Count; i++ {
		problems = append(problems, problemWithID{ID: i, Problem: getProblem(storeClient.Doc("problems/" + querie.Group + "/problems/" + strconv.Itoa(i)))})
	}
	resp, _ := json.Marshal(problems)
	fmt.Fprint(w, string(resp))
}
