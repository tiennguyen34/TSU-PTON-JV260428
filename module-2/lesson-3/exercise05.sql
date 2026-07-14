CREATE TABLE teachers (
    teacher_id INT AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    PRIMARY KEY (teacher_id),
    CONSTRAINT uk_teacher_email UNIQUE (email) 
);

CREATE TABLE courses (
    course_id INT AUTO_INCREMENT,
    course_name VARCHAR(150) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    teacher_id INT NOT NULL,
    PRIMARY KEY (course_id),
    FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
);

CREATE TABLE students (
    student_id INT AUTO_INCREMENT,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    PRIMARY KEY (student_id),
    CONSTRAINT uk_student_email UNIQUE (email) 
);

CREATE TABLE enrollments (
	PRIMARY KEY (student_id, course_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    student_id INT,
    course_id INT,
    enrollment_date DATETIME DEFAULT CURRENT_TIMESTAMP
);
ALTER TABLE courses
ADD CONSTRAINT chk_course_price CHECK (price > 0);
DROP TABLE IF EXISTS enrollments;
