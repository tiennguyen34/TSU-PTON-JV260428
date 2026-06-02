let loop = true;
let userName = "";
let userAge = "";

while (loop) {
    let choice = prompt(
        "--- MENU LUYỆN TẬP TỔNG HỢP ---\n" +
        "1. Nhập tên của người dùng\n" +
        "2. Nhập tuổi của người dùng\n" +
        "3. In tên và tuổi của người dùng\n" +
        "4. In bảng cửu chương của một số\n" +
        "5. Kiểm tra số nhập vào là số chẵn hay lẻ\n" +
        "6. Tính tổng các số từ 1 đến N\n" +
        "7. In các số trong một dãy số\n" +
        "8. Kiểm tra số nhập vào có phải là số nguyên tố hay không\n" +
        "9. In chuỗi đảo ngược của một chuỗi\n" +
        "10. Thoát khỏi chương trình\n" +
        "Nhập lựa chọn của bạn (1-10):"
    );

    switch (choice) {
        case "1":
            userName = prompt("Nhập tên của bạn:");
            alert("Đã lưu tên thành công!");
            break;

        case "2":
            userAge = prompt("Nhập tuổi của bạn:");
            alert("Đã lưu tuổi thành công!");
            break;

        case "3":
            if (!userName && !userAge) {
                alert("Bạn chưa nhập tên và tuổi! Vui lòng chọn 1 và 2 trước.");
            } else {
                alert(`Thông tin người dùng:\nTên: ${userName || "Chưa nhập"}\nTuổi: ${userAge || "Chưa nhập"}`);
            }
            break;

        case "4":
            let numMulti = parseInt(prompt("Nhập vào số muốn in bảng cửu chương:"));
            if (!isNaN(numMulti)) {
                let tableResult = `--- BẢNG CỬU CHƯƠNG ${numMulti} ---\n`;
                for (let i = 1; i <= 10; i++) {
                    tableResult += `${numMulti} x ${i} = ${numMulti * i}\n`;
                }
                alert(tableResult);
            } else {
                alert("Dữ liệu nhập vào phải là một số!");
            }
            break;

        case "5":
            let checkNum = parseInt(prompt("Nhập vào một số để kiểm tra chẵn/lẻ:"));
            if (!isNaN(checkNum)) {
                if (checkNum % 2 === 0) {
                    alert(`Số ${checkNum} là số chẵn.`);
                } else {
                    alert(`Số ${checkNum} là số lẻ.`);
                }
            } else {
                alert("Dữ liệu nhập vào không hợp lệ!");
            }
            break;

        case "6":
            let n = parseInt(prompt("Nhập vào số N để tính tổng từ 1 đến N:"));
            if (!isNaN(n) && n > 0) {
                let sum = 0;
                for (let i = 1; i <= n; i++) {
                    sum += i;
                }
                alert(`Tổng các số từ 1 đến ${n} là: ${sum}`);
            } else {
                alert("Vui lòng nhập một số nguyên dương lớn hơn 0!");
            }
            break;

        case "7":
            let stringSeq = prompt("Nhập vào một dãy số (các số cách nhau bằng dấu phẩy hoặc khoảng trắng):");
            if (stringSeq) {
                alert(`Dãy số bạn vừa nhập là: [ ${stringSeq} ]`);
            } else {
                alert("Chuỗi nhập vào trống!");
            }
            break;

        case "8":
            let primeNum = parseInt(prompt("Nhập vào một số để kiểm tra số nguyên tố:"));
            if (!isNaN(primeNum)) {
                let isPrime = true;
                if (primeNum < 2) {
                    isPrime = false;
                } else {
                    for (let i = 2; i <= Math.sqrt(primeNum); i++) {
                        if (primeNum % i === 0) {
                            isPrime = false;
                            break;
                        }
                    }
                }
                if (isPrime) {
                    alert(`Số ${primeNum} LÀ số nguyên tố.`);
                } else {
                    alert(`Số ${primeNum} KHÔNG PHẢI là số nguyên tố.`);
                }
            } else {
                alert("Dữ liệu nhập vào phải là số!");
            }
            break;

        case "9":
            let strInput = prompt("Nhập vào một chuỗi chữ bất kỳ:");
            if (strInput !== null) {
                let reversedStr = strInput.split("").reverse().join("");
                alert(`Chuỗi đảo ngược là: ${reversedStr}`);
            }
            break;

        case "10":
            alert("Cảm ơn bạn đã sử dụng chương trình. Tạm biệt!");
            loop = false;
            break;

        default:
            alert("Lựa chọn không hợp lệ! Vui lòng nhập số từ 1 đến 10.");
            break;
    }
}