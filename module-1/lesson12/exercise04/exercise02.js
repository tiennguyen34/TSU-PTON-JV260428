let temperature = parseFloat(prompt("Nhập nhiệt độ hiện tại:"));

if (temperature > 100) {
    alert("Yêu cầu giảm nhiệt độ!");
} else if (temperature < 20) {
    alert("Yêu cầu tăng nhiệt độ!");
} else {
    alert("Nhiệt độ bình thường.");
}