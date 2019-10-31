package model

//Problem is struct
type Problem struct {
	Question    string   `firebase:"question" json:"question"`
	Explanation string   `firebase:"explanation" json:"explanation"`
	Answers     []string `firebase:"answers" json:"answer"`
}
