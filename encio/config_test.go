package encio

import (
	"fmt"
	"testing"
)

func TestConfig(t *testing.T) {
	key := NewEncIO("password")
	if cfg, err := key.GetConfig("test/config.json"); err == nil {
		fmt.Println(cfg)
		if cfg["password"].(string) != "HelloWorld2020" {
			t.Error("No match")
		}
	} else {
		t.Error(err)
	}
}
