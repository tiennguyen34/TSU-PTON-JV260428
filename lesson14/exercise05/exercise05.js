let studentList = [];

function addStudent(id, name, age) {
    const newStudent = { id, name, age };
    studentList.push(newStudent);
    console.log(`=> Đã thêm sinh viên: ${name} (ID: ${id}) thành công.`);
}

function displayStudents() {
    console.log("\n--- DANH SÁCH SINH VIÊN HIỆN TẠI ---");
    if (studentList.length === 0) {
        console.log("Danh sách trống!");
        return;
    }
    
    studentList.forEach((student, index) => {
        console.log(`${index + 1}. ID: ${student.id} | Tên: ${student.name} | Tuổi: ${student.age}`);
    });
}

function deleteStudentById(id) {
    const index = studentList.findIndex(student => student.id === id);
    
    if (index !== -1) {
        studentList.splice(index, 1);
        console.log(`\n=> Cập nhật: Đã xóa sinh viên có ID: ${id}`);
    } else {
        console.log(`\n=> LỖI: Không tìm thấy sinh viên nào có ID: ${id} để xóa!`);
    }
}

addStudent("SV001", "Nguyen Van A", 20);
addStudent("SV002", "Tran Thi B", 21);
addStudent("SV003", "Le Van C", 19);

displayStudents();

deleteStudentById("SV002");
displayStudents();

deleteStudentById("SV999");