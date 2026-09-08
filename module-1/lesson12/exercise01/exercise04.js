const n1 = parseInt(prompt("Nhập số thứ nhất:"));
const n2 = parseInt(prompt("Nhập số thứ hai:"));
const n3 = parseInt(prompt("Nhập số thứ ba:"));

let max = n1;

if (n2 > max) {
    max = n2;
}
if (n3 > max) {
    max = n3;
}

alert(`Giá trị lớn nhất trong 3 số là: ${max}`);