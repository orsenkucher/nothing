package main

import (
	"fmt"
	"io/ioutil"
	"strings"
)

func validate() {
	bytes, _ := ioutil.ReadFile(filename)
	lines := strings.Split(string(bytes), "\n")
	for i, ln := range lines {
		if len(strings.Split(ln, "|")) != 3 {
			fmt.Println("Problem on ln:", i+1)
		}
	}
	for i, ln1 := range lines {
		for j, ln2 := range lines {
			if i < j && ln1 == ln2 {
				fmt.Printf("Duplication on ln:%v:%v\n", i+1, j+1)
			}
		}
	}
}
