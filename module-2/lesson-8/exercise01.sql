
CREATE DATABASE school_db;
USE school_db;

CREATE TABLE students (
    student_code VARCHAR(20) PRIMARY KEY, 
    full_name VARCHAR(100) NOT NULL,      
    class_name VARCHAR(50) NOT NULL     
);

INSERT INTO students (student_code, full_name, class_name) VALUES 
('SV001', 'Nguyễn Văn A', 'CNTT1'),
('SV002', 'Trần Thị B', 'CNTT2'),
('SV003', 'Lê Minh C', 'CNTT1');

DELIMITER //
CREATE PROCEDURE sp_get_all_students()
BEGIN
    SELECT student_code, full_name, class_name FROM students;
END //
DELIMITER ;

CALL sp_get_all_students();
