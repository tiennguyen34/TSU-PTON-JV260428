CREATE DATABASE company_db;
USE company_db;

CREATE TABLE employees (
    employee_code VARCHAR(20) PRIMARY KEY, 
    full_name VARCHAR(100) NOT NULL,       
    department VARCHAR(100) NOT NULL,    
    salary DOUBLE NOT NULL,              
    id_card VARCHAR(20) NOT NULL       
);

INSERT INTO employees (employee_code, full_name, department, salary, id_card) VALUES 
('NV001', 'Nguyễn Văn A', 'Nhân sự', 15000000, '123456789'),
('NV002', 'Trần Thị B', 'Kế toán', 18000000, '987654321');


CREATE VIEW v_employee_public AS
SELECT employee_code, full_name, department
FROM employees;
