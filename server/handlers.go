package server

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
)

// GetQues is hello world default route handler
func (s *Server) GetQues(w http.ResponseWriter, r *http.Request) {
	body, err := ioutil.ReadAll(r.Body)
	if err != nil {
		log.Println(err)
	}
	defer r.Body.Close()
	var req QRequest
	err = json.Unmarshal(body, &req)
	req.Print()
	if err != nil {
		log.Println(err)
	}

	s.ReceiveAns(req.Answers, req.UserID)
	ques := s.GiveQuestions(req.UserID, req.CurrentID)
	ques.Print("")
	quesj, err := json.Marshal(&ques)
	if err != nil {
		log.Println(err)
	}
	fmt.Fprint(w, string(quesj))
}
