const a = parseFloat(prompt("Nhập cạnh a hình chữ nhật:"));
const b = parseFloat(prompt("Nhập cạnh b hình chữ nhật:"));

if (a > 0 && b > 0) {
    const area = a * b;
    alert(`Diện tích hình chữ nhật là: ${area}`);
} else {
    alert("Kích thước các cạnh phải lớn hơn 0!");
}