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
	"github.com/GoogleCloudPlatform/cloudsql-proxy/proxy/proxy"
	"github.com/jinzhu/gorm"
	"github.com/orsenkucher/nothing/encio"
	"github.com/orsenkucher/nothing/server"

	"golang.org/x/oauth2/google"
)

var pass string

func init() {
	const usage = "Provide encio password"
	flag.StringVar(&pass, "encio", "", usage)
	flag.StringVar(&pass, "s", "", usage+" (shorthand)")
}

func main() {
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
	db := NewDB(key, cfg)
	defer db.Close()

	s := server.StartUp(db)
	//s.ClearBase()
	//fmt.Println("cleared")

	done := make(chan os.Signal, 1)
	signal.Notify(done, os.Interrupt, syscall.SIGINT, syscall.SIGTERM)
	http.HandleFunc("/", s.GetQues)
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
	log.Print("Server Exited Properly")
}

//NewDB is public
func NewDB(key encio.EncIO, cfg encio.Config) *gorm.DB {
	bytes, err := key.ReadFile(cfg["dbcred"].(string))
	if err != nil {
		log.Fatalln(err)
	}
	jwt, err := google.JWTConfigFromJSON(bytes, proxy.SQLScope)
	if err != nil {
		log.Fatalln(err)
	}
	ctx := context.Background()
	client := jwt.Client(ctx)
	if err != nil {
		log.Fatalln(err)
	}
	proxy.Init(client, nil, nil)

	dsn := fmt.Sprintf("host=%s dbname=%s user=%s password=%s sslmode=disable",
		cfg["dbhost"], cfg["dbname"], cfg["dbuser"], cfg["dbpass"])
	db, err := gorm.Open(cfg["driver"].(string), dsn)
	if err != nil {
		log.Fatalln(err)
	}
	return db
}
