CREATE DATABASE company_db;
USE company_db;

CREATE TABLE employees (
    employee_code VARCHAR(20) PRIMARY KEY, 
    full_name VARCHAR(100) NOT NULL,      
    department VARCHAR(100) NOT NULL,    
    salary DOUBLE NOT NULL              
);

CREATE INDEX idx_department ON employees(department);
