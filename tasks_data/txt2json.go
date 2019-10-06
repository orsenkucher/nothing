package main

import (
	"encoding/json"
	"errors"
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
	// Hello       string   `col:"hello"`
}

func parse(data string, v interface{}) error {
	valPtr := reflect.ValueOf(v)
	if valPtr.Kind() != reflect.Ptr || valPtr.IsNil() {
		return errors.New("non-pointer passed to Parse")
	}

	val := valPtr.Elem()
	if val.Kind() != reflect.Slice {
		return errors.New("non-slice under pointer passed to Parse")
	}

	lines := strings.Split(data, "\n")
	for i := 0; i < len(lines); i++ {
		line := lines[i]
		// print(val.Kind())
		// print(val.Type().Elem().NumField())
		elemType := val.Type().Elem()
		// println(elemType.Kind())
		sub := reflect.New(elemType).Elem()
		// println(sub.Elem().NumField())
		// println(sub.Kind())
		// println(sub.Elem().Kind())
		// sub.ty
		if err := parseLine(line, sub); err != nil {
			panic(err)
		}
		val.Set(reflect.Append(val, sub))
	}

	return nil
}

func parseLine(line string, v reflect.Value) error {
	// fields := reflect.TypeOf(v)
	// print(fields.NumField())
	// values := reflect.ValueOf(&v)
	// print(v.Kind())
	fields := v.Type()
	// print(fields.NumField())
	values := v

	for i := 0; i < fields.NumField(); i++ {
		tag := fields.Field(i).Tag
		key := strings.Split(string(tag), ":")[0]
		indexer := tag.Get(key)
		value := values.Field(i)
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
	return nil
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

	var tasks []task
	// var tasks []task
	if err := parse(string(data), &tasks); err != nil {
		panic(err)
	}
	fmt.Println(tasks)

	b, err := json.Marshal(&tasks)
	check(err)
	// fmt.Println(string(b))

	bp, err := json.MarshalIndent(&tasks, "", "\t")
	// fmt.Println(string(bp))

	err = ioutil.WriteFile("parsed.json", b, 0)
	check(err)

	err = ioutil.WriteFile("pretty_parsed.json", bp, 0)
	check(err)

	// var sli []interface{}
	// sl := []int{1, 2, 3}
	// for i := 0; i < len(sl); i++ {
	// 	sli = append(sli, sl[i])
	// }
	// fmt.Println(sli)

	// byt := []byte(`{"num":6.13,"strs":["a","b"]}`)
	// var dat map[string]interface{}
	// if err := json.Unmarshal(byt, &dat); err != nil {
	// 	panic(err)
	// }
}
