package main

import (
	"fmt"
	"io/ioutil"
	"strings"

	"github.com/orsenkucher/nothing/server/server"
)

func main() {
	dat, _ := ioutil.ReadFile("questions.txt")
	str := string(dat)
	lines := strings.Split(str, "\n")
	serv := server.Server{}
	serv.StartUp()
	for _, l := range lines {
		var question server.Question
		strs := strings.Split(l, "|")
		if len(strs) < 3 {
			fmt.Println("ALARM We miss ", l)
			continue
		}
		question.Question = strs[0]
		question.Left = strs[2]
		question.Right = strs[1]
		fmt.Println(question)
		serv.AddQuestion(question)
	}
}
