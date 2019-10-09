const functions = require('firebase-functions');
const { performance } = require('perf_hooks');

// Create and Deploy Your First Cloud Functions
// https://firebase.google.com/docs/functions/write-firebase-functions

exports.calcfibjs = functions.https.onRequest((request, response) => {
    var t0 = performance.now();
    fib(1e9);
    var t1 = performance.now();
    response.send("Call  took " + (t1 - t0) + " milliseconds.");
});

function fib(n) {
    let arr = [0, 1];
    for (let i = 2; i < n + 1; i++) {
        // arr.push(arr[i - 2] + arr[i - 1])
        arr[1], arr[0] = arr[0] + arr[1], arr[1]
    }
    return arr[0]
}
