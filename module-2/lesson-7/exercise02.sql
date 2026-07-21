CREATE DATABASE shop_db;
USE shop_db;

CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY, 
    name VARCHAR(255) NOT NULL        
);

CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY, 
    order_date DATE NOT NULL,          
    customer_id INT,                   
    FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE SET NULL
);

INSERT INTO customers (name) VALUES 
('Nguyễn Văn A'),
('Trần Thị B');

INSERT INTO orders (order_date, customer_id) VALUES 
('2026-07-20', 1),
('2026-07-21', 2),
('2026-07-21', 1);

CREATE VIEW v_order_info AS
SELECT 
    o.id AS order_id,         -- mã đơn hàng
    o.order_date,             -- ngày đặt hàng
    c.name AS customer_name   -- tên khách hàng
FROM orders o
INNER JOIN customers c ON o.customer_id = c.id;

SELECT * FROM v_order_info;
