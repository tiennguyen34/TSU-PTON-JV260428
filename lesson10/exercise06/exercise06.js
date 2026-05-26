let math = parseFloat(prompt("Nhập điểm môn Toán (math):"));
let physics = parseFloat(prompt("Nhập điểm môn Vật lý (physics):"));
let chemistry = parseFloat(prompt("Nhập điểm môn Hóa học (chemistry):"));

let average = (math + physics + chemistry) / 3;

let averageRounded = average.toFixed(2);

let resultHTML = "";
resultHTML += "<p>Điểm môn Toán: <strong>" + math + "</strong></p>";
resultHTML += "<p>Điểm môn Vật lý: <strong>" + physics + "</strong></p>";
resultHTML += "<p>Điểm môn Hóa học: <strong>" + chemistry + "</strong></p>";
resultHTML += "<p class='average-score'>Điểm trung bình: <span>" + averageRounded + "</span></p>";

document.getElementById("score-output").innerHTML = resultHTML;
