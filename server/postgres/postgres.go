package main

import (
	"context"
	"database/sql"
	"fmt"
	"io/ioutil"
	"log"
	"time"

	// "github.com/jackc/pgx/v4"
	_ "github.com/GoogleCloudPlatform/cloudsql-proxy/proxy/dialers/postgres"
	"github.com/GoogleCloudPlatform/cloudsql-proxy/proxy/proxy"

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
	db, err := sql.Open("cloudsqlpostgres", dsn)

	fmt.Println(db, err)
	fmt.Println(db.Ping())

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
	// err = conn.QueryRow(context.Background(), "select name, weight from widgets where id=$1", 42).Scan(&name, &weight)
	// if err != nil {
	// 	fmt.Fprintf(os.Stderr, "QueryRow failed: %v\n", err)
	// 	os.Exit(1)
	// }

	// fmt.Println(name, weight)
}
