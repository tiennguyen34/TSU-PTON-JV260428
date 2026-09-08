// 1. Nhập số tiền Đô la Mỹ (USD) từ người dùng
let usdAmount = prompt("Nhập số tiền Đô la Mỹ (USD) cần chuyển đổi:");

// Chuyển đổi dữ liệu nhập vào thành kiểu số thực (để phòng trường hợp nhập số lẻ)
let usd = parseFloat(usdAmount);

// Định nghĩa hằng số tỷ giá: 1 USD = 25.000 VND
const EXCHANGE_RATE = 25000;

// 2. Tính toán số tiền Việt Nam Đồng tương ứng
let vnd = usd * EXCHANGE_RATE;

// 3. Định dạng hiển thị số tiền cho đẹp mắt (Ví dụ: 25000 -> 25.000)
let formattedVnd = vnd.toLocaleString('vi-VN');
let formattedUsd = usd.toLocaleString('en-US');

// 4. Tạo chuỗi HTML để hiển thị kết quả
let resultHTML = "";
resultHTML += "<p>Số tiền USD nhập vào: <strong>$" + formattedUsd + "</strong></p>";
resultHTML += "<p>Tỷ giá quy đổi: <strong>1$ = 25.000 đ</strong></p>";
resultHTML += "<p>Số tiền VND tương ứng là: <span>" + formattedVnd + " đ</span></p>";

// 5. Xuất kết quả vào thẻ div có id="currency-output" trong file HTML
document.getElementById("currency-output").innerHTML = resultHTML;
