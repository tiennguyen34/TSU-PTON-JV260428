let count = 20;
let f0 = 0, f1 = 1, fn;
let result = "20 số Fibonacci đầu tiên là: ";

for (let i = 0; i < count; i++) {
    if (i <= 1) {
        fn = i;
    } else {
        fn = f0 + f1;
        f0 = f1;
        f1 = fn;
    }
    result += fn + " ";
}

alert(result);