package tests

import (
	"fmt"
	"testing"

	"github.com/orsenkucher/crystalpuzzle/core"
)

var counter int

func print(a ...interface{}) {
	counter++
	a = append([]interface{}{fmt.Sprintf("%v:\t", counter)}, a...)
	fmt.Println(a...)
}

func TestInclude(*testing.T) {
	print(core.Defaults)

	var intVal int64
	print(core.Defaults.Includes(0))
	print(core.Defaults.Includes(intVal))

	var floatVal float32
	print(core.Defaults.Includes(0.0))
	print(core.Defaults.Includes(floatVal))

	var byteVal byte
	print(core.Defaults.Includes(byte(0)))
	print(core.Defaults.Includes(byteVal))

	var stringVal string
	print(core.Defaults.Includes(""))
	print(core.Defaults.Includes(stringVal))

	// 8
	var nilVal []struct{}
	print("nilVal is: ", nilVal)
	print(core.Defaults.Includes(nil))
	print(core.Defaults.Includes(nilVal))

	var nilMap map[string]interface{}
	var nilMap2 interface{}
	nilMap2 = nilMap
	print("nilMap is: ", nilMap)
	print("nilMap2 is: ", nilMap2)
	print(core.Defaults.Includes(nilMap))
	print(core.Defaults.Includes(nilMap2))
	// print("reflect", reflect.ValueOf(nilMap).IsNil())
	// print(interface{}(nil) == nil)
	// print(core.Defaults.Includes(nilMap))
	// print(nilMap2.(map[string]interface{}) == nil)
	// print(nilMap2 == &map[string]interface{}{})
}
