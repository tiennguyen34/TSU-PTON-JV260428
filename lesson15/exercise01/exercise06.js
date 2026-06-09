let arr = [];

for (let i = 0; i < 10; i++) {
    arr[i] = Number(prompt(`Nhập phần tử thứ ${i + 1}:`));
}

let x = Number(prompt("Nhập số X:"));

if (arr.includes(x)) {
    console.log(`Number ${x} is in the array`);
} else {
    console.log(`Number ${x} is not in the array`);
}