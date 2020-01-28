package main

import (
	"context"
	"fmt"
	"io/ioutil"
	"log"
	"time"

	// "github.com/jackc/pgx/v4"
	_ "github.com/GoogleCloudPlatform/cloudsql-proxy/proxy/dialers/postgres"
	"github.com/GoogleCloudPlatform/cloudsql-proxy/proxy/proxy"
	"github.com/jinzhu/gorm"

	"golang.org/x/oauth2/google"
)

const dialersTestTimeout = time.Minute

func main() {
	dsn := fmt.Sprintf("host=%s dbname=%s user=%s password=%s sslmode=disable",
		"scheduleuabot:europe-west3:nothing-sql",
		"postgres",
		// "nothing-sql",
		"postgres",
		"nothingpuzzle2020")
	ctx, cancel := context.WithTimeout(context.Background(), dialersTestTimeout)
	defer cancel()

	// client, err := clientFromCredentials(ctx)
	// if err != nil {
	// 	log.Fatal(err)
	// }

	// client, err := google.DefaultClient(ctx, proxy.SQLScope)
	all, err := ioutil.ReadFile("creds.json")
	if err != nil {
		log.Println(err)
	}
	cfg, err := google.JWTConfigFromJSON(all, proxy.SQLScope)
	if err != nil {
		log.Println(err)
	}
	client := cfg.Client(ctx)
	if err != nil {
		log.Println(err)
	}
	proxy.Init(client, nil, nil)
	// db, err := sql.Open("cloudsqlpostgres", dsn)
	db, err := gorm.Open("cloudsqlpostgres", dsn)
	// db is long-lived object
	if err != nil {
		log.Fatalln(err)
	}
	defer db.Close()
	fmt.Println(db, err)
	// fmt.Println(db.Ping())
	// fmt.Println(db.Stats())

	// url := os.Getenv("DATABASE_URL")
	// url := "35.246.219.227"
	// url := dsn
	// conn, err := pgx.Connect(context.Background(), url)
	// if err != nil {
	// 	fmt.Fprintf(os.Stderr, "Unable to connection to database: %v\n", err)
	// 	os.Exit(1)
	// }
	// defer conn.Close(context.Background())

	// var name string
	// var weight int64
	// err = db.QueryRow("select name, weight from widgets where id=$1", 42).Scan(&name, &weight)
	// if err != nil {
	// 	fmt.Fprintf(os.Stderr, "QueryRow failed: %v\n", err)
	// 	os.Exit(1)
	// }
	// db.CreateTable(&User{})

	db.Debug().DropTableIfExists(&User{})
	ok := db.HasTable(&User{})
	fmt.Println(ok)
	db.Debug().AutoMigrate(&User{})
	ok = db.HasTable(&User{})
	fmt.Println(ok)
	// fmt.Println(name, weight)
}

type User struct {
	gorm.Model
	Name string `gorm:"size:255"`
}
