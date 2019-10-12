package tasks

import (
	"fmt"
	"net/http/httptest"
	"testing"
)

// HelloGet testing method
func TestHelloGet(t *testing.T) {
	req := httptest.NewRequest("POST", "/", nil)
	rr := httptest.NewRecorder()
	fmt.Println("Making a request")
	HelloGet(rr, req)
	got := rr.Body.String()
	fmt.Println(got)

	if got != "Hello, World!" {
		t.Errorf("Expected \"Hello, World!\". Got %s", got)
	}
}
