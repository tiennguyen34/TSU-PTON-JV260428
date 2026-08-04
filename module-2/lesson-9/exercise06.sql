DELIMITER //

CREATE PROCEDURE add_order(
    IN _customer_id INT,
    IN _product_id INT,
    IN _quantity INT,
    OUT _message VARCHAR(255)
)

BEGIN

    DECLARE v_stock INT;
    DECLARE v_price DECIMAL(12,2);


    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SET _message = 'Thêm đơn hàng thất bại do lỗi hệ thống.';
    END;



    START TRANSACTION;



    IF _quantity <= 0 THEN

        ROLLBACK;

        SET _message = 'Số lượng đặt hàng phải lớn hơn 0.';



    ELSE


        SELECT 
            stock,
            price

        INTO
            v_stock,
            v_price

        FROM products

        WHERE product_id = _product_id

        FOR UPDATE;



        IF v_stock IS NULL THEN


            ROLLBACK;

            SET _message = 'Sản phẩm không tồn tại.';



        ELSEIF v_stock < _quantity THEN


            ROLLBACK;

            SET _message = 'Không đủ số lượng sản phẩm để đặt hàng.';



        ELSE


            UPDATE products

            SET stock = stock - _quantity

            WHERE product_id = _product_id;



            INSERT INTO orders
            (
                customer_id,
                product_id,
                quantity,
                total_amount,
                status
            )

            VALUES
            (
                _customer_id,
                _product_id,
                _quantity,
                v_price * _quantity,
                'Success'
            );



            COMMIT;


            SET _message = 'Thêm đơn hàng thành công!';



        END IF;


    END IF;


END //

DELIMITER ;
SET @_message = '';

CALL add_order(1,1,2,@_message);

SELECT @_message AS result_message;