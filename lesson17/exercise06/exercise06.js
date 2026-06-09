const display = document.getElementById("display");

function press(val) {
    display.value += val;
}

function clearDisplay() {
    display.value = "";
}

function calculate() {
    let expression = display.value;

    if (!expression) return;

    try {
        if (/\/0(?!\d)/.test(expression)) {
            display.value = "Lỗi: Chia cho 0";
            return;
        }

        let result = Function('"use strict";return (' + expression + ')')();
        
        if (isNaN(result) || !isFinite(result)) {
            display.value = "Lỗi nhập liệu";
        } else {
            display.value = result;
        }
    } catch (error) {
        display.value = "Lỗi nhập liệu";
    }
}