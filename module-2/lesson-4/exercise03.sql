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
--  exercise2
UPDATE students 
SET email = 'thue@gmail.com' 
WHERE email IS NULL;

UPDATE students 
SET gender = 'Nu' 
WHERE student_id = 'SV005';

DELETE FROM students 
WHERE student_id = 'SV003';
--  exercise3
SELECT student_id, full_name, birth_date 
FROM students 
WHERE birth_date BETWEEN '2003-01-01' AND '2005-12-31';

SELECT student_id, full_name, birth_date 
FROM students 
WHERE gender IN ('Nam', 'Nu');

SELECT student_id, full_name, birth_date 
FROM students 
WHERE student_id IN ('SV001', 'SV004', 'SV005');
