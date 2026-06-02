const a = parseFloat(prompt("Nhập hệ số a:"));
const b = parseFloat(prompt("Nhập hệ số b:"));

if (a === 0) {
    if (b === 0) {
        alert("Phương trình có vô số nghiệm.");
    } else {
        alert("Phương trình vô nghiệm.");
    }
} else {
    const x = -b / a;
    alert(`Phương trình có 1 nghiệm duy nhất: x = ${x}`);
}