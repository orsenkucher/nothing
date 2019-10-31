package functions

import (
	"context"
	"log"
	"time"
)

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

// SpawnUserData spawns UserData document when new user is signed up
// gcloud functions deploy SpawnUserData --trigger-event providers/firebase.auth/eventTypes/user.create --trigger-resource crystal-factory --runtime go111
func SpawnUserData(ctx context.Context, u UserRecord) error {
	log.Printf("User created: %v", u)
	_, err := storeClient.Collection("userdata").Doc(u.UID).Set(ctx, u)
	return err
}
