CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    stock INT NOT NULL
);


CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    total_price DECIMAL(10,2) NOT NULL,
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(product_id)
    REFERENCES products(id)
);


INSERT INTO products
(product_name, price, stock)
VALUES
('Laptop Gaming',20000000.00,10);



DELIMITER //

CREATE PROCEDURE place_order(
    IN p_product_id INT,
    IN p_quantity INT
)

BEGIN

    DECLARE v_stock INT;
    DECLARE v_price DECIMAL(10,2);
    DECLARE v_total_price DECIMAL(10,2);


    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Đặt hàng thất bại! Lỗi hệ thống.' AS message;
    END;


    START TRANSACTION;


    IF p_quantity <= 0 THEN

        ROLLBACK;

        SELECT 'Số lượng đặt hàng phải lớn hơn 0' AS message;


    ELSE


        SELECT 
            stock,
            price
        INTO
            v_stock,
            v_price
        FROM products
        WHERE id = p_product_id
        FOR UPDATE;



        IF v_stock IS NULL THEN

            ROLLBACK;

            SELECT 'Sản phẩm không tồn tại' AS message;



        ELSEIF v_stock < p_quantity THEN

            ROLLBACK;

            SELECT 'Kho không đủ hàng' AS message;



        ELSE


            UPDATE products
            SET stock = stock - p_quantity
            WHERE id = p_product_id;


            SET v_total_price = v_price * p_quantity;


            INSERT INTO orders
            (
                product_id,
                quantity,
                total_price
            )
            VALUES
            (
                p_product_id,
                p_quantity,
                v_total_price
            );


            COMMIT;


            SELECT 'Đặt hàng thành công!' AS message;


        END IF;


    END IF;


END //

DELIMITER ;


SELECT * FROM products;


CALL place_order(1,2);


SELECT * FROM products;

SELECT * FROM orders;


CALL place_order(1,20);


SELECT * FROM products;

SELECT * FROM orders;