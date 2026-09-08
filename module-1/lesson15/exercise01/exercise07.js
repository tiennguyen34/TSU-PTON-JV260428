let arr = [];

for (let i = 0; i < 10; i++) {
    arr[i] = Number(prompt(`Nhập phần tử thứ ${i + 1}:`));
}

arr.sort(function(a, b) {
    return b - a;
});

console.log("Mảng sau khi sắp xếp giảm dần:");
console.log(arr);