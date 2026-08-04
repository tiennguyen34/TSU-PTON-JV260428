CREATE TABLE employees (
    id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    salary DECIMAL(10,2),
    email VARCHAR(100) UNIQUE,
    phone_number VARCHAR(15)
);


CREATE TABLE salary_logs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    old_salary DECIMAL(10,2),
    new_salary DECIMAL(10,2),
    change_date DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(employee_id)
    REFERENCES employees(id)
);


INSERT INTO employees 
(first_name, last_name, salary, email, phone_number)
VALUES
('An', 'Nguyễn Văn', 15000000.00, 'an.nguyen@example.com', '0901234567'),
('Bình', 'Trần Thị', 12000000.00, 'binh.tran@example.com', '0902345678'),
('Cường', 'Lê Hoàng', 18000000.00, 'cuong.le@example.com', '0903456789'),
('Dung', 'Phạm Phương', 14500000.00, 'dung.pham@example.com', '0904567890'),
('Hải', 'Hoàng Minh', 20000000.00, 'hai.hoang@example.com', '0905678901'),
('Hương', 'Phan Thu', 13000000.00, 'huong.phan@example.com', '0906789012'),
('Khanh', 'Vũ Quốc', 25000000.00, 'khanh.vu@example.com', '0907890123'),
('Lan', 'Đặng Mai', 11000000.00, 'lan.dang@example.com', '0908901234'),
('Minh', 'Bùi Quang', 16500000.00, 'minh.bui@example.com', '0909012345'),
('Nam', 'Đỗ Tiến', 19000000.00, 'nam.do@example.com', '0900123456');



DELIMITER //

CREATE TRIGGER trg_after_update_salary

AFTER UPDATE ON employees

FOR EACH ROW

BEGIN

    IF OLD.salary <> NEW.salary THEN

        INSERT INTO salary_logs
        (
            employee_id,
            old_salary,
            new_salary
        )

        VALUES
        (
            OLD.id,
            OLD.salary,
            NEW.salary
        );

    END IF;

END //

DELIMITER ;



UPDATE employees

SET salary = 17500000.00

WHERE id = 1;



SELECT *

FROM employees

WHERE id = 1;



SELECT *

FROM salary_logs;