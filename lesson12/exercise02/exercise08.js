const ageInput = parseFloat(prompt("Nhập vào một số để kiểm tra tuổi:"));

if (Number.isInteger(ageInput) && ageInput > 0 && ageInput < 120) {
    alert(`${ageInput} là tuổi hợp lệ của một người.`);
} else {
    alert("Đây không phải là tuổi hợp lệ của một người.");
}