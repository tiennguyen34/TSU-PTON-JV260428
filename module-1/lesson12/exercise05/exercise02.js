let size = 5;

let tg1 = "";
for (let i = 1; i <= size; i++) {
    tg1 += "*".repeat(i) + "\n";
}
console.log("Hình 1:\n" + tg1);

let tg2 = "";
for (let i = size; i >= 1; i--) {
    tg2 += "*".repeat(i) + "\n";
}
console.log("Hình 2:\n" + tg2);

let tg3 = "";
for (let i = 1; i <= size; i++) {
    tg3 += " ".repeat(size - i) + "*".repeat(i) + "\n";
}
console.log("Hình 3:\n" + tg3);

let tg4 = "";
for (let i = size; i >= 1; i--) {
    tg4 += " ".repeat(size - i) + "*".repeat(i) + "\n";
}
console.log("Hình 4:\n" + tg4);