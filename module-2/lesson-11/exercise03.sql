CREATE TABLE IF NOT EXISTS accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100),
    balance DECIMAL(10,2) NOT NULL
);

INSERT INTO accounts (account_id, customer_name, balance)
VALUES (3, 'Nguyễn Văn An', 0.00)
ON DUPLICATE KEY UPDATE customer_name='Nguyễn Văn An';

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    account_id INT,
    amount DECIMAL(10,2) NOT NULL,
    log_message VARCHAR(255),
    transaction_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (account_id) REFERENCES accounts(account_id)
);
DELIMITER //

CREATE PROCEDURE deposit_with_logging(
    IN p_account_id INT,
    IN p_amount DECIMAL(10,2)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Giao dịch thất bại! Đã xảy ra lỗi hệ thống và được hoàn tác.' AS message;
    END;

    START TRANSACTION;

    UPDATE accounts 
    SET balance = balance + p_amount 
    WHERE account_id = p_account_id;
    INSERT INTO transactions (account_id, amount, log_message)
    VALUES (p_account_id, p_amount, 'Nạp tiền vào tài khoản');
    COMMIT;
    SELECT 'Giao dịch thành công và đã ghi log.' AS message;

END //

DELIMITER ;

CALL deposit_with_logging(3, 1000000.00);
SELECT * FROM accounts WHERE account_id = 3;

SELECT * FROM transactions;
