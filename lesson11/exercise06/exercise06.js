function runCalculator() {
    let aInput = prompt("Mời bạn nhập vào số a");
    if (aInput === null) return;
    let a = parseFloat(aInput);

    let bInput = prompt("Mời bạn nhập vào số b");
    if (bInput === null) return;
    let b = parseFloat(bInput);

    if (isNaN(a) || isNaN(b)) {
        alert("Vui lòng nhập số hợp lệ!");
        return;
    }

    let operator = prompt("Mới bạn nhập vào các phép tính (+, -, *, /)");
    if (operator === null) return;

    let result;

    if (operator === "+") {
        result = a + b;
    } else if (operator === "-") {
        result = a - b;
    } else if (operator === "*") {
        result = a * b;
    } else if (operator === "/") {
        if (b === 0) {
            alert("Không thể chia cho số 0!");
            return;
        }
        result = a / b;
    } else {
        alert("Phép tính không hợp lệ!");
        return;
    }

    alert("Kết quả của phép tính trên: a " + operator + " b = " + result);
}