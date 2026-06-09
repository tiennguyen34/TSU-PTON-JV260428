let arr = [];

for (let i = 0; i < 10; i++) {
    arr[i] = Number(prompt(`Nhập phần tử thứ ${i + 1}:`));
}

let max = arr[0];
let index = 0;

for (let i = 1; i < arr.length; i++) {
    if (arr[i] > max) {
        max = arr[i];
        index = i;
    }
}

console.log("Giá trị lớn nhất:", max);
console.log("Vị trí:", index);