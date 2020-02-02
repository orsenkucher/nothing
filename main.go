package main

import (
	"context"
	"flag"
	"fmt"
	"log"
	"os"

	_ "github.com/GoogleCloudPlatform/cloudsql-proxy/proxy/dialers/postgres"
	"github.com/GoogleCloudPlatform/cloudsql-proxy/proxy/proxy"
	"github.com/jinzhu/gorm"
	"github.com/orsenkucher/nothing/encio"
	"github.com/orsenkucher/nothing/server/sqlserver"

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

	server := &sqlserver.Server{DB: db}
	server.ClearBase()
	server.Load()
	test(server)
	server.ShowStatus()
}

func test(server *sqlserver.Server) {
	fmt.Println(len(server.GiveQuestions("1", 4)))
	server.ShowQue()
	fmt.Println(len(server.GiveQuestions("2", 5)))
	server.ShowQue()
	server.ReceiveAns("1", map[int]bool{1: true, 2: false, 3: true, 4: true})
	fmt.Println(len(server.GiveQuestions("1", 4)))
	server.ShowQue()
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
