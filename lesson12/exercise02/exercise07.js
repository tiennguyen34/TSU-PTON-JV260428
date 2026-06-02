const a = parseFloat(prompt("Nhập hệ số a:"));
const b = parseFloat(prompt("Nhập hệ số b:"));
const c = parseFloat(prompt("Nhập hệ số c:"));

if (a === 0) {
    if (b === 0) {
        if (c === 0) {
            alert("Phương trình có vô số nghiệm.");
        } else {
            alert("Phương trình vô nghiệm.");
        }
    } else {
        alert(`Phương trình bậc 1 có nghiệm x = ${-c / b}`);
    }
} else {
    const delta = b * b - 4 * a * c;

    if (delta < 0) {
        alert("Phương trình vô nghiệm.");
    } else if (delta === 0) {
        const x = -b / (2 * a);
        alert(`Phương trình có nghiệm kép: x1 = x2 = ${x}`);
    } else {
        const x1 = (-b + Math.sqrt(delta)) / (2 * a);
        const x2 = (-b - Math.sqrt(delta)) / (2 * a);
        alert(`Phương trình có 2 nghiệm phân biệt:\nx1 = ${x1}\nx2 = ${x2}`);
    }
}