const a = parseFloat(prompt("Nhập độ dài cạnh a của hình vuông:"));

if (a > 0) {
    const area = a * a;
    alert(`Diện tích hình vuông là: ${area}`);
} else {
    alert("Độ dài cạnh phải lớn hơn 0!");
}