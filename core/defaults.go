package core

import "reflect"

type defaults Values

// Defaults is an array of default values
var Defaults = defaults{
	nil,
	false,
	"",
	int8(0),
	uint8(0),
	int16(0),
	uint16(0),
	int32(0),
	uint32(0),
	int64(0),
	uint64(0),
	int(0),
	uint(0),
	uintptr(0),
	float32(0),
	float64(0),
	complex64(0 + 0i),
	complex128(0 + 0i),
}

var defaultNilKinds = Values{
	reflect.Chan,
	reflect.Func,
	reflect.Map,
	reflect.Ptr,
	reflect.Interface,
	reflect.Slice,
}

// Includes determines whether v is in vals
func (vals defaults) Includes(v interface{}) bool {
	if Values(Defaults).Includes(v) {
		return true
	}
	rv := reflect.ValueOf(v)
	if defaultNilKinds.Includes(rv.Kind()) && rv.IsNil() {
		return true
	}
	return false
}

// TidyMap removes all Defalult values from map
func TidyMap(m *ValueMap) {
	for k, v := range *m {
		if Defaults.Includes(v) {
			delete(*m, k)
		}
	}
}
