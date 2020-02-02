package sqlserver

import (
	"container/list"
	"fmt"
	"io/ioutil"
	"strings"

	"github.com/jinzhu/gorm"
)

type Server struct {
	DB    *gorm.DB
	Que   *list.List
	Users map[string][]byte
}

func (s *Server) getUser(id string) *User {
	done, ok := s.Users[id]
	if !ok {
		s.Users[id] = []byte{}
		done = s.Users[id]
		s.DB.Create(&User{Done: done, ID: id})
	}
	return &User{Done: done, ID: id}
}

func (s *Server) GiveQuestions(id string, n int) []*Question {
	question := s.Que.Front()
	ans := []*Question{}
	user := s.getUser(id)

	for i := 0; i < s.Que.Len() && len(ans) < n; i++ {
		q := question.Value.(Question)

		if (len(user.Done)*8 <= q.ID || user.Done[q.ID/8]&(1<<uint(q.ID%8)) == 0) && q.Valid {
			ans = append(ans, &q)
			if question.Next() != nil {
				question = question.Next()
				s.Que.MoveToBack(question.Prev())
			}
		} else {
			question = question.Next()
		}
	}
	question = s.Que.Front()

	for i := 0; i < s.Que.Len() && len(ans) < n; i++ {
		q := question.Value.(Question)

		if q.Valid {
			ans = append(ans, &q)
			if question.Next() != nil {
				question = question.Next()
				s.Que.MoveToBack(question.Prev())
			}
		} else {
			question = question.Next()
		}
	}
	return ans
}

func (s *Server) ReceiveAns(userid string, answers map[int]bool) {
	user := s.getUser(userid)
	for id, ans := range answers {
		if len(user.Done)*8 <= id {
			user.Done = append(user.Done, make([]byte, id/8+1-len(user.Done))...)
		}
		user.Done[id/8] |= 1 << uint(id%8)
		for q := s.Que.Front(); q != nil; q = q.Next() {
			if q.Value.(Question).ID == id {
				question := q.Value.(Question)
				question.Changed = true
				if ans {
					question.Rightn++
				} else {
					question.Leftn++
				}
				q.Value = question
				s.DB.Model(&question).Update(question)
				break
			}
		}
	}
	s.Users[user.ID] = user.Done
	s.DB.Model(&user).Update(user)
}

func (s *Server) Load() {
	s.DB.AutoMigrate(Question{})
	s.DB.AutoMigrate(User{})
	s.Que = list.New()
	s.Users = make(map[string][]byte)
	var questions []Question
	s.DB.Find(&questions)
	for _, question := range questions {
		s.Que.PushBack(question)
	}
	var users []User
	s.DB.Find(&users)
	for _, user := range users {
		s.Users[user.ID] = user.Done
	}
	s.UpdateQuestions("./data/questions.txt")
}

func (s *Server) AddQuestion(question *Question) {
	b := true
	for q := s.Que.Front(); q != nil; q = q.Next() {
		b = b && (q.Value.(Question).Question != question.Question)
	}

	if b {
		question.ID = s.Que.Len() + 1
		question.Valid = true
		fmt.Println("add new")
		fmt.Println(question)
		s.DB.Create(question)
		s.Que.PushBack(*question)
	}
}

func (s *Server) UpdateQuestions(filename string) {
	dat, _ := ioutil.ReadFile(filename)
	str := string(dat)
	lines := strings.Split(str, "\n")
	for _, l := range lines {
		var question Question
		strs := strings.Split(l, "|")
		if len(strs) < 3 {
			fmt.Println("ALARM We miss ", l)
			continue
		}
		question.Question = strs[0]
		question.Left = strs[2]
		question.Right = strs[1]
		s.AddQuestion(&question)
		if s.Que.Len() > 6 {
			break
		}
	}
}

func (s *Server) ShowStatus() {
	fmt.Println("base\nquestions")
	var questions []Question
	s.DB.Find(&questions)
	for _, q := range questions {
		q.Print()
	}
	fmt.Println("users")
	var users []User
	s.DB.Find(&users)
	for _, u := range users {
		u.Print()
	}
	s.ShowQue()
}

func (s *Server) ClearBase() {
	s.DB.DropTable("questions")
	s.DB.DropTable("users")
}

func (s *Server) ShowQue() {
	fmt.Println("que")
	for q := s.Que.Front(); q != nil; q = q.Next() {
		fmt.Print(q.Value.(Question).ID)
	}
	fmt.Println()
}
