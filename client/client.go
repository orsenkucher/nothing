package main

import (
	"bytes"
	"fmt"
	"io/ioutil"
	"net/http"
)

func main() {
	resp, _ := http.Post("https://us-central1-crystal-factory.cloudfunctions.net/HelloGet", "application/json", bytes.NewBufferString(`[{
		"question" : "Black",
		"explanation" : "Opposite",
		"answer" : [
			"white",
			"White"
		]
	}]`)) //*/
	r, _ := ioutil.ReadAll(resp.Body)

	fmt.Println(string(r))
}
