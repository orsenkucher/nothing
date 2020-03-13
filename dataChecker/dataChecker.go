package dataChecker

import (
	"fmt"

	"github.com/orsenkucher/nothing/server"
)

type DataChecker struct {
	Server *server.Server
}

func (d *DataChecker) ShowUesrsAns(userid string) {
	ans := d.Server.UsersAns(userid)
	for _, a := range ans {
		a.Print()
		d.Server.Questions[a.QID-1].Print()
	}
}

func (d *DataChecker) ShowQuestions() {
	for i, q := range d.Server.Questions {
		fmt.Print(i, "    ")
		q.Print()
		if q.ID != i+1 {
			for i := 0; i < 10; i++ {
				fmt.Println("PANIC question not on right position")
			}
		}
	}
}
