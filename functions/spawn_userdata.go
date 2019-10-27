package functions

import (
	"context"
	"log"
	"time"

	"cloud.google.com/go/firestore"
	firebase "firebase.google.com/go"
	"firebase.google.com/go/auth"
	"github.com/orsenkucher/nothing/core"
)

var authClient *auth.Client
var storeClient *firestore.Client

func init() {
	ctx := context.Background()
	conf := &firebase.Config{ProjectID: "crystal-factory"}
	app, err := firebase.NewApp(ctx, conf)
	if err != nil {
		log.Fatalf("Can't create firebase.NewApp: %v", err)
	}
	authClient, err = app.Auth(ctx)
	if err != nil {
		log.Fatalf("Can't retrieve auth.Client: %v", err)
	}
	storeClient, err = app.Firestore(ctx)
	if err != nil {
		log.Fatalf("Can't retrieve firestore.Client: %v", err)
	}
}

// UserRecord is the payload of a Firestore Auth event.
// Also see type _ auth.UserRecord
type UserRecord struct {
	UID          string `json:"uid"`
	Email        string `json:"email"`
	Name         string `json:"name"`
	PhotoURL     string `json:"photoUrl"`
	UserMetadata struct {
		CreatedAt time.Time `json:"createdAt"`
	} `json:"metadata"`
}

// ToMap converts UserRecord to map
func (u *UserRecord) ToMap() map[string]interface{} {
	m := core.ValueMap{
		"UID":       u.UID,
		"Email":     u.Email,
		"Name":      u.Name,
		"Photo":     u.PhotoURL,
		"CreatedAt": u.UserMetadata.CreatedAt,
		"LastSeen":  u.UserMetadata.CreatedAt,
	}
	core.TidyMap(&m)
	return m
}

// SpawnUserData spawns UserData document when new user is signed up
// gcloud functions deploy SpawnUserData --trigger-event providers/firebase.auth/eventTypes/user.create --trigger-resource crystal-factory --runtime go111
func SpawnUserData(ctx context.Context, u UserRecord) error {
	log.Printf("User created: %v", u)
	_, err := storeClient.Collection("userdata").Doc(u.UID).Set(ctx, u.ToMap(), firestore.MergeAll)
	return err
}
