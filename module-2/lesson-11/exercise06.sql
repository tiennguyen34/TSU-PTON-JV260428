ALTER TABLE orders 
ADD COLUMN status VARCHAR(20) DEFAULT 'Completed';


UPDATE orders 
SET status = 'Completed' 
WHERE status IS NULL;


DELIMITER //

CREATE PROCEDURE cancel_order(
    IN p_order_id INT
)

BEGIN

    DECLARE v_product_id INT;
    DECLARE v_quantity INT;
    DECLARE v_status VARCHAR(20);


    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Hủy đơn hàng thất bại! Đã xảy ra lỗi hệ thống.' AS message;
    END;


    START TRANSACTION;


    SELECT 
        product_id,
        quantity,
        status

    INTO
        v_product_id,
        v_quantity,
        v_status

    FROM orders

    WHERE id = p_order_id

    FOR UPDATE;



    IF v_status IS NULL THEN


        ROLLBACK;

        SELECT 'Hủy đơn hàng thất bại! Đơn hàng không tồn tại.' AS message;



    ELSEIF v_status = 'Cancelled' THEN


        ROLLBACK;

        SELECT 'Đơn hàng này đã được hủy trước đó.' AS message;



    ELSE


        UPDATE orders

        SET status = 'Cancelled'

        WHERE id = p_order_id;



        UPDATE products

        SET stock = stock + v_quantity

        WHERE id = v_product_id;



        COMMIT;


        SELECT 'Hủy đơn hàng thành công và đã hoàn lại số lượng vào kho.' AS message;


    END IF;


END //

DELIMITER ;