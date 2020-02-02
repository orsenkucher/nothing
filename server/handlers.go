package server

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
	"strconv"
)

// QRequest represents questions request bundled with previous answers
type QRequest struct {
	N       int
	UserID  string
	Answers map[string]bool
}

// GetQues is hello world default route handler
func (s *Server) GetQues(w http.ResponseWriter, r *http.Request) {
	body, err := ioutil.ReadAll(r.Body)
	if err != nil {
		log.Println(err)
	}
	defer r.Body.Close()
	var req QRequest
	err = json.Unmarshal(body, &req)
	if err != nil {
		log.Println(err)
	}
	log.Println(req)
	mappedmap := make(map[int]bool)
	for k, v := range req.Answers {
		key, _ := strconv.Atoi(k)
		mappedmap[key] = v
	}
	s.ReceiveAns(req.UserID, mappedmap)
	ques := s.GiveQuestions(req.UserID, req.N)
	quesj, err := json.Marshal(&ques)
	if err != nil {
		log.Println(err)
	}
	fmt.Fprint(w, string(quesj))
}
