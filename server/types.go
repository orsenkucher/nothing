package server

import (
	"fmt"

	"github.com/jinzhu/gorm"
)

const (
	ShortAd = iota
	LongAd
	RewardedAd
)

type ID struct {
	ID int
}

type NoQuestion struct {
	ID          int    `json:"id" gorm:"primary_key"`
	Question    string `json:"question"`
	Explanation string `json:"explanation"`
	Answers     string `json:"answers"`
	MMR         int    `json:"mmr"`
	Likes       int    `json:"likes"`
	Dislikes    int    `json:"dislikes"`
	Neutral     int    `json:"neutral"`
	Valid       bool   `json:"valid"`
}

type QBTreeNode struct {
	Question NoQuestion    `json:"question"`
	Left     *QBTreeNode `json:"left"`
	Right    *QBTreeNode `json:"right"`
}

type QRequest struct {
	CurrentID int           `json:"currentid"`
	UserID    string        `json:"userid"`
	Answers   []AnswerStats `json:"answers"`
}

type NoUser struct {
	ID         string `gorm:"primary_key"`
	AdMode     int
	ShortAd    int
	LongAd     int
	RewardedAd int
	MMR        int
	Done       []NoAnswerInf `gorm:"foreignkey:UserID;association_foreignkey:ID"`
}

type AnswerStats struct {
	gorm.Model
	QID     int    `json:"qid"`
	Tries   int    `json:"tries"`
	Seconds int    `json:"seconds"`
	Answers string `json:"answers"`
}

type NoAnswerInf struct {
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

func (a *NoAnswerInf) Print() {
	fmt.Println("uid: ", a.UserID, " qid: ", a.QID, " sec: ", a.Seconds)
}

func (a *AnswerStats) Print() {
	fmt.Println("qid: ", a.QID, " sec: ", a.Seconds, " tries: ", a.Tries)
}

func (q *NoQuestion) Print() {
	fmt.Println(q.ID, "\tdif:\t", q.MMR, "\t", q.Question)
}

func (u *NoUser) Print() {
	fmt.Println("uid: ", u.ID, " mmr:", u.MMR, " admode: ", u.AdMode)
	fmt.Println("Long: ", u.LongAd, " Short:", u.ShortAd, " Rewarded: ", u.RewardedAd)
}
