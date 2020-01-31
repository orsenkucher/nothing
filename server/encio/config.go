package encio

import (
	"encoding/json"
	"fmt"
	"log"
)

type Config map[string]interface{}

var cfg Config

func (key EncIO) GetConfig(file string) (Config, error) {
	if cfg == nil {
		err := key.reloadConfig(file)
		return cfg, err
	}
	return cfg, nil
}

func (key EncIO) reloadConfig(file string) error {
	if bytes, err := key.ReadFile(file); err == nil {
		if err := json.Unmarshal(bytes, &cfg); err == nil {
			log.Printf("encio: Config reload %v", cfg)
		} else {
			return fmt.Errorf("encio: Your %s is present, but your key might be wrong.\nerr: %w", file, err)
		}
	} else {
		return err
	}
	return nil
}
