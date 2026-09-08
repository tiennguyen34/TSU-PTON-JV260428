function isPalindrome(str) {
    let reversed = str.split('').reverse().join('');
    return str === reversed;
}

let input = prompt("Nhập chuỗi:");

if (isPalindrome(input)) {
    alert("Đây là chuỗi đối xứng");
} else {
    alert("Đây không phải là chuỗi đối xứng");
}