let arr = [];

for (let i = 0; i < 10; i++) {
    arr[i] = Number(prompt(`Nhập phần tử thứ ${i + 1}:`));
}

let count = 0;

for (let i = 0; i < arr.length; i++) {
    if (arr[i] < 0) {
        count++;
    }
}

console.log("Số lượng số âm:", count);