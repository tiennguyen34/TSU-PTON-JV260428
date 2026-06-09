let arr = [];

for (let i = 0; i < 10; i++) {
    arr[i] = Number(prompt(`Nhập phần tử thứ ${i + 1}:`));
}

let max = arr[0];
let sum = 0;

for (let i = 0; i < arr.length; i++) {
    if (arr[i] > max) {
        max = arr[i];
    }
    sum += arr[i];
}

let average = sum / arr.length;

console.log("Số lớn nhất:", max);
console.log("Trung bình:", average);