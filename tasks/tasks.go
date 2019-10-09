package tasks

// gcloud functions deploy HelloGet --runtime go111 --trigger-http
import (
	"fmt"
	"net/http"
	"time"
)

// HelloGet is an HTTP Cloud Function.
func HelloGet(w http.ResponseWriter, r *http.Request) {
	fmt.Fprint(w, "Hello, World!")
}

// CalcFibGo returns time
func CalcFibGo(w http.ResponseWriter, r *http.Request) {
	start := time.Now()
	fib(1e9)
	// fmt.Println(fib(1))
	// fmt.Println(fib(2))
	// fmt.Println(fib(6))
	// fmt.Println(fib(1e9))
	took := time.Since(start)
	fmt.Fprintf(w, "Call took %v milliseconds.", took.Nanoseconds()/1e6)
}

func fib(n int) int {
	arr := [...]int{0, 1}
	for i := 2; i < n+1; i++ {
		arr[1], arr[0] = arr[0]+arr[1], arr[1]
	}
	return arr[0]
}
