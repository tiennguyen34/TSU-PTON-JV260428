let count = 0;
let sum = 0;
let currentNumber = 0;

while (count < 30) {
    if (currentNumber % 7 === 0) {
        sum += currentNumber;
        count++;
    }
    currentNumber++;
}

alert(`Tổng của 30 số đầu tiên chia hết cho 7 là: ${sum}`);