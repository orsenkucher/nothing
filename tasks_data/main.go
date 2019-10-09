package main

import (
	"fmt"
	"io/ioutil"
	"net/http/httptest"
	"strings"

	"github.com/orsenkucher/crystalpuzzle/tasks"
	"github.com/orsenkucher/crystalpuzzle/txt2json"
)

func check(e error) {
	if e != nil {
		panic(e)
	}
}

func allWords(str string) []string {
	words := []string{}
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

func sergtch() {
	print("hello world")
	dat, err := ioutil.ReadFile("tasks.txt")
	check(err)
	lines := strings.Split(string(dat), "\n")

	fmt.Println("[")

	for i := 0; i < len(lines); i++ {
		words := allWords(lines[i])
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

func main() {
	// sergtch()
	// fmt.Println(roleA)
	// fmt.Println(roleB)
	// fmt.Println(roleC)
	// fmt.Println(roleD)

	// orsen := roleA | roleC // 01010
	// fmt.Println(orsen&roleA == roleA)
	// fmt.Println(orsen&roleB == roleB)

	// start := time.Now()
	// took := time.Since(start)
	// fmt.Printf("Call took %v milliseconds.", took.Nanoseconds())

	req := httptest.NewRequest("", "/", nil)
	rr := httptest.NewRecorder()
	tasks.CalcFibGo(rr, req)
	got := rr.Body.String()
	fmt.Println(got)

	// test int

	// orsen()
	// test()
}

type task struct {
	Question    string   `doc:"q"`
	Explanation string   `doc:"exp"`
	Answer      []string `col:"ans"`
}

func orsen() {
	data, err := ioutil.ReadFile("tasks.txt")
	if err != nil {
		panic(err)
	}

	var tasks []task
	if err := txt2json.Parse(string(data), &tasks); err != nil {
		panic(err)
	}
	fmt.Println(tasks)

	b, err := txt2json.ConvertToJSON(&tasks)
	if err != nil {
		panic(err)
	}
	fmt.Println(string(b))

	err = ioutil.WriteFile("parsed.json", b, 0)
	check(err)

	orsen2()
}

const (
	_ = iota
	one
	two
	tree
)

const (
	a = 1 << (iota * 10)
	b
	c
)

const (
	_ = 1 << iota
	roleA
	roleB
	roleC
	roleD
)

// Album describes album struct
// artist:"BROCKHAMPTON", tit: "GINGER", tags: ["2019", "12 songs", "44:12" "Hip-Hop/Rap"], story:"Ginger is the fifth studio album by American hip hop collective Brockhampton. It was released on August 23, 2019, through the band's label Question Everything and RCA."
type Album struct {
	Artist      string   `doc:"artist"`
	Title       string   `doc:"title"`
	Tags        []string `col:"ts"`
	Description string   `doc:"story"`
}

func orsen2() {
	fmt.Println("\n*** Orsen-2 ***")
	bytes, err := ioutil.ReadFile("orsen.data")
	if err != nil {
		panic(err)
	}
	data := string(bytes)
	// fmt.Println(data)
	var albums []Album
	err = txt2json.Parse(data, &albums)
	if err != nil {
		panic(err)
	}
	fmt.Println(albums)
	bytes, err = txt2json.ConvertToPrettyJSON(&albums)
	if err != nil {
		panic(err)
	}
	fmt.Println("******")
	fmt.Println(string(bytes))

	err = ioutil.WriteFile("orsen.json", bytes, 0)
	check(err)
}

// type myInt int

// func (mi *myInt) inc(add int) {
// 	*mi += myInt(add)
// }

// type myInt2 int

// func (mi2 *myInt2) inc(add int) {
// 	*mi2 += myInt2(add)
// }

// type incrementor interface {
// 	inc(add int)
// }

// func test() {
// 	mi := myInt(1)
// 	mi.inc(1)
// 	fmt.Println(mi)
// 	var i incrementor
// 	i = &mi
// 	i.inc(1)
// 	fmt.Println(i)
// 	mi2 := myInt2(6)
// 	i = &mi2
// 	i.inc(6)
// 	fmt.Println(myInt2(i))
// }
