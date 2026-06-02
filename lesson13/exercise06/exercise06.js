const arrayLength = Math.floor(Math.random() * 11) + 10;
const numbers = [];

for (let i = 0; i < arrayLength; i++) {
    numbers.push(Math.floor(Math.random() * 10) + 1);
}

alert(`Mảng số nguyên hiện tại: [${numbers.join(", ")}]`);

const k = parseInt(prompt("Nhập vào một số nguyên k để kiểm tra:"));
let count = 0;

for (let i = 0; i < numbers.length; i++) {
    if (numbers[i] === k) {
        count++;
    }
}

alert(`Số lần xuất hiện của số ${k} trong mảng là: ${count} lần.`);