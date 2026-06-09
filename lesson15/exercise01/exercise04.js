let arr = [];

for (let i = 0; i < 5; i++) {
    arr[i] = Number(prompt(`Nhập phần tử thứ ${i + 1}:`));
}

arr.reverse();

console.log("Mảng sau khi đảo:");
console.log(arr);