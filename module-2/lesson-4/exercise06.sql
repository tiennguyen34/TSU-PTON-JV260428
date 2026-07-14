CREATE DATABASE  qlsp;
USE qlsp;
CREATE TABLE products (
    product_id VARCHAR(10) NOT NULL,
    product_name VARCHAR(150) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(12, 2) NOT NULL,
    quantity INT NOT NULL,
    PRIMARY KEY (product_id)
);

INSERT INTO products (product_id, product_name, category, price, quantity) VALUES
('SP001', 'Samsung Galaxy Book', 'Laptop', 14500000, 10),
('SP002', 'Dell Inspiron 15', 'Laptop', 12000000, 5),
('SP003', 'Samsung Galaxy S24', 'Phone', 18000000, 15),
('SP004', 'iPad Air 5', 'Tablet', 13500000, 0),
('SP005', 'Xiaomi Redmi Note 13', 'Phone', 4500000, 20);

SELECT * FROM products 
WHERE price BETWEEN 5000000 AND 15000000;

SELECT * FROM products 
WHERE category IN ('Laptop', 'Tablet');

SELECT * FROM products 
WHERE product_name LIKE 'Sam%';

SELECT * FROM products 
WHERE category != 'Phone'; 

UPDATE products 
SET price = price * 0.95 
WHERE category = 'Laptop';

DELETE FROM products 
WHERE quantity = 0;

SELECT * FROM products;
