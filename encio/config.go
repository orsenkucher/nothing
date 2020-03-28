package encio

import (
	"encoding/json"
	"fmt"
	"log"
)

type Config map[string]interface{}

var cfgs map[string]Config

func (key EncIO) GetConfig(file string) (Config, error) {
	cfg := cfgs[file]
	if cfg == nil {
		err := key.reloadConfig(file)
		return cfg, err
	}
	return cfg, nil
}

func (key EncIO) reloadConfig(file string) error {
	cfg := cfgs[file] // map is a ref type
	if bytes, err := key.ReadFile(file); err == nil {
		if err := json.Unmarshal(bytes, &cfg); err == nil {
			keys := make([]string, 0, len(cfg))
			for k := range cfg {
				keys = append(keys, k)
			}
			log.Printf("encio: Config reloaded fields with these keys -> %v", keys)
			return nil
		} else {
			return fmt.Errorf("encio: Your '%s' is present, but your key might be wrong.\nerr: %w", file, err)
		}
	} else {
		return err
	}
}
