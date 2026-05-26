function calculateBMI() {
    let weightInput = prompt("Mời bạn nhập vào cân nặng (kg):");
    if (weightInput === null) return;
    let weight = parseFloat(weightInput);

    let heightInput = prompt("Mời bạn nhập vào chiều cao (m):");
    if (heightInput === null) return;
    let height = parseFloat(heightInput);

    if (isNaN(weight) || isNaN(height) || weight <= 0 || height <= 0) {
        alert("Cân nặng và chiều cao nhập vào phải là số lớn hơn 0!");
        return;
    }

    let bmi = weight / (height * height);
    let classification = "";

    if (bmi < 18.5) {
        classification = "Cân nặng thấp (gầy)";
    } else if (bmi < 25.0) {
        classification = "Bình thường";
    } else if (bmi < 30.0) {
        classification = "Thừa cân";
    } else if (bmi < 35.0) {
        classification = "Béo phì độ I";
    } else if (bmi < 40.0) {
        classification = "Béo phì độ II";
    } else {
        classification = "Béo phì độ III";
    }

    alert("Chỉ số BMI của bạn là: " + bmi.toFixed(2) + "\nPhân loại: " + classification);
}