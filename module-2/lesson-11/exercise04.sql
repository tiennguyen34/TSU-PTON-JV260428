INSERT INTO accounts (account_id, customer_name, balance) VALUES 
(4, 'Nguyễn Văn Tam', 2000000.00),
(5, 'Nguyễn Văn Tứ', 0.00)
ON DUPLICATE KEY UPDATE balance = VALUES(balance);
DELIMITER //

DELIMITER //

CREATE PROCEDURE transfer_money(
    IN p_sender_id INT,
    IN p_receiver_id INT,
    IN p_amount DECIMAL(10,2)
)
BEGIN

    DECLARE sender_balance DECIMAL(10,2);
    DECLARE receiver_count INT;


    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Giao dịch thất bại do lỗi hệ thống' AS message;
    END;


    START TRANSACTION;


    -- Không cho chuyển cho chính mình
    IF p_sender_id = p_receiver_id THEN
        
        ROLLBACK;
        SELECT 'Không thể chuyển tiền cho chính mình' AS message;


    ELSE


        -- Kiểm tra người nhận tồn tại
        SELECT COUNT(*)
        INTO receiver_count
        FROM accounts
        WHERE account_id = p_receiver_id;


        IF receiver_count = 0 THEN

            ROLLBACK;
            SELECT 'Không tìm thấy tài khoản người nhận' AS message;


        ELSE


            -- Lấy số dư người gửi và khóa dòng
            SELECT balance
            INTO sender_balance
            FROM accounts
            WHERE account_id = p_sender_id
            FOR UPDATE;


            IF sender_balance IS NULL THEN

                ROLLBACK;
                SELECT 'Không tìm thấy tài khoản người gửi' AS message;


            ELSEIF sender_balance < p_amount THEN

                ROLLBACK;
                SELECT 'Số dư không đủ' AS message;


            ELSE


                UPDATE accounts
                SET balance = balance - p_amount
                WHERE account_id = p_sender_id;


                UPDATE accounts
                SET balance = balance + p_amount
                WHERE account_id = p_receiver_id;


                COMMIT;


                SELECT 'Chuyển tiền thành công!' AS message;


            END IF;

        END IF;

    END IF;


END //

DELIMITER ;


CALL transfer_money(4, 5, 300000.00);
SELECT * FROM accounts WHERE account_id IN (4, 5);