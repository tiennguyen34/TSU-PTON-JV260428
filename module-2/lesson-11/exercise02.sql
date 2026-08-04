CREATE TABLE accounts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100),
    balance DECIMAL(10,2) NOT NULL
);

INSERT INTO accounts (id, customer_name, balance) 
VALUES (2, 'Nguyễn Văn M', 300000.00);
DELIMITER //

CREATE PROCEDURE withdraw_money(
    IN p_account_id INT,
    IN p_amount DECIMAL(10,2)
)
BEGIN
    DECLARE current_balance DECIMAL(10,2);

    START TRANSACTION;

    UPDATE accounts 
    SET balance = balance - p_amount 
    WHERE id = p_account_id;

    SELECT balance INTO current_balance 
    FROM accounts 
    WHERE id = p_account_id;

    IF current_balance < 0 THEN
        ROLLBACK;
        SELECT 'Giao dịch thất bại! Số dư không đủ.' AS message;
    ELSE
        COMMIT;
        SELECT 'Rút tiền thành công.' AS message;
    END IF;
END //

DELIMITER ;
CALL withdraw_money(2, 500000.00);

SELECT * FROM accounts WHERE id = 2;

CALL withdraw_money(2, 100000.00);

SELECT * FROM accounts WHERE id = 2;

