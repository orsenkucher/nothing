package server

import "fmt"

//Question is public
//leftn/rightn - Number of users answered left/right
type Question struct {
	ID       int    `json:"id"`
	Question string `json:"question"`
	Left     string `json:"left"`
	Right    string `json:"right"`
	Leftn    int    `json:"leftn"`
	Rightn   int    `json:"rightn"`
	Valid    bool   `json:"valid"`
	Changed  bool   `json:"changed"`
}

//User is public
type User struct {
	ID   string
	Done []byte `json:"done"`
}

func (q *Question) Print() {
	fmt.Print(q.Question)
	fmt.Println(" id: ", q.ID, "\nleft: ", q.Leftn, " right: ", q.Rightn)
}

func (u *User) Print() {
	fmt.Print("id: ", u.ID, " ")
	for _, b := range u.Done {
		for i := 0; i < 8; i++ {
			if b&(1<<i) != 0 {
				fmt.Print(1)
			} else {
				fmt.Print(0)
			}
		}
	}
	fmt.Println()
}
