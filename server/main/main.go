package main

import (
	"fmt"
	"log"
	"os"

	"github.com/orsenkucher/nothing/server/encio"
)

func main() {
	fmt.Println("go ready")
	if len(os.Args) < 2 {
		log.Fatalln("No password provided")
	}
	password := os.Args[1]
	key := encio.NewEncIO(password)
	cfg, err := key.GetConfig("cfg.json")
	if err != nil {
		log.Fatalln(err)
	}
	fmt.Println(cfg)
}
