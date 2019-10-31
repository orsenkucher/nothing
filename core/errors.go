package core

// Check - panic on error
func Check(err error) {
	if err != nil {
		panic(err)
	}
}
