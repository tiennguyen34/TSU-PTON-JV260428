-- Tạo bảng products nếu chưa có
CREATE TABLE IF NOT EXISTS products (
    product_id VARCHAR(10) NOT NULL,
    product_name VARCHAR(150) NOT NULL,
    category VARCHAR(50) NOT NULL,
    price DECIMAL(12, 2) NOT NULL,
    PRIMARY KEY (product_id)
);
INSERT INTO products (product_id, product_name, category, price) VALUES
('SP01', 'iPhone 15 Pro', 'Phone', 28000000),   
('SP02', 'Samsung Galaxy S23', 'Phone', 18000000),
('SP03', 'MacBook Air M2', 'Laptop', 26000000),  
('SP04', 'Asus Vivobook', 'Laptop', 14000000),
('SP05', 'iPad Pro', 'Tablet', 22000000),        
('SP06', 'Xiaomi Pad 6', 'Tablet', 8000000);

SELECT * 
FROM products 
WHERE price > (SELECT AVG(price) FROM products);

SELECT * 
FROM products 
WHERE (category, price) IN (
    SELECT category, MAX(price) 
    FROM products 
    GROUP BY category
);

SELECT * 
FROM products 
WHERE category IN (
    SELECT DISTINCT category 
    FROM products 
    WHERE price > 20000000
);
