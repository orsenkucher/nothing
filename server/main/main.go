package main

import (
	"context"
	_ "database/sql"
	"flag"
	"fmt"
	"log"
	"os"
	"time"

	_ "github.com/GoogleCloudPlatform/cloudsql-proxy/proxy/dialers/postgres"
	"github.com/GoogleCloudPlatform/cloudsql-proxy/proxy/proxy"
	"github.com/jinzhu/gorm"
	"github.com/orsenkucher/nothing/server/encio"

	"golang.org/x/oauth2/google"
)

var pass string

func init() {
	const usage = "Provide encio password"
	flag.StringVar(&pass, "encio", "", usage)
	flag.StringVar(&pass, "e", "", usage+" (shorthand)")
}

func main() {
	if flag.Parse(); pass == "" {
		if pass = os.Getenv("encio"); pass == "" {
			log.Fatalln("No password provided")
		}
	}
	key := encio.NewEncIO(pass)
	cfg, err := key.GetConfig("cfg.json")
	if err != nil {
		log.Fatalln(err)
	}
	db := NewDB(key, cfg)
	defer db.Close()
	db.Debug().AutoMigrate(&User{})
	user := &User{Name: "EncIO", Address: "Go"}
	db.Create(user)
	var users []User
	db.Find(&users)
	fmt.Println(users)
}

type User struct {
	gorm.Model
	Name    string `gorm:"size:255"`
	Address string
}

func NewDB(key encio.EncIO, cfg encio.Config) *gorm.DB {
	bytes, err := key.ReadFile(cfg["dbcred"].(string))
	if err != nil {
		log.Fatalln(err)
	}
	jwt, err := google.JWTConfigFromJSON(bytes, proxy.SQLScope)
	if err != nil {
		log.Fatalln(err)
	}
	ctx, cancel := context.WithTimeout(context.Background(), time.Minute)
	defer cancel() // timeout getting google client?
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
