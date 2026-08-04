CREATE TABLE IF NOT EXISTS products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(50) NOT NULL,
    price DECIMAL(12,2) NOT NULL CHECK (price > 0),
    stock INT NOT NULL CHECK (stock >= 0)
);



INSERT INTO products
(product_name, price, stock)
VALUES
('Product 1',500000.00,10),
('Product 2',1500000.00,5),
('Product 3',2000000.00,8),
('Product 4',850000.00,15),
('Product 5',1200000.00,12),
('Product 6',950000.00,20),
('Product 7',2500000.00,4),
('Product 8',300000.00,50),
('Product 9',1700000.00,6),
('Product 10',600000.00,30),
('Product 11',1100000.00,10),
('Product 12',1000000.00,15),
('Product 13',2200000.00,3),
('Product 14',450000.00,25),
('Product 15',1350000.00,7),
('Product 16',700000.00,18),
('Product 17',1800000.00,9),
('Product 18',990000.00,14),
('Product 19',3000000.00,2),
('Product 20',150000.00,40);



DELIMITER //

CREATE PROCEDURE get_high_value_products()

BEGIN

    SELECT
        product_id,
        product_name,
        price,
        stock

    FROM products

    WHERE price > 1000000.00;

END //

DELIMITER ;



CALL get_high_value_products();