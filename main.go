package main

import (
	"context"
	"flag"
	"fmt"
	"log"
	"net/http"
	"os"
	"os/signal"
	"syscall"
	"time"

	_ "github.com/GoogleCloudPlatform/cloudsql-proxy/proxy/dialers/postgres"
	"github.com/jinzhu/gorm"
	"github.com/orsenkucher/nothing/encio"
	"github.com/orsenkucher/nothing/server"
)

// Main loads db and handles functions realized in dir server
// in file
// in encio provided code that checks password written after flag -s
// functions in file server/handlers.go
//
// DataBase includes tables Questions an Users
// We save UsersAnswers in DataBase
// fields you can see in file server/types.go
//
// There is many to many connection between Users and Questions
// realised by table UsersAnswers

// Each function in server has proper name so mostly no need
// to explain each of them
// MMR for Users and answars is rank
// all calculations for MMR provided in file server/mmr.go

var pass string

func init() {
	const usage = "Provide encio password"
	flag.StringVar(&pass, "encio", "", usage)
	flag.StringVar(&pass, "s", "", usage+" (shorthand)")
}

func main() {
	var q = flag.Bool("q", false, "update cfg.enc and quit")

	if flag.Parse(); pass == "" {
		if pass = os.Getenv("encio"); pass == "" {
			log.Fatalln("No password provided")
		}
	}

	key := encio.NewEncIO(pass)
	cfg, err := key.GetConfig("secure/cfg.json")
	if err != nil {
		log.Fatalln(err)
	}

	if *q {
		_, err = key.ReadFile("secure/key.jks")
		if err != nil {
			log.Fatalln(err)
		}

		log.Println("`key.enc.jks` is used like `key.jks`")

		_, err = key.ReadFile("secure/key.properties")
		if err != nil {
			log.Fatalln(err)
		}

		log.Println("`key.enc.properties` is used like `key.secret.properties`")

		log.Println("Updated .enc files, quitting now")
		return
	}

	db := NewDB(cfg)
	defer db.Close()

	// s := server.StartUp(db)
	// fmt.Scanln()
	// d := dataChecker.DataChecker{Server: s}
	// d.ShowUesrsAns("ef360dec-2fa0-4e42-a1d7-be1c74c80822")
	// d.ShowQuestions()

	StartServer(db)
	log.Print("Server Exited Properly")
}

func StartServer(db *gorm.DB) {
	s := server.StartUp(db)

	done := make(chan os.Signal, 1)
	signal.Notify(done, os.Interrupt, syscall.SIGINT, syscall.SIGTERM)
	http.HandleFunc("/getQues", s.GetQuesHandler)
	http.HandleFunc("/adRegister", s.AdRegisterHandler)
	http.HandleFunc("/adReport", s.AdReportHandler)
	http.HandleFunc("/likeReport", s.LikeReportHandler)
	hsrv := &http.Server{
		Addr:    ":9091",
		Handler: nil, // use default mux
	}
	go func() {
		if err := hsrv.ListenAndServe(); err != nil && err != http.ErrServerClosed {
			log.Fatalf("listen: %s\n", err)
		}
	}()

	log.Print("Server Started")
	<-done
	log.Print("Server Stopped")

	ctx, cancel := context.WithTimeout(context.Background(), 5*time.Second)
	defer cancel()
	if err := hsrv.Shutdown(ctx); err != nil {
		log.Fatalf("Server Shutdown Failed:%+v", err)
	}
}

func NewDB(cfg encio.Config) *gorm.DB {
	dsn := fmt.Sprintf(
		"host=%s port=%d user=%s password=%s dbname=%s sslmode=disable",
		cfg["dbhost"].(string),
		int32(cfg["dbport"].(float64)),
		cfg["dbuser"].(string),
		cfg["dbpass"].(string),
		cfg["dbname"].(string),
	)
	db, err := gorm.Open(cfg["driver"].(string), dsn)
	if err != nil {
		log.Panicf("failed to connect database: %+v\n", err)
	}

	return db
}
