const arrayLength = Math.floor(Math.random() * 11) + 10;
const numbers = [];

for (let i = 0; i < arrayLength; i++) {
    numbers.push(Math.floor(Math.random() * 100) + 1);
}

let sumOdd = 0;
let sumEven = 0;

for (let i = 0; i < numbers.length; i++) {
    if (numbers[i] % 2 !== 0) {
        sumOdd += numbers[i];
    } else {
        sumEven += numbers[i];
    }
}

alert(`Mảng được tạo ngẫu nhiên: [${numbers.join(", ")}]\n\nTổng các số lẻ: ${sumOdd}`);
alert(`Tổng các số chẵn: ${sumEven}`);