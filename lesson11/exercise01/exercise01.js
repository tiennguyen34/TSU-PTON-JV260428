function checkLeapYear() {
    let yearInput = document.getElementById("yearInput").value;
    let year = parseInt(yearInput);
    let resultDiv = document.getElementById("result");

    if (isNaN(year) || year <= 0) {
        resultDiv.innerHTML = "<span style='color: #eab308;'>Vui lòng nhập một số năm hợp lệ lớn hơn 0!</span>";
        return;
    }

    let isLeapYear = false;

    if (year % 4 == 0) {
        if (year % 100 == 0) {
            if (year % 400 == 0) {
                isLeapYear = true;
            } else {
                isLeapYear = false;
            }
        } else {
            isLeapYear = true;
        }
    } else {
        isLeapYear = false;
    }

    if (isLeapYear) {
        resultDiv.innerHTML = `<span class="leap-year">Năm ${year} là NĂM NHUẬN!</span>`;
    } else {
        resultDiv.innerHTML = `<span class="not-leap-year">Năm ${year} KHÔNG PHẢI là năm nhuận!</span>`;
    }
}