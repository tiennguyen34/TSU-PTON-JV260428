CREATE TABLE IF NOT EXISTS employees (
    emp_id VARCHAR(10) NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    department VARCHAR(50) NOT NULL,
    salary DECIMAL(12, 2) NOT NULL,
    PRIMARY KEY (emp_id)
);

INSERT INTO employees (emp_id, full_name, department, salary) VALUES
('NV01', 'Nguyen Van A', 'IT', 15000000),
('NV02', 'Tran Thi B', 'IT', 14000000),
('NV03', 'Le Van C', 'IT', 16000000),
('NV04', 'Pham Minh D', 'IT', 11000000), 
('NV05', 'Hoang Thu E', 'HR', 10000000),
('NV06', 'Vu Van F', 'HR', 11000000),     
('NV07', 'Dang Thi G', 'Sales', 9000000);  

SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department;

SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department;

SELECT department, COUNT(*) AS total_employees
FROM employees
GROUP BY department
HAVING COUNT(*) > 3;

SELECT department, AVG(salary) AS average_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 12000000;
