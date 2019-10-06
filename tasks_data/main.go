package main

import (
	"fmt"
	"io/ioutil"
	"strings"
)

func check(e error) {
	if e != nil {
		panic(e)
	}
}

func getAllWords(str string) []string {
	var words []string = []string{}
	j := 0
	for j < len(str) {
		for j < len(str) && str[j] != '"' {
			j++
		}
		if j < len(str) {
			j++
			words = append(words, "")
			for str[j] != '"' {
				words[len(words)-1] += string(str[j])
				j++
			}
		}
		j++
	}
	return words
}

func main() {
	print("hello world")
	dat, err := ioutil.ReadFile("tasks.txt")
	check(err)
	lines := strings.Split(string(dat), "\n")

	fmt.Println("[")

	for i := 0; i < len(lines); i++ {
		words := getAllWords(lines[i])
		fmt.Println("\t{")
		fmt.Print("\t\t\"question\" : \"")
		fmt.Print(words[0])
		fmt.Println("\",")
		fmt.Print("\t\t\"explanation\" : \"")
		fmt.Print(words[len(words)-1])
		fmt.Println("\",")
		fmt.Println("\t\t\"answer\" : [")
		for j := 1; j < len(words)-1; j++ {
			fmt.Print("\t\t\t\"" + words[j] + "\"")
			if j != len(words)-2 {
				fmt.Println(",")
			} else {
				fmt.Println("")
			}
		}
		fmt.Println("\t\t]")
		fmt.Print("\t}")
		if i != len(lines)-1 {
			fmt.Println(",")
		} else {
			fmt.Println("")
		}
	}

	fmt.Println("]")
}
