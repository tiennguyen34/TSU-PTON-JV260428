const a = parseFloat(prompt("Nhập cạnh kề thứ nhất a:"));
const b = parseFloat(prompt("Nhập cạnh kề thứ hai b:"));

if (a > 0 && b > 0) {
    const area = (a * b) / 2;
    alert(`Diện tích tam giác vuông là: ${area}`);
} else {
    alert("Kích thước các cạnh phải lớn hơn 0!");
}