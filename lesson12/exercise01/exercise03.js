const number = parseInt(prompt("Nhập một số nguyên bất kỳ:"));

if (number > 0) {
    alert(`Số ${number} lớn hơn 0`);
} else if (number < 0) {
    alert(`Số ${number} nhỏ hơn 0`);
} else {
    alert("Số bạn nhập bằng 0");
}