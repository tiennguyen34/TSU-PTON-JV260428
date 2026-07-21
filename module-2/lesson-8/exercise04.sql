CREATE DATABASE order_check_db;
USE order_check_db;

CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY, 
    total_amount DOUBLE NOT NULL       
);
DELIMITER //

CREATE PROCEDURE sp_check_order_value(
    IN p_total_amount DOUBLE
)
BEGIN
    IF p_total_amount >= 5000000 THEN
        SELECT 'Đơn hàng giá trị cao' AS message;
    ELSE
        SELECT 'Đơn hàng bình thường' AS message;
    END IF; 
END //

DELIMITER ;

CALL sp_check_order_value(6500000);

CALL sp_check_order_value(3200000);
