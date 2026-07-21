--
INSERT INTO orders (customer_id, order_date) VALUES (1, '2026-07-21');

INSERT INTO order_details (order_id, product_id, quantity, price) VALUES 
(1, 1, 2, 150.0), -- Mua 2 sản phẩm id 1 với giá 150
(1, 2, 1, 250.0); -- Mua 1 sản phẩm id 2 với giá 250
--
SELECT SUM(quantity * price) AS tong_doanh_thu_cua_hang 
FROM order_details;
--
SELECT AVG(tong_don_hang) AS doanh_thu_trung_binh_don_hang
FROM (
    SELECT order_id, SUM(quantity * price) AS tong_don_hang
    FROM order_details
    GROUP BY order_id
) AS doanh_thu_tung_don;
--
SELECT o.id AS order_id, o.customer_id, o.order_date, SUM(od.quantity * od.price) AS doanh_thu
FROM orders o
JOIN order_details od ON o.id = od.order_id
GROUP BY o.id, o.customer_id, o.order_date
ORDER BY doanh_thu DESC
LIMIT 1;
--
SELECT product_id, SUM(quantity) AS tong_so_luong_da_ban
FROM order_details
GROUP BY product_id
ORDER BY tong_so_luong_da_ban DESC
LIMIT 3;
