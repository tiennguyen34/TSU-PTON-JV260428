CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100),
    total_amount DECIMAL(10,2),
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(50) DEFAULT 'Pending'
);



CREATE TABLE order_logs (
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    old_status VARCHAR(50),
    new_status VARCHAR(50),
    log_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(order_id)
    REFERENCES orders(id)
);



INSERT INTO orders
(customer_name, total_amount, status)
VALUES
('Nguyễn Văn Tùng',1500000.00,'Pending');



DELIMITER //

CREATE TRIGGER after_order_status_update

AFTER UPDATE ON orders

FOR EACH ROW

BEGIN

    IF OLD.status <> NEW.status THEN

        INSERT INTO order_logs
        (
            order_id,
            old_status,
            new_status
        )

        VALUES
        (
            OLD.id,
            OLD.status,
            NEW.status
        );

    END IF;

END //

DELIMITER ;



UPDATE orders

SET status = 'Shipping'

WHERE id = 1;



UPDATE orders

SET customer_name = 'Nguyễn Văn Tùng - VIP'

WHERE id = 1;



SELECT *

FROM orders;



SELECT *

FROM order_logs;