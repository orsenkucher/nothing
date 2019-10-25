package tests

import (
	"fmt"
	"testing"

	"github.com/orsenkucher/crystalpuzzle/core"
)

type user struct {
	name    string
	surname string
	age     int
	tags    []string
}

func (u *user) ToMap() map[string]interface{} {
	m := core.ValueMap{
		"Name":    u.name,
		"Surname": u.surname,
		"Age":     u.age,
		"Tags":    u.tags,
	}
	fmt.Println(m)
	core.TidyMap(&m)
	return m
}

func TestTidyMap(*testing.T) {
	st := user{
		name: "Orsen",
		age:  20,
		// tags: []string{"tag1", "tag2"},
	}

	m := st.ToMap()
	fmt.Println(m)
}
