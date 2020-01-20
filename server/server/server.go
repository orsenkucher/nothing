package server

import (
	"container/list"
	"context"
	"encoding/base64"
	"fmt"
	"log"
	"strconv"
	"time"

	"cloud.google.com/go/firestore"
	firebase "firebase.google.com/go"
	"google.golang.org/api/option"
)

//Server is public
type Server struct {
	Que    *list.List
	Users  map[string]*User
	client *firestore.Client
	ctx    context.Context
}

//Question is public
//leftn/rightn - Number of users answered left/right
type Question struct {
	ID       int    `firebase:"id" json:"id"`
	Question string `firebase:"question" json:"question"`
	Left     string `firebase:"left" json:"left"`
	Right    string `firebase:"right" json:"right"`
	Leftn    int    `firebase:"leftn" json:"leftn"`
	Rightn   int    `firebase:"rightn" json:"rightn"`
	Valid    bool   `firebase:"valid" json:"valid"`
	Changed  bool   `firebase:"changed" json:"changed"`
}

//User is public
type User struct {
	Done []byte `firebase:"done" json:"done"`
}

//StartUp is public
func (s *Server) StartUp() {
	s.ctx = context.Background()
	sa := option.WithCredentialsFile("creds.json")
	app, err := firebase.NewApp(s.ctx, nil, sa)
	if err != nil {
		log.Fatalln(err)
	}

	s.client, err = app.Firestore(s.ctx)
	if err != nil {
		log.Fatalln(err)
	}
	s.Load()
	go s.saveloop()
	fmt.Println("Startup")
	s.ShowStatus()
}

func (s *Server) saveloop() {
	time.Sleep(time.Minute * 1)
	for {
		s.Save()
		time.Sleep(time.Minute * 10)
	}
}

func (s *Server) getUser(id string) *User {
	user, ok := s.Users[id]
	if !ok {
		s.Users[id] = &User{Done: []byte{}}
		user, _ = s.Users[id]
	}
	s.client.Doc("Users/"+id).Set(s.ctx, user)
	return user
}

//GiveQuestions is public
func (s *Server) GiveQuestions(id string, n int) []Question {
	question := s.Que.Front()
	ans := []Question{}

	user := s.getUser(id)

	for i := 0; i < s.Que.Len() && len(ans) < n; i++ {
		q := question.Value.(Question)

		if len(user.Done)*8 <= q.ID || user.Done[q.ID/8]&(1<<uint(q.ID%8)) == 0 && q.Valid {
			ans = append(ans, q)
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
			ans = append(ans, q)
			if question.Next() != nil {
				question = question.Next()
				s.Que.MoveToBack(question.Prev())
			}
		} else {
			question = question.Next()
		}
	}

	log.Println(ans)
	return ans
}

//ReceiveAns is public
//right ans == true
//left ans == false
func (s *Server) ReceiveAns(userid string, answers map[int]bool) {
	user := s.getUser(userid)
	for id, ans := range answers {
		if len(user.Done)*8 <= id {
			user.Done = append(user.Done, make([]byte, id/8+1-len(user.Done))...)
		}
		user.Done[id/8] |= 1 << uint(id%8)
		q := s.Que.Front()
		for {
			if q.Value.(Question).ID == id {
				question := q.Value.(Question)
				question.Changed = true
				if ans {
					question.Rightn++
				} else {
					question.Leftn++
				}
				q.Value = question
			}
			if q == s.Que.Back() {
				break
			}
			q = q.Next()
		}
	}
}

//Save is public
func (s *Server) Save() {
	log.Println("Saving..")
	q := s.Que.Front()
	for s.Que.Len() > 0 {
		s.client.Doc("Questions/"+strconv.Itoa(q.Value.(Question).ID)).Set(s.ctx, q.Value.(Question))
		if q == s.Que.Back() {
			break
		}
		q = q.Next()
	}

	// for id, user := range s.Users {
	// 	userdata := struct {
	// 		Done string `firebase:"done" json:"done"`
	// 	}{Done: base64.StdEncoding.EncodeToString(user.Done)}
	// 	s.client.Doc("Users/"+id).Set(s.ctx, userdata)
	// }
}

//Load loads from firestore
func (s *Server) Load() {
	iter := s.client.Collection("Questions").Documents(s.ctx)
	docs, err := iter.GetAll()
	s.Que = list.New()
	if err != nil {
		print(err)
	}
	for _, doc := range docs {
		question := Question{}
		doc.DataTo(&question)
		question.Changed = false
		s.Que.PushBack(question)
	}
	iter = s.client.Collection("Users").Documents(s.ctx)
	docs, err = iter.GetAll()
	s.Users = map[string]*User{}
	if err != nil {
		print(err)
	}
	for _, doc := range docs {
		userdata := struct {
			Done string `firebase:"done" json:"done"`
		}{}
		doc.DataTo(&userdata)
		bytes, err := base64.StdEncoding.DecodeString(userdata.Done)
		if err != nil {
			print(err)
		}
		s.Users[doc.Ref.ID] = &User{Done: bytes}
	}
}

//ShowStatus shows current status
func (s *Server) ShowStatus() {
	fmt.Println("Questions Lnegth: ", s.Que.Len())

	q := s.Que.Front()
	for q != nil {
		fmt.Print(strconv.Itoa(q.Value.(Question).ID) + " ")
		q = q.Next()
	}
	fmt.Println()

	fmt.Println("Users:")

	for k, v := range s.Users {
		fmt.Println(k+" ", v.Done)
	}
}

//AddQuestion is public
func (s *Server) AddQuestion(q Question) {
	q.ID = s.Que.Len()
	q.Leftn = 0
	q.Rightn = 0
	q.Valid = true
	q.Changed = false
	s.Que.PushFront(q)
	s.client.Doc("Questions/"+strconv.Itoa(q.ID)).Set(s.ctx, q)
}

//TList is public
func TList() {
	l := list.New()
	l.PushBack(1)
	l.PushBack(2)
	l.PushBack(3)
	fmt.Print(l.Front().Value.(int) + 5)
	fmt.Print(l.Front().Next().Value)
	fmt.Print(l.Front().Next().Next().Value)
	fmt.Print(l.Back().Value)
}
