let f0 = 0, f1 = 1, fn;
let sum = 0;

for (let i = 0; i < 20; i++) {
    if (i <= 1) {
        fn = i;
    } else {
        fn = f0 + f1;
        f0 = f1;
        f1 = fn;
    }
    sum += fn;
}

alert(`Tổng của 20 số đầu tiên trong dãy Fibonacci là: ${sum}`);