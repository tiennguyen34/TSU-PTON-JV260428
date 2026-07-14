	CREATE TABLE classes (
    class_id INT AUTO_INCREMENT,
    class_name VARCHAR(100) NOT NULL,
    PRIMARY KEY (class_id)
);

CREATE TABLE students (
    student_id INT AUTO_INCREMENT,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    class_id INT NOT NULL,
    PRIMARY KEY (student_id),
    FOREIGN KEY (class_id) REFERENCES classes(class_id)
);