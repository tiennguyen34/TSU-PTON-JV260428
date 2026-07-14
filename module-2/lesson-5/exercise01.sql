CREATE TABLE students (
    student_id VARCHAR(10) NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    birth_year INT NOT NULL,
    gender VARCHAR(10),
    score DECIMAL(4, 2), 
    PRIMARY KEY (student_id)
);

INSERT INTO students (student_id, full_name, birth_year, gender, score) VALUES
('SV001', 'Nguyen van a', 2005, 'Nam', 8.24),
('SV002', 'Tran thi b', 2006, 'Nu', 7.56),
('SV003', 'le van c', 2004, 'Nam', 9.11),
('SV004', 'pham minh d', 2005, 'Nam', 6.89);

SELECT 
    student_id, 
    UPPER(full_name) AS full_name_uppercase 
FROM students;

SELECT 
    full_name, 
    (YEAR(CURDATE()) - birth_year) AS age 
FROM students;

SELECT 
    student_id,
    full_name,
    ROUND(score, 1) AS rounded_score 
FROM students;

SELECT 
    COUNT(*) AS total_students, 
    MAX(score) AS highest_score, 
    MIN(score) AS lowest_score 
FROM students;

