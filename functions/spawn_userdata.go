package functions

import (
	"context"
	"log"
	"time"

	"cloud.google.com/go/firestore"
	firebase "firebase.google.com/go"
)

// var authClient *auth.Client
var storeClient *firestore.Client

func init() {
	ctx := context.Background()
	conf := &firebase.Config{ProjectID: "crystal-factory"}
	app, err := firebase.NewApp(ctx, conf)
	if err != nil {
		log.Fatalf("Can't create firebase.NewApp: %v", err)
	}
	// authClient, err = app.Auth(ctx)
	// if err != nil {
	// 	log.Fatalf("Can't retrieve auth.Client: %v", err)
	// }
	storeClient, err = app.Firestore(ctx)
	if err != nil {
		log.Fatalf("Can't retrieve firestore.Client: %v", err)
	}
}

// UserRecord is the payload of a Firestore Auth event.
// Also see auth.UserRecord
type UserRecord struct {
	UID          string `json:"uid"`
	Email        string `json:"email"`
	UserMetadata struct {
		CreatedAt time.Time `json:"createdAt"`
	} `json:"metadata"`
}

// SpawnUserData spawns UserData document when new user is signed up
// gcloud functions deploy SpawnUserData --trigger-event providers/firebase.auth/eventTypes/user.create --trigger-resource crystal-factory --runtime go111
func SpawnUserData(ctx context.Context, u UserRecord) error {
	log.Printf("User created: %v", u)
	// Правильно ли тут юзать Create, мобильное приложение тоже может создать юзердату (lastSeen, photo)
	_, err := storeClient.Collection("userdata").Doc(u.UID).Create(ctx, &u)
	return err
}
