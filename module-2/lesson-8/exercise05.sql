CREATE DATABASE company_income_db;
USE company_income_db;


CREATE TABLE employees (
    employee_code VARCHAR(20) PRIMARY KEY, 
    full_name VARCHAR(100) NOT NULL,     
    salary DOUBLE NOT NULL,
    department VARCHAR(100) NOT NULL    
);
DELIMITER //

CREATE PROCEDURE sp_check_employee_income(
    IN p_emp_name VARCHAR(100),
    IN p_salary DOUBLE          
)
BEGIN
    DECLARE v_income_level VARCHAR(50);
    IF p_salary >= 15000000 THEN
        SET v_income_level = 'Thu nhập cao';
    ELSEIF p_salary >= 8000000 AND p_salary < 15000000 THEN
        SET v_income_level = 'Thu nhập trung bình';
    ELSE
        SET v_income_level = 'Thu nhập thấp';
    END IF;
    SELECT p_emp_name AS ten_nhan_vien, v_income_level AS muc_thu_nhap;
END //

DELIMITER ;

CALL sp_check_employee_income('Nguyễn Văn A', 16000000);
CALL sp_check_employee_income('Trần Thị B', 10000000);
CALL sp_check_employee_income('Lê Minh C', 5500000);
