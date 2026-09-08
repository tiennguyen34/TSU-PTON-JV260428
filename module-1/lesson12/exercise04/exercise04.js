let f0 = 0, f1 = 1, fn;

while (true) {
    fn = f0 + f1;
    f0 = f1;
    f1 = fn;

    if (fn % 5 === 0) {
        alert(`Số đầu tiên trong dãy Fibonacci chia hết cho 5 là: ${fn}`);
        break;
    }
}