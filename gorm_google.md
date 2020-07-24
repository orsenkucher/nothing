```go
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
```
