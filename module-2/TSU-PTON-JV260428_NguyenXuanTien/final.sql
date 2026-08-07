CREATE DATABASE student_management;
USE student_management;

-- 1. courses
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    course_code VARCHAR(20) NOT NULL UNIQUE,
    department VARCHAR(100) NOT NULL,
    creation_date DATE,
    CHECK (creation_date < CURRENT_DATE())
);

-- 2. students
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    major VARCHAR(100) NOT NULL,
    phone_number VARCHAR(15) NOT NULL UNIQUE,
    gpa DECIMAL(3,1) DEFAULT 4.0,
    CHECK (gpa BETWEEN 0.0 AND 4.0)
);

-- 3. enrollments
CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY,
    course_id INT,
    student_id INT,
    enroll_time DATETIME NOT NULL,
    credits INT,
    status VARCHAR(50),
    CHECK (credits > 0),
    CHECK (status IN ('Pending','Completed','Dropped')),
    FOREIGN KEY(course_id) REFERENCES courses(course_id),
    FOREIGN KEY(student_id) REFERENCES students(student_id)
);

-- 4. enrollment_details
CREATE TABLE enrollment_details (
    detail_id INT PRIMARY KEY,
    enrollment_id INT,
    attendance_check VARCHAR(150) NOT NULL,
    detail_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY(enrollment_id) REFERENCES enrollments(enrollment_id)
);

-- 5. academic_logs
CREATE TABLE academic_logs (
    log_id INT PRIMARY KEY,
    enrollment_id INT,
    student_id INT,
    log_time DATETIME NOT NULL,
    note TEXT,
    FOREIGN KEY(enrollment_id) REFERENCES enrollments(enrollment_id),
    FOREIGN KEY(student_id) REFERENCES students(student_id)
);

-- Chèn dữ liệu vào bảng courses
INSERT INTO courses (course_id, course_name, course_code, department, creation_date) VALUES
(1, 'Lập trình Java', 'JAVA01', 'CNTT', '2023-12-03'),
(2, 'Cấu trúc dữ liệu', 'DSA02', 'Khoa học máy tính', '1996-11-25'),
(3, 'Cơ sở dữ liệu', 'SQL03', 'CNTT', '2001-07-08'),
(4, 'Mạng máy tính', 'NET04', 'Truyền thông', '1998-01-19'),
(5, 'Trí tuệ nhân tạo', 'AI05', 'Khoa học máy tính', '2000-09-30');

-- Chèn dữ liệu vào bảng students
INSERT INTO students (student_id, full_name, major, phone_number, gpa) VALUES
(1, 'Nguyễn Văn Hải', 'Hệ thống TT', '0931112223', 3.8),
(2, 'Trần Thu Hà', 'Kỹ thuật PM', '0932223334', 4.0),
(3, 'Lê Quốc Tuấn', 'An toàn TT', '0933334445', 3.6),
(4, 'Phạm Minh Châu', 'Dữ liệu lớn', '0934445556', 3.9),
(5, 'Hoàng Gia Bảo', 'Kỹ thuật PM', '0935556667', 3.7);

-- Chèn dữ liệu vào bảng enrollments
INSERT INTO enrollments (enrollment_id, course_id, student_id, enroll_time, credits, status) VALUES
(7001, 1, 1, '2024-05-20 08:00:00', 3, 'Pending'),
(7002, 2, 2, '2024-05-20 09:30:00', 4, 'Completed'),
(7003, 3, 3, '2024-05-20 10:15:00', 3, 'Pending'),
(7004, 4, 5, '2024-05-21 07:00:00', 3, 'Completed'),
(7005, 5, 4, '2024-05-21 08:45:00', 4, 'Dropped');

-- Chèn dữ liệu vào bảng enrollment_details
INSERT INTO enrollment_details (detail_id, enrollment_id, attendance_check, detail_date) VALUES
(8001, 7002, 'Đủ điều kiện thi', '2024-05-20 10:00:00'),
(8002, 7004, 'Vắng 1 buổi', '2024-05-21 08:00:00'),
(8003, 7001, 'Đang học', '2024-05-20 09:00:00'),
(8004, 7003, 'Nghỉ phép', '2024-05-20 11:00:00'),
(8005, 7005, 'Không đi học', '2024-05-21 09:00:00');

-- Chèn dữ liệu vào bảng academic_logs
INSERT INTO academic_logs (log_id, enrollment_id, student_id, log_time, note) VALUES
(1, 7001, 1, '2024-05-20 09:05:00', 'Bắt đầu lớp học'),
(2, 7002, 2, '2024-05-20 10:05:00', 'Hoàn tất môn học'),
(3, 7003, 3, '2024-05-20 11:10:00', 'Đang sắp xếp lịch bù'),
(4, 7004, 5, '2024-05-21 08:10:00', 'Chờ phê duyệt điểm'),
(5, 7005, 4, '2024-05-21 09:05:00', 'Hủy do vắng quá số buổi');

-- TRUY VẤN CƠ BẢN
-- Câu 1: Sinh viên có GPA > 3.8 hoặc thuộc ngành "Kỹ thuật PM"
SELECT full_name, major, gpa 
FROM students 
WHERE gpa > 3.8 OR major = 'Kỹ thuật PM';

-- Câu 2: Môn học tạo từ 1998-01-01 đến 2001-12-31 và mã học phần bắt đầu bằng "A"
SELECT course_name, course_code 
FROM courses 
WHERE (creation_date BETWEEN '1998-01-01' AND '2001-12-31') 
  AND course_code LIKE 'A%';

-- Câu 3: Sắp xếp giảm dần theo tín chỉ, hiển thị 2 bản ghi ở trang thứ hai (Bỏ qua 2 bản ghi đầu)
SELECT enrollment_id, enroll_time, credits 
FROM enrollments 
ORDER BY credits DESC 
LIMIT 2 OFFSET 2;


-- TRUY VẤN NÂNG CAO
-- Câu 1: Liệt kê thông tin xử lý học vụ tổng hợp
SELECT 
    c.course_name, 
    s.full_name, 
    s.major, 
    e.credits, 
    e.enroll_time 
FROM enrollments e
JOIN courses c ON e.course_id = c.course_id
JOIN students s ON e.student_id = s.student_id;

-- Câu 2: Sinh viên có tổng số tín chỉ tích lũy (Completed) lớn hơn 120
SELECT 
    s.full_name, 
    SUM(e.credits) AS total_credits
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
WHERE e.status = 'Completed'
GROUP BY s.student_id, s.full_name
HAVING SUM(e.credits) > 120;

-- Câu 3: Sinh viên có điểm trung bình (GPA) cao nhất
SELECT student_id, full_name, gpa 
FROM students 
WHERE gpa = (SELECT MAX(gpa) FROM students);

-- INDEX & VIEW
-- Câu 1: Tạo index tổng hợp tối ưu truy vấn trên bảng enrollments
CREATE INDEX idx_enrollments_status_credits ON enrollments(status, credits);

-- Câu 2: Tạo view thống kê số môn học và tín chỉ tích lũy (không tính Dropped)
CREATE VIEW view_student_academic_summary AS
SELECT 
    s.full_name,
    COUNT(e.enrollment_id) AS total_courses_registered,
    SUM(CASE WHEN e.status = 'Completed' THEN e.credits ELSE 0 END) AS total_accumulated_credits
FROM students s
LEFT JOIN enrollments e ON s.student_id = e.student_id AND e.status != 'Dropped'
GROUP BY s.student_id, s.full_name;


-- TRIGGER
-- Câu 1: Tự động ghi log khi cập nhật trạng thái học sang 'Completed'
DELIMITER $$
CREATE TRIGGER trg_after_enrollment_update
AFTER UPDATE ON enrollments
FOR EACH ROW
BEGIN
    IF NEW.status = 'Completed' AND OLD.status <=> NEW.status = 0 THEN
        INSERT INTO academic_logs (enrollment_id, student_id, log_time, note)
        VALUES (NEW.enrollment_id, NEW.student_id, NOW(), 'Course completed');
    END IF;
END$$

-- Câu 2: Tự động tăng 0.1 GPA khi thêm mới một đăng ký học có trạng thái 'Completed'
CREATE TRIGGER trg_after_enrollment_insert
AFTER INSERT ON enrollments
FOR EACH ROW
BEGIN
    IF NEW.status = 'Completed' THEN
        UPDATE students 
        SET gpa = LEAST(gpa + 0.1, 4.0)
        WHERE student_id = NEW.student_id;
    END IF;
END$$
DELIMITER ;

-- STORED PROCEDURE
-- Câu 1: Kiểm tra tiến độ học tập dựa trên tổng số tín chỉ Completed
DELIMITER $$
CREATE PROCEDURE GetStudentProgressStatus(
    IN p_student_id INT,
    OUT p_message VARCHAR(50)
)
BEGIN
    DECLARE v_total_credits INT DEFAULT 0;
    
    SELECT COALESCE(SUM(credits), 0) INTO v_total_credits
    FROM enrollments 
    WHERE student_id = p_student_id AND status = 'Completed';
    
    IF v_total_credits > 100 THEN
        SET p_message = 'Excellent progress';
    ELSEIF v_total_credits = 100 THEN
        SET p_message = 'Target met';
    ELSE
        SET p_message = 'Normal progress';
    END IF;
END$$

-- Câu 2: Chuyển nhượng quyền tham gia lớp học có kèm Transaction
CREATE PROCEDURE ReassignStudentEnrollment(
    IN p_enrollment_id INT,
    IN p_new_student_id INT
)
BEGIN
    DECLARE sql_error INT DEFAULT FALSE;
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET sql_error = TRUE;
    START TRANSACTION;
    UPDATE enrollments 
    SET student_id = p_new_student_id 
    WHERE enrollment_id = p_enrollment_id;
    INSERT INTO academic_logs (enrollment_id, student_id, log_time, note)
    VALUES (p_enrollment_id, p_new_student_id, NOW(), 'Student reassigned');
    IF sql_error THEN
        ROLLBACK;
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Lỗi hệ thống! Toàn bộ thao tác đã được hủy (Rollback).';
    ELSE
        COMMIT;
    END IF;
END$$

DELIMITER ;
