package server

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"
)

// GetQuesHandler is hello world default route handler
func (s *Server) GetQuesHandler(w http.ResponseWriter, r *http.Request) {
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

	if req.CurrentID > len(s.Questions) || req.CurrentID < -1 {
		w.WriteHeader(205)
	} else {
		ques := s.GiveQuestions(req.UserID, req.CurrentID)
		ques.Print("")
		quesj, err := json.Marshal(&ques)
		if err != nil {
			log.Println(err)
		}
		fmt.Fprint(w, string(quesj))
	}
}

func (s *Server) AdRegisterHandler(w http.ResponseWriter, r *http.Request) {
	body, err := ioutil.ReadAll(r.Body)
	if err != nil {
		log.Println(err)
	}
	defer r.Body.Close()
	var req struct {
		UserID string `json:"userid"`
	}
	err = json.Unmarshal(body, &req)
	var resp struct {
		AdMode int `json:"admode"`
	}
	resp.AdMode = s.AdRegister(req.UserID)
	if err != nil {
		log.Println(err)
	}
	bytes, _ := json.Marshal(resp)
	fmt.Fprint(w, string(bytes))
}

func (s *Server) AdReportHandler(w http.ResponseWriter, r *http.Request) {
	body, err := ioutil.ReadAll(r.Body)
	if err != nil {
		log.Println(err)
	}
	defer r.Body.Close()
	var req struct {
		UserID string `json:"userid"`
		AdType int    `json:"adtype"`
	}
	err = json.Unmarshal(body, &req)
	if err != nil {
		log.Println(err)
	}
	s.AdReport(req.UserID, req.AdType)

	w.WriteHeader(200)
}
