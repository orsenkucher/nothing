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

type QBTreeNode struct {
	Question Question    `json:"question"`
	Left     *QBTreeNode `json:"left"`
	Right    *QBTreeNode `json:"right"`
}

type QRequest struct {
	CurrentID int           `json:"currentid"`
	UserID    string        `json:"userid"`
	Answers   []AnswerStats `json:"answers"`
}

type User struct {
	ID   string `gorm:"primary_key"`
	MMR  int
	Done []AnswerInf `gorm:"foreignkey:UserID;association_foreignkey:ID"`
}

type AnswerStats struct {
	gorm.Model
	QID     int    `json:"qid"`
	Tries   int    `json:"tries"`
	Seconds int    `json:"seconds"`
	Answers string `json:"answers"`
}

type AnswerInf struct {
	AnswerStats
	UserID string
}

func (qt *QBTreeNode) Print(st string) {
	fmt.Print(st)
	qt.Question.Print()
	if qt.Left != nil {
		qt.Left.Print(st + "\t")
	}
	if qt.Right != nil {
		qt.Right.Print(st + "\t")
	}
}

func (q *QRequest) Print() {
	fmt.Println("QRequest")
	fmt.Println("current:", q.CurrentID, "userid:", q.UserID)
	for _, ans := range q.Answers {
		ans.Print()
	}
}

func (a *AnswerInf) Print() {
	fmt.Println("uid: ", a.UserID, " qid: ", a.QID, " sec: ", a.Seconds)
}

func (a *AnswerStats) Print() {
	fmt.Println("qid: ", a.QID, " sec: ", a.Seconds, " tries: ", a.Tries)
}

func (q *Question) Print() {
	fmt.Println(q.ID, "\tdif:\t", q.MMR, "\t", q.Question)
}

func (u *User) Print() {
	fmt.Println("uid: ", u.ID, "mmr:", u.MMR)
}
