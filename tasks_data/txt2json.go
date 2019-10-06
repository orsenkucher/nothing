package main

import (
	"encoding/json"
	"fmt"
	"io/ioutil"
	"reflect"
	"regexp"
	"strings"
)

type user struct {
	Name string `name:"orsen"`
}

//  q: "Black", ans: ["white", "White"], exp: "Opposite"
type task struct {
	Question    string   `doc:"q"`
	Explanation string   `doc:"exp"`
	Answer      []string `col:"ans"`
}

func parse(data string) []task {
	tasks := []task{}
	lines := strings.Split(data, "\n")
	for i := 0; i < len(lines); i++ {
		line := lines[i]
		tasks = append(tasks, parseLine(line))
	}
	return tasks
}

func parseLine(line string) task {
	task := task{}
	fields := reflect.TypeOf(task)
	values := reflect.ValueOf(&task)
	for i := 0; i < fields.NumField(); i++ {
		tag := fields.Field(i).Tag
		key := strings.Split(string(tag), ":")[0]
		indexer := tag.Get(key)
		value := values.Elem().Field(i)
		switch key {
		case "doc":
			doc := cutDoc(line, indexer)
			value.SetString(doc)
			// fmt.Println(doc)
		case "col":
			col := cutCol(line, indexer)
			value.Set(reflect.ValueOf(col))
			// fmt.Println(col)
		}
	}
	// fmt.Println(task)
	return task
}

// q: "Black", ans: ["white", "White"], exp: "Opposite"
// exp:\s*"(.*?)"
func cutDoc(line, indexer string) string {
	pattern := indexer + ":\\s*\"(.*?)\""
	rx, err := regexp.Compile(pattern)
	check(err)
	cut := rx.FindStringSubmatch(line)[1]
	return cut
}

// q: "Black", ans: ["white", "White"], exp: "Opposite"
// ans:\s*\[(.*?)*?\]
func cutCol(line, indexer string) []string {
	pattern := indexer + ":\\s*\\[(.*?)*?\\]"
	rx, err := regexp.Compile(pattern)
	check(err)
	cuts := strings.Split(rx.FindStringSubmatch(line)[1], ",")

	for i := 0; i < len(cuts); i++ {
		cuts[i] = trim(cuts[i])
	}
	return cuts
}

func trim(s string) string {
	q := "\""
	return strings.TrimSpace(
		strings.TrimPrefix(
			strings.TrimSuffix(
				strings.TrimSpace(s), q), q))
}

func check(e error) {
	if e != nil {
		panic(e)
	}
}

func main() {
	data, err := ioutil.ReadFile("tasks.txt")
	check(err)

	tasks := parse(string(data))
	// fmt.Println(tasks)

	b, err := json.Marshal(&tasks)
	if err != nil {
		fmt.Println(err)
		return
	}
	fmt.Println(string(b))

	err = ioutil.WriteFile("parsed.json", b, 0)
}
