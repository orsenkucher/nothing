package functions

import (
	"encoding/base64"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"math/rand"
	"net/http"
	"sort"
	"strconv"
	"time"

	"cloud.google.com/go/firestore"
	"github.com/orsenkucher/nothing/data/model"
)

type problemsSolved struct {
	Data string `firebase:"data" json:"data"`
}

func getProblem(tdoc *firestore.DocumentRef) model.Problem {
	var t model.Problem
	snap, _ := tdoc.Get(globalCtx)
	snap.DataTo(&t)
	return t
}

func getUserSolvedProblems(group string, ID string) []byte {
	doc := storeClient.Doc("userdata/" + ID + "/problemsSolved/" + group)
	snap, err := doc.Get(globalCtx)
	if err != nil {
		return []byte{}
	}
	var probSol problemsSolved
	snap.DataTo(&probSol)
	data, _ := base64.StdEncoding.DecodeString(probSol.Data)
	return data
}

type problemWithID struct {
	model.Problem
	ID int `json:"id"`
}

// GiveProblems is public
func GiveProblems(w http.ResponseWriter, r *http.Request) {
	str, _ := ioutil.ReadAll(r.Body)
	var query struct {
		Group string   `json:"group"`
		Count int      `json:"count"`
		IDs   []string `json:"ids"`
	}
	json.Unmarshal(str, &query)
	counter := getCounter(storeClient.Doc("problems/" + query.Group))
	allprobs := make([]byte, (counter+5)/6)

	for _, id := range query.IDs {
		probs := getUserSolvedProblems(query.Group, id)
		for i := 0; i < len(probs); i++ {
			allprobs[i] &= probs[i]
		}
	}

	avaliable := 0

	for i := 0; i < counter; i++ {
		if allprobs[i/6]&(1<<allprobs[i%6]) == 0 {
			avaliable++
		}
	}

	indexes := []int{}
	rand.Seed(time.Now().UnixNano())
	for i := 0; i < query.Count; i++ {
		indexes = append(indexes, rand.Intn(avaliable-i))
		for j := 0; j < i; j++ {
			if indexes[j] >= indexes[i] {
				indexes[i]++
			}
		}
		sort.Ints(indexes)
	}

	problems := make([]problemWithID, 0, query.Count)
	for _, i := range indexes {
		problems = append(problems, problemWithID{ID: i, Problem: getProblem(storeClient.Doc("problems/" + query.Group + "/problems/" + strconv.Itoa(i)))})
	}
	resp, _ := json.Marshal(problems)
	fmt.Fprint(w, string(resp))
}

//ProcessAnswers process answers
func ProcessAnswers(w http.ResponseWriter, r *http.Request) {
	str, _ := ioutil.ReadAll(r.Body)
	var query struct {
		Group    string `json:"group"`
		ID       string `json:"id"`
		Problems []int  `json:"problems"`
		Answers  []bool `json:"answers"`
	}
	json.Unmarshal(str, &query)
	solved := getUserSolvedProblems(query.Group, query.ID)
	for i := 0; i < len(query.Answers); i++ {
		if query.Answers[i] {
			fmt.Fprintln(w, query.Problems[i])
			fmt.Fprintln(w, solved)
			if query.Problems[i]/6 >= len(solved) {
				solved = append(solved, make([]byte, query.Problems[i]/6-len(solved)+1)...)
				solved[query.Problems[i]/6] &= 1 << (byte(query.Problems[i] % 6))
			}
		}
	}
	fmt.Fprintln(w, "HelloWorld")
	fmt.Fprintln(w, solved)
	if len(solved) > 0 {
		storeClient.Doc("userdata/"+query.ID+"/problemsSolved/"+query.Group).
			Set(globalCtx, problemsSolved{
				Data: base64.StdEncoding.EncodeToString(solved),
			})
	}
}