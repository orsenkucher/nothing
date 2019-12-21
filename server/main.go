package main

import (
	"fmt"

	"github.com/orsenkucher/nothing/server/server"
)

func main() {
	/*users := map[string]server.User{}
	users["0"] = server.User{Done: []byte{}}
	user, _ := users["0"]
	user.Done = []byte{1, 2}
	user, _ = users["0"]
	fmt.Print(user.Done)//*/
	s := server.Server{}
	s.StartUp()
	s.AddQuestion(server.Question{
		ID:       1,
		Question: "?",
		Left:     "L",
		Right:    "R",
		Leftn:    5,
		Rightn:   6,
		Valid:    true,
		Changed:  false,
	})
	//fmt.Println(s.Que.Front().Value.(server.Question).Changed)
	fmt.Println(s.Que.Front().Value.(server.Question))
	fmt.Println(s.GiveQuestions("Sergey", 2))
	s.ReceiveAns("Sergey", []int{9, 8}, []bool{true, false})
	s.ShowStatus()
	s.Save()
	//*/
}
