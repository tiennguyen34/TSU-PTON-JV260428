const principal = parseFloat(prompt("Nhập số tiền ban đầu (VND):"));
const months = parseInt(prompt("Nhập số tháng cho vay:"));
const ratePerMonth = parseFloat(prompt("Nhập lãi suất hàng tháng (%):")) / 100;

if (principal > 0 && months > 0 && ratePerMonth > 0) {
    let totalMoney = principal * Math.pow((1 + ratePerMonth), months);
    let totalInterest = totalMoney - principal;

    alert(`Số tiền gốc ban đầu: ${principal.toLocaleString()} VND\n` +
          `Tổng số tiền nhận được: ${totalMoney.toLocaleString(undefined, {maximumFractionDigits: 0})} VND\n` +
          `Tổng số tiền lãi thu về: ${totalInterest.toLocaleString(undefined, {maximumFractionDigits: 0})} VND`);
} else {
    alert("Dữ liệu nhập vào không hợp lệ!");
}