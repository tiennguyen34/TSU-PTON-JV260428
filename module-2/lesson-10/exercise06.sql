CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) DEFAULT 0.00,
    stock INT NOT NULL
);


INSERT INTO products
(id, product_name, price, stock)
VALUES
(1,'iPhone 15',20000000.00,5)
ON DUPLICATE KEY UPDATE
stock = 5;



CREATE TABLE cart_items (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    quantity INT NOT NULL,

    FOREIGN KEY(product_id)
    REFERENCES products(id)
);



DELIMITER //

CREATE TRIGGER before_cart_add

BEFORE INSERT ON cart_items

FOR EACH ROW

BEGIN

    DECLARE v_stock INT;


    SELECT stock

    INTO v_stock

    FROM products

    WHERE id = NEW.product_id;



    IF v_stock IS NULL THEN


        SIGNAL SQLSTATE '45000'

        SET MESSAGE_TEXT = 'Sản phẩm không tồn tại!';



    ELSEIF NEW.quantity <= 0 THEN


        SIGNAL SQLSTATE '45000'

        SET MESSAGE_TEXT = 'Số lượng phải lớn hơn 0!';



    ELSEIF NEW.quantity > v_stock THEN


        SIGNAL SQLSTATE '45000'

        SET MESSAGE_TEXT = 'Số lượng hàng trong kho không đủ!';



    END IF;


END //

DELIMITER ;



TRUNCATE TABLE cart_items;



INSERT INTO cart_items
(product_id, quantity)
VALUES
(1,2);



SELECT * FROM cart_items;



INSERT INTO cart_items
(product_id, quantity)
VALUES
(1,10);



SELECT * FROM cart_items;