USE qlsp_db;

CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL
);

CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES customers(id) ON DELETE SET NULL
);


CREATE TABLE order_details (
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    price DOUBLE NOT NULL,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);

--
INSERT INTO customers (name, email) VALUES 
('Nguyễn Văn A', 'vana@example.com'),
('Trần Thị B', 'thib@example.com');
--
SELECT DISTINCT c.id, c.name, c.email 
FROM customers c
JOIN orders o ON c.id = o.customer_id;
--
SELECT c.id, c.name, c.email 
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
WHERE o.id IS NULL;
--
SELECT c.id, c.name, IFNULL(SUM(od.quantity * od.price), 0) AS tong_doanh_thu
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
LEFT JOIN order_details od ON o.id = od.order_id
GROUP BY c.id, c.name;
--
SELECT DISTINCT c.id, c.name, c.email
FROM customers c
JOIN orders o ON c.id = o.customer_id
JOIN order_details od ON o.id = od.order_id
WHERE od.price = (SELECT MAX(price) FROM order_details);




