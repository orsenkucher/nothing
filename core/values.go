package core

// Values is an array of some values
type Values []interface{}

// ValueMap is map[string] of some values
type ValueMap map[string]interface{}

// Includes determines whether v is in vals
func (vals Values) Includes(v interface{}) bool {
	for _, v1 := range vals {
		if v == v1 {
			return true
		}
	}
	return false
}
