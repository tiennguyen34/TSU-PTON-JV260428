CREATE DATABASE  qlnv;
USE qlnv;
CREATE TABLE employees (
    emp_id VARCHAR(10) NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    birth_year INT NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary DECIMAL(12, 2) NOT NULL,
    phone VARCHAR(15) DEFAULT NULL,
    PRIMARY KEY (emp_id)
);

INSERT INTO employees (emp_id, full_name, birth_year, department, salary, phone) VALUES
('NV001', 'Nguyen Hoang Anh', 1995, 'IT', 15000000, '0912345678'),
('NV002', 'Tran Thi Binh', 1998, 'HR', 12000000, '0987654321'),
('NV003', 'Le Viết Anh', 1993, 'IT', 25000000, NULL), 
('NV004', 'Pham Minh Tuan', 1996, 'Sales', 8000000, '0901234567'),
('NV005', 'Hoang Tu Anh', 2000, 'HR', 18000000, NULL), 
('NV006', 'Vu Thi Mai', 1997, 'Marketing', 4500000, '0934567890'), 
('NV007', 'Doan Van Hung', 1994, 'IT', 19000000, '0956789012'),
('NV008', 'Ngo Thu Ha', 1999, 'Sales', 9500000, '0967890123'),
('NV009', 'Bui Quoc Bao', 1992, 'IT', 4800000, '0978901234'), 
('NV010', 'Dang Ngoc Lan', 1995, 'Finance', 22000000, '0989012345');

SELECT * FROM employees 
WHERE salary BETWEEN 10000000 AND 20000000;

SELECT * FROM employees 
WHERE salary BETWEEN 10000000 AND 20000000;

SELECT * FROM employees 
WHERE full_name LIKE '%Anh%';

SELECT * FROM employees 
WHERE phone IS NULL;

UPDATE employees 
SET salary = salary * 1.10 
WHERE department = 'IT';

UPDATE employees 
SET phone = '0243999999' 
WHERE phone IS NULL;

DELETE FROM employees 
WHERE salary < 5000000;
