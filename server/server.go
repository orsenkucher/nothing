package server

import (
	"fmt"
	"io/ioutil"
	"math/rand"
	"strings"

	"github.com/jinzhu/gorm"
)

type Server struct {
	DB        *gorm.DB
	Questions []Question
	Qiters    []*Question
	Users     map[string]*User
}

func StartUp(db *gorm.DB) *Server {
	server := Server{DB: db}
	server.DB.AutoMigrate(&Question{})
	server.DB.AutoMigrate(&User{})
	server.DB.AutoMigrate(&AnswerInf{})
	server.DB.Find(&server.Questions)
	server.Users = map[string]*User{}
	var usersList []User
	server.DB.Find(&usersList)

	for _, user := range usersList {
		server.Users[user.ID] = &user
	}
	server.UpdateData()

	sort(server.Questions, 0, len(server.Questions))
	server.Qiters = make([]*Question, len(server.Questions))
	for i := range server.Questions {
		server.Qiters[server.Questions[i].ID] = &server.Questions[i]
	}

	server.ShowStatus()
	return &server
}

func (s *Server) UsersAns(id string) []AnswerInf {
	user, ok := s.Users[id]
	if !ok {
		user = &User{ID: id, MMR: 3000}
		s.DB.Create(&user)
		s.Users[id] = user
		return []AnswerInf{}
	}
	var ans []AnswerInf
	s.DB.Model(&user).Related(&[]AnswerInf{}).Find(&ans)
	return ans
}

func (s *Server) ReceiveAns(answers []AnswerStats, userid string) {
	_, ok := s.Users[userid]
	if !ok {
		s.UsersAns(userid)
	}
	for _, answer := range answers {
		user := s.Users[userid]
		question := s.Qiters[answer.QID]
		ansinf := AnswerInf{AnswerStats: answer, UserID: userid}
		s.DB.Create(&ansinf)
		ChangeRate(question, user, &ansinf)
		s.DB.Model(user).Update(user)
		s.DB.Model(question).Update(question)
	}
}

func getClosest(sortedq []Question, mmr int) int {
	i := 0
	j := 0
	for k := range sortedq {
		if sortedq[k].MMR < mmr {
			i = k
		}
	}
	j = i + 1

	for i != -1 && sortedq[i].MMR == -1 {
		i--
	}
	for j != len(sortedq) && sortedq[i].MMR == -1 {
		j++
	}

	if j == len(sortedq) {
		return i
	}
	if i == -1 {
		return j
	}
	if mmr-sortedq[i].MMR < sortedq[j].MMR-mmr {
		return i
	}
	return j
}

func getNextQuestions(sortedq []Question, user *User, current int) (int, int) {
	ud1, _ := CountRateChange(&sortedq[current], user, &AnswerInf{AnswerStats: AnswerStats{Seconds: 50}})
	ud2, _ := CountRateChange(&sortedq[current], user, &AnswerInf{AnswerStats: AnswerStats{Seconds: 150}})
	return getClosest(sortedq, user.MMR+int(ud1)), getClosest(sortedq, user.MMR+int(ud2))
}

/*
Give tree of question in one list
inexes of question represtented below
	    0
	   / \
	 1     2
	/ \   / \
   3   4 5   6
move left for bad ans and move right for good answer
answer is bad if it took over 100 seconds
*/
func (s *Server) GiveQuestions(userid string, current int) []Question {
	ans := s.UsersAns(userid)
	toSend := make([]Question, 0, 7)
	possibleQue := make([]Question, 0, len(s.Questions)-len(ans))
	for _, q := range s.Questions {
		for _, a := range ans {
			if a.QID == q.ID {
				q.ID = -1
			}
		}
		possibleQue = append(possibleQue, q)
	}
	user := s.Users[userid]

	if current == -1 {
		current = getClosest(possibleQue, user.MMR)
	}
	toSend = append(toSend, possibleQue[current])
	possibleQue[current].ID = -1

	for i := 0; i < 3; i++ {
		i1, i2 := getNextQuestions(possibleQue, user, toSend[i].ID)
		toSend = append(toSend, possibleQue[i1], possibleQue[i2])
		possibleQue[i1].ID = -1
		possibleQue[i2].ID = -1
	}

	return toSend
}

func sort(que []Question, a int, b int) {
	if a+1 != b {
		sort(que, a, a+(b-a)/2)
		sort(que, a+(b-a)/2, b)
		i := a
		j := a + (b-a)/2
		questions := make([]Question, b-a)
		for t := 0; t < b-a; t++ {
			if i == a+(b-a)/2 {
				questions[t] = que[j]
				j++
				continue
			}
			if j == b {
				questions[t] = que[i]
				i++
				continue
			}
			if que[i].MMR < que[j].MMR {
				questions[t] = que[i]
				i++
			} else {
				questions[t] = que[j]
				j++
			}
		}
		for t := 0; t < b-a; t++ {
			que[a+t] = questions[t]
		}
	}
}

func (s *Server) UpdateQuestion(question *Question) {
	b := false
	for _, q := range s.Questions {
		b = b || q.Question == question.Question
	}
	if !b {
		s.DB.Create(question)
		s.Questions = append(s.Questions, *question)
	}
}

func (s *Server) UpdateData() {
	fmt.Println(0)
	data, _ := ioutil.ReadFile("./data/questions.txt")
	lines := strings.Split(string(data), "\n")
	for _, line := range lines {
		if len(s.Questions) > 10 {
			break
		}
		parts := strings.Split(line, "|")
		if len(parts) < 3 {
			continue
		}
		var question Question
		question.MMR = rand.Intn(100)
		question.Question = parts[0]
		question.Explanation = parts[1]
		question.Answers = parts[2]
		s.UpdateQuestion(&question)
	}
}

func (s *Server) ClearBase() {
	s.DB.DropTableIfExists("users")
	s.DB.DropTableIfExists("questions")
	s.DB.DropTableIfExists("answer_infs")
}

func (s *Server) ShowStatus() {
	fmt.Println("Questions")
	for _, q := range s.Questions {
		q.Print()
	}
	fmt.Println("Users")
	for _, u := range s.Users {
		u.Print()
	}
}
