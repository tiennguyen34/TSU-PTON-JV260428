CREATE DATABASE company_finance_db;
USE company_finance_db;

CREATE TABLE employees (
    employee_code VARCHAR(20) PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,   
    salary DOUBLE NOT NULL            
);

INSERT INTO employees (employee_code, full_name, salary) VALUES 
('NV001', 'Nguyễn Văn A', 15000000),
('NV002', 'Trần Thị B', 25000000),
('NV003', 'Lê Minh C', 20000000);

DELIMITER //

CREATE PROCEDURE sp_get_avg_salary()
BEGIN
    DECLARE v_avg_salary DOUBLE DEFAULT 0;
    SELECT AVG(salary) INTO v_avg_salary FROM employees;
    SELECT v_avg_salary AS muc_luong_trung_binh;
END //

DELIMITER ;

CALL sp_get_avg_salary();
