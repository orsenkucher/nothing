```go
func NewDB(cfg encio.Config) *gorm.DB {
	dsn := fmt.Sprintf(
		"host=%s port=%d user=%s password=%s dbname=%s sslmode=disable",
		cfg["dbhost"].(string),
		int32(cfg["dbport"].(float64)),
		cfg["dbuser"].(string),
		cfg["dbpass"].(string),
		cfg["dbname"].(string),
	)
	db, err := gorm.Open(cfg["driver"].(string), dsn)
	if err != nil {
		panic("failed to connect database")
	}

	return db
}
```
