DELIMITER //

CREATE TRIGGER BeforeProductDelete
BEFORE DELETE ON products
FOR EACH ROW
BEGIN

    IF OLD.quantity > 10 THEN

        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Không thể xóa sản phẩm vì số lượng tồn kho lớn hơn 10!';

    END IF;

END //

DELIMITER ;


INSERT INTO products
(productName, quantity)
VALUES
('Laptop Cao Cấp',15),
('Chuột Máy Tính',5);



DELETE FROM products
WHERE productName = 'Laptop Cao Cấp';



DELETE FROM products
WHERE productName = 'Chuột Máy Tính';



SELECT * FROM products;