CREATE DATABASE store_db;
USE store_db;

CREATE TABLE products (
    product_code VARCHAR(20) PRIMARY KEY, 
    name VARCHAR(255) NOT NULL,           
    price DOUBLE NOT NULL,                
    category VARCHAR(100) NOT NULL         
);

INSERT INTO products (product_code, name, price, category) VALUES 
('P001', 'Điện thoại iPhone 15', 20000000, 'Điện tử'),
('P002', 'Tủ lạnh Samsung', 15000000, 'Gia dụng'),
('P003', 'Laptop Dell', 25000000, 'Điện tử');

DELIMITER //

CREATE PROCEDURE sp_get_products_by_category(
    IN p_category VARCHAR(100) 
)
BEGIN
    SELECT product_code, name, price, category 
    FROM products 
    WHERE category = p_category;
END //

DELIMITER ;

CALL sp_get_products_by_category('Điện tử');
