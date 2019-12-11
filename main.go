package main

import (
	"bytes"
	"context"
	"encoding/json"
	"fmt"
	"io/ioutil"
	"log"
	"net/http"

	firebase "firebase.google.com/go"
	"github.com/orsenkucher/nothing/core"
	"github.com/orsenkucher/nothing/fbclients"
	"github.com/orsenkucher/nothing/txt2json"
	"google.golang.org/api/option"
)

// State is test data
type State struct {
	Capital    string  `firestore:"capital"`
	Population float64 `firestore:"pop"` // in millions
}

func main() {
	// fn0()
	// fn1()
	// fn2()

	ctx := context.Background()
	sa := option.WithCredentialsFile("creds.json")
	app, err := firebase.NewApp(ctx, nil, sa)
	if err != nil {
		log.Fatalln(err)
	}

	client, err := app.Firestore(ctx)
	if err != nil {
		log.Fatalln(err)
	}
	defer client.Close()

	client.Doc("orsen/hello").Set(ctx, State{
		Capital:    "Albany",
		Population: 19.8,
	})

	fmt.Println("done")
	// http.HandleFunc("/", HelloServer)
	// fmt.Println("Serving...")
	// http.ListenAndServe(":9090", nil)
}

// HelloServer is hello world default route handler
func HelloServer(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello, %s!", r.URL.Path[1:])
}

type problem struct {
	Question    string   `doc:"q" json:"question"`
	Explanation string   `doc:"exp" json:"explanation"`
	Answer      []string `col:"ans" json:"answers"`
}

func fn2() {
	fbclients.SendData()
}

func fn1() {
	// fmt.Println(string([]rune("😴")))

	bytes, err := ioutil.ReadFile("txt2json/problems.txt")
	core.Check(err)
	// fmt.Printf("%+q\n", bytes)

	var problems []problem
	// prep := fmt.Sprintf("%+q\n", bytes)
	// print(prep)
	err = txt2json.Parse(string(bytes), &problems)
	core.Check(err)

	fmt.Println(problems)

	b, err := txt2json.ConvertToPrettyJSON(&problems)
	core.Check(err)
	fmt.Println(string(b))

	// err = ioutil.WriteFile("txt2json/parsed.json", b, 0)
	// core.Check(err)
	err = ioutil.WriteFile("functions/data/problems.json", b, 0)
	core.Check(err)

	// fl, err := os.Create("txt2json/parsed.json")
	// core.Check(err)
	// n, err := fl.WriteString(string(b))
	// core.Check(err)
	// err = fl.Close()
	// core.Check(err)
	// print(n)
}

func fn0() {
	fmt.Println(string([]byte{123, 34, 105, 100, 34, 58, 32, 34, 52, 86, 70, 116, 106, 106, 122, 108, 109, 83, 103, 108, 82, 97, 69, 81, 52, 112, 53, 98, 55, 122, 100, 65, 81, 120, 111, 49, 34, 44, 32, 34, 103, 114, 111, 117, 112, 34, 58, 32, 34, 108, 111, 103, 105, 99, 34, 44, 32, 34, 115, 117, 109, 109, 97, 114, 121,
		34, 58, 123, 34, 50, 49, 34, 58, 116, 114, 117, 101, 44, 34, 52, 56, 34, 58, 102, 97, 108, 115, 101, 44, 34, 54, 48, 34, 58, 102, 97, 108, 115, 101, 44, 34, 54, 51, 34, 58, 102, 97, 108, 115, 101, 125}))
	//fmt.Println(base64.StdEncoding.DecodeString("AgE="))
	//fmt.Println(base64.StdEncoding.EncodeToString([]byte{1, 2, 3, 4, 5}))
	query := struct {
		Group   string       `json:"group"`
		ID      string       `json:"id"`
		Summary map[int]bool `json:"summary"`
	}{
		Group: "logic",
		ID:    "4VFtjjzlmSglRaEQ4p5b7zdAQxo1",
	}

	query.Summary = make(map[int]bool)
	query.Summary[1] = true
	query.Summary[123] = true
	query.Summary[7] = true

	strb, _ := json.Marshal(&query)
	fmt.Println(string(strb))
	resp, _ := http.Post("https://us-central1-crystal-factory.cloudfunctions.net/ProcessAnswers", "application/json", bytes.NewBuffer(strb))
	body, _ := ioutil.ReadAll(resp.Body)
	fmt.Println(string(body))
}
