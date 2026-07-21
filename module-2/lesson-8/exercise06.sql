CREATE DATABASE school_classification_db;
USE school_classification_db;

CREATE TABLE students (
    student_code VARCHAR(20) PRIMARY KEY, 
    full_name VARCHAR(100) NOT NULL,       
    gpa DOUBLE NOT NULL                  
);

DELIMITER //

CREATE PROCEDURE sp_classify_student(
    IN p_gpa DOUBLE,            
    OUT p_rank VARCHAR(50)       
)
BEGIN
    DECLARE v_classification VARCHAR(50);
    CASE 
        WHEN p_gpa >= 8.0 THEN 
            SET v_classification = 'Giỏi';
        WHEN p_gpa >= 6.5 AND p_gpa < 8.0 THEN 
            SET v_classification = 'Khá';
        WHEN p_gpa >= 5.0 AND p_gpa < 6.5 THEN 
            SET v_classification = 'Trung bình';
        ELSE 
            SET v_classification = 'Yếu';
    END CASE;
    SET p_rank = v_classification;
END //

DELIMITER ;


CALL sp_classify_student(8.5, @result_rank);
SELECT @result_rank AS xuat_ket_qua_1;

CALL sp_classify_student(7.0, @result_rank);
SELECT @result_rank AS xuat_ket_qua_2;

CALL sp_classify_student(4.5, @result_rank);
SELECT @result_rank AS xuat_ket_qua_3;
