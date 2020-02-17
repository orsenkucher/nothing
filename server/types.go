package server

import (
	"fmt"

	"github.com/jinzhu/gorm"
)

type ID struct {
	ID int
}

type Question struct {
	ID          int    `json:"id" gorm:"primary_key"`
	Question    string `json:"question"`
	Explanation string `json:"explanation"`
	Answers     string `json:"answers"`
	MMR         int    `json:"mmr"`
}

type User struct {
	ID   string `gorm:"primary_key"`
	MMR  int
	Done []AnswerInf `gorm:"foreignkey:UserID;association_foreignkey:ID"`
}

type AnswerStats struct {
	gorm.Model
	QID     int
	Tries   int
	Seconds int
}

type AnswerInf struct {
	AnswerStats
	UserID string
}

func (a *AnswerInf) Print() {
	fmt.Print("uid: ", a.UserID, " qid: ", a.QID, " sec: ", a.Seconds)
}

func (q *Question) Print() {
	fmt.Println(q.ID, " dif: ", q.MMR, " ", q.Question)
}

func (u *User) Print() {
	fmt.Println("uid: ", u.ID, "mmr:", u.MMR)
}
