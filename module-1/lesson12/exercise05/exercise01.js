const n = parseInt(prompt("Nhập số lượng phần tử Fibonacci muốn in:"));
let f0 = 0, f1 = 1, fn;
let result = "";

for (let i = 0; i < n; i++) {
    if (i <= 1) {
        fn = i;
    } else {
        fn = f0 + f1;
        f0 = f1;
        f1 = fn;
    }
    result += fn + " ";
}

console.log(result);