DELIMITER //

CREATE TRIGGER BeforeInsertProduct
BEFORE INSERT ON products
FOR EACH ROW
BEGIN

    IF NEW.quantity < 0 THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Không thể thêm sản phẩm vì số lượng không được nhỏ hơn 0!';

    END IF;

END //

DELIMITER ;


INSERT INTO products
(productName, quantity)
VALUES
('Bàn phím cơ',15);



INSERT INTO products
(productName, quantity)
VALUES
('Tai nghe Gaming',-5);



SELECT * FROM products;

INSERT INTO products
(productName, quantity)
VALUES
('Bàn phím cơ',15);

INSERT INTO products
(productName, quantity)
VALUES
('Tai nghe Gaming',-5);