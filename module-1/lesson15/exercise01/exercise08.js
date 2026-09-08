let a = [];
let b = [];

for (let i = 0; i < 10; i++) {
    a[i] = Number(prompt(`Nhập a[${i}]:`));
}

for (let i = 0; i < 10; i++) {
    b[i] = Number(prompt(`Nhập b[${i}]:`));
}

let c = a.concat(b);

console.log("Mảng c:");
console.log(c);