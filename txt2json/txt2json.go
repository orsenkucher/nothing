package txt2json

import (
	"encoding/json"
	"errors"
	"fmt"
	"reflect"
	"regexp"
	"strings"
)

//ConvertToJSON serializes to json
func ConvertToJSON(v interface{}) ([]byte, error) {
	b, err := json.Marshal(v)
	if err != nil {
		return nil, err
	}
	return b, nil
}

//ConvertToPrettyJSON serializes to json
func ConvertToPrettyJSON(v interface{}) ([]byte, error) {
	b, err := json.MarshalIndent(v, "", "\t")
	if err != nil {
		return nil, err
	}
	return b, nil
}

// Parse parses string data into provided slice pointer.
//  q: "Black", ans: ["white", "White"], exp: "Opposite"
func Parse(data string, v interface{}) error {
	slicePtr := reflect.ValueOf(v)
	if slicePtr.Kind() != reflect.Ptr || slicePtr.IsNil() {
		return errors.New("non-pointer passed to Parse")
	}

	slice := slicePtr.Elem()
	if slice.Kind() != reflect.Slice {
		return errors.New("non-slice under pointer passed to Parse")
	}

	lines := strings.Split(data, "\n")
	for i := 0; i < len(lines); i++ {
		line := lines[i]
		elemType := slice.Type().Elem()
		if elemType.Kind() != reflect.Struct {
			return errors.New("slice element type is not Struct")
		}
		elem := reflect.New(elemType).Elem()
		if err := parseLine(line, elem); err != nil {
			panic(err)
		}
		slice.Set(reflect.Append(slice, elem))
	}

	return nil
}

func parseLine(line string, v reflect.Value) error {
	fields := v.Type()
	values := v

	for i := 0; i < fields.NumField(); i++ {
		tag := fields.Field(i).Tag
		key := strings.Split(string(tag), ":")[0]
		indexer := tag.Get(key)
		value := values.Field(i)
		switch key {
		case "doc":
			if doc, ok := cutDoc(line, indexer); ok {
				value.SetString(fmt.Sprintf("%+q", doc))
				// fmt.Println(doc)
			}
		case "col":
			if col, ok := cutCol(line, indexer); ok {
				value.Set(reflect.ValueOf(col))
				// fmt.Println(col)
			}
		}
	}
	// fmt.Println(task)
	return nil
}

// exp:\s*"(.*?)"
func cutDoc(line, indexer string) (string, bool) {
	pattern := indexer + ":\\s*\"(.*?)\""
	rx, err := regexp.Compile(pattern)
	if err != nil {
		panic(err)
	}
	cuts := rx.FindStringSubmatch(line)
	if len(cuts) > 1 {
		return cuts[1], true
	}
	return "", false
}

// ans:\s*\[(.*?)*?\]
func cutCol(line, indexer string) ([]string, bool) {
	pattern := indexer + ":\\s*\\[(.*?)*?\\]"
	rx, err := regexp.Compile(pattern)
	if err != nil {
		panic(err)
	}
	cuts := rx.FindStringSubmatch(line)
	if len(cuts) > 1 {
		cuts = strings.Split(cuts[1], ",")
		for i := 0; i < len(cuts); i++ {
			cuts[i] = fmt.Sprintf("%+q", trim(cuts[i]))
		}
		return cuts, true
	}
	return nil, false
}

func trim(s string) string {
	q := "\""
	return strings.TrimSpace(
		strings.TrimPrefix(
			strings.TrimSuffix(
				strings.TrimSpace(s), q), q))
}