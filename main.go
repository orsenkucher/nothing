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
	db.Debug().AutoMigrate(&User{})
	user := &User{Name: "admin", Address: "Go"}
	user2 := &User{Name: "user", Address: "Go"}
	//db.Debug().DropTableIfExists(&User{})
	//db.CreateTable(user)
	db.Create(user)
	db.Create(user2)
	var users []User
	db.Find(&users)
	db.Table("admin").Find(&users)
	//db.Query()
	fmt.Println(users)
}

// User is public
type User struct {
	gorm.Model
	Name    string `gorm:"size:255"`
	Address string
}

func (u User) TableName() string {
	if u.Name == "admin" {
		return "admin"
	}
	return "user"
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
