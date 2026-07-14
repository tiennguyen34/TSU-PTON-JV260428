
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(255) NOT NULL
);

CREATE TABLE subjects (
    subject_id VARCHAR(50) PRIMARY KEY,
    subject_name VARCHAR(255) NOT NULL
);

CREATE TABLE scores (
    student_id INT,
    subject_id VARCHAR(50),
    score DECIMAL(4, 2) NOT NULL,
    PRIMARY KEY (student_id, subject_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);


-- Thêm dữ liệu Sinh viên
INSERT INTO students (student_id, student_name) VALUES
(1, 'Nguyễn Văn Anh'),
(2, 'Trần Thị Bình'),
(3, 'Lê Hoàng Cường'),
(4, 'Phạm Minh Đức');

-- Thêm dữ liệu Môn học
INSERT INTO subjects (subject_id, subject_name) VALUES
('MATH', 'Toán cao cấp'),
('DSA', 'Cấu trúc dữ liệu'),
('DB', 'Cơ sở dữ liệu');

INSERT INTO scores (student_id, subject_id, score) VALUES
(1, 'MATH', 9.0),
(1, 'DSA', 8.0),
(1, 'DB', 8.5),
(2, 'MATH', 7.0),
(2, 'DSA', 6.5),
(2, 'DB', 7.5),
(3, 'MATH', 6.0),
(3, 'DB', 6.0),
(4, 'MATH', 4.0),
(4, 'DSA', 5.0);


SELECT 
    s.student_id, 
    s.student_name, 
    AVG(sc.score) AS diem_trung_binh
FROM students s
JOIN scores sc ON s.student_id = sc.student_id
GROUP BY s.student_id, s.student_name;


SELECT 
    s.student_id, 
    s.student_name, 
    AVG(sc.score) AS diem_trung_binh
FROM students s
JOIN scores sc ON s.student_id = sc.student_id
GROUP BY s.student_id, s.student_name
HAVING AVG(sc.score) >= 7.0;

SELECT 
    s.student_id, 
    s.student_name, 
    AVG(sc.score) AS diem_trung_binh
FROM students s
JOIN scores sc ON s.student_id = sc.student_id
GROUP BY s.student_id, s.student_name
HAVING AVG(sc.score) = (
    SELECT MAX(dtb) 
    FROM (
        SELECT AVG(score) AS dtb 
        FROM scores 
        GROUP BY student_id
    ) AS sub
);

SELECT 
    s.student_id, 
    s.student_name, 
    AVG(sc.score) AS diem_trung_binh
FROM students s
JOIN scores sc ON s.student_id = sc.student_id
GROUP BY s.student_id, s.student_name
HAVING AVG(sc.score) > (
    SELECT AVG(score) 
    FROM scores
);