CREATE DATABASE  qlsv;
USE qlsv;
CREATE TABLE students (
    student_id VARCHAR(10) NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    birth_date DATE NOT NULL,
    gender VARCHAR(10),
    email VARCHAR(100) DEFAULT NULL,
    PRIMARY KEY (student_id)
);
INSERT INTO students (student_id, full_name, birth_date, gender, email) VALUES
('SV001','Nguyen Van A', '2001-01-15', 'Nam', 'vana@gmail.com'),
('SV002','Tran Thi B', '2002-06-20', 'Nu', 'thib@gmail.com'),
('SV003','Le Van C', '2004-11-02', 'Nam', 'vanc@gmail.com'),
('SV004','Pham Minh D', '2005-03-12', 'Nam', 'minhd@gmail.com'),
('SV005','Hoang Thu E', '2003-09-25', 'Nu', NULL);

SELECT * FROM students;

