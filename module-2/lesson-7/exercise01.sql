
CREATE DATABASE studentmanagement_db;
USE student_management_db;

CREATE TABLE students (
    student_code VARCHAR(20) PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL, 
    birth_year INT NOT NULL,            
    class_name VARCHAR(50) NOT NULL,     
    address VARCHAR(255)                  
);

INSERT INTO students (student_code, full_name, birth_year, class_name, address) VALUES 
('SV001', 'Nguyễn Văn A', 2004, 'CNTT1', 'Hà Nội'),
('SV002', 'Trần Thị B', 2005, 'CNTT2', 'Đà Nẵng'),
('SV003', 'Lê Minh C', 2004, 'CNTT1', 'TP HCM');

CREATE VIEW v_student_basic AS
SELECT student_code, full_name, class_name
FROM students;

SELECT * FROM v_student_basic;
