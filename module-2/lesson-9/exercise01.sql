CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    address VARCHAR(255) NOT NULL
);



INSERT INTO customers
(customer_name, email, phone, address)
VALUES
('Nguyễn Văn An','an@example.com','0901234567','Hà Nội'),
('Trần Văn Bình','binh@example.com','0902345678','Đà Nẵng'),
('Lê Văn Cường','cuong@example.com','0903456789','Hồ Chí Minh'),
('Phạm Văn Dũng','dung@example.com','0904567890','Hải Phòng');



EXPLAIN
SELECT *
FROM customers
WHERE email = 'test@example.com';



EXPLAIN
SELECT *
FROM customers
WHERE phone = '0901234567';



CREATE UNIQUE INDEX idx_customers_email
ON customers(email);



CREATE INDEX idx_customers_phone
ON customers(phone);



EXPLAIN
SELECT *
FROM customers
WHERE email = 'an@example.com';



EXPLAIN
SELECT *
FROM customers
WHERE phone = '0901234567';