package functions

import (
	"context"
	"log"

	"cloud.google.com/go/firestore"
	firebase "firebase.google.com/go"
	"firebase.google.com/go/auth"
)

var authClient *auth.Client
var storeClient *firestore.Client
var globalCtx context.Context

func init() {
	globalCtx = context.Background()
	conf := &firebase.Config{ProjectID: "crystal-factory"}
	app, err := firebase.NewApp(globalCtx, conf)
	if err != nil {
		log.Fatalf("Can't create firebase.NewApp: %v", err)
	}
	authClient, err = app.Auth(globalCtx)
	if err != nil {
		log.Fatalf("Can't retrieve auth.Client: %v", err)
	}
	storeClient, err = app.Firestore(globalCtx)
	if err != nil {
		log.Fatalf("Can't retrieve firestore.Client: %v", err)
	}
}
