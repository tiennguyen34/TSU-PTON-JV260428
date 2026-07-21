
CREATE DATABASE qlsp_db;
USE qlsp_db;

CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    price DOUBLE NOT NULL,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE SET NULL
);
--
INSERT INTO products (name, price, category_id) VALUES 
('Sản phẩm A', 150.0, 1),
('Sản phẩm B', 250.0, 2),
('Sản phẩm C', 350.0, 1);
--
UPDATE products 
SET price = 180.0 
WHERE id = 1;
--
DELETE FROM products 
WHERE id = 3;
--
SELECT c.name AS ten_danh_muc, COUNT(p.id) AS so_luong_san_pham
FROM categories c
LEFT JOIN products p ON c.id = p.category_id
GROUP BY c.id, c.name;
