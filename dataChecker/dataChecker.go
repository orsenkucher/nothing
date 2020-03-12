package dataChecker

import "github.com/orsenkucher/nothing/server"

type DataChecker struct {
	Server *server.Server
}

func (d *DataChecker) ShowUesrsAns(userid string) {
	ans := d.Server.UsersAns(userid)
	for _, a := range ans {
		a.Print()
	}
}
