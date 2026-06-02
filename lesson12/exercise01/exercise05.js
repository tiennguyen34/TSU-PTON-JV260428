const assignmentScore = parseFloat(prompt("Nhập điểm bài kiểm tra:"));
const midtermScore = parseFloat(prompt("Nhập điểm thi giữa kỳ:"));
const finalScore = parseFloat(prompt("Nhập điểm thi cuối kỳ:"));

const avgScore = (assignmentScore + midtermScore * 2 + finalScore * 3) / 6;

let rank = "";

if (avgScore >= 9.0) {
    rank = "Xuất Sắc";
} else if (avgScore >= 8.0) {
    rank = "Giỏi";
} else if (avgScore >= 6.5) {
    rank = "Khá";
} else if (avgScore >= 5.0) {
    rank = "Trung Bình";
} else {
    rank = "Yếu";
}

alert(`Điểm trung bình: ${avgScore.toFixed(2)} - Học lực: ${rank}`);