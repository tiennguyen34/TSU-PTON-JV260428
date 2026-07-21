SELECT p.id AS product_id, p.name AS product_name, p.price, c.name AS category_name
FROM products p
INNER JOIN categories c ON p.category_id = c.id;
--
SELECT c.id AS customer_id, c.name AS customer_name, COUNT(o.id) AS so_luong_don_hang
FROM customers c
LEFT JOIN orders o ON c.id = o.customer_id
GROUP BY c.id, c.name;
--
SELECT c.id AS customer_id, c.name AS customer_name, SUM(od.quantity * od.price) AS tong_chi_tieu
FROM customers c
INNER JOIN orders o ON c.id = o.customer_id
INNER JOIN order_details od ON o.id = od.order_id
GROUP BY c.id, c.name
ORDER BY tong_chi_tieu DESC
LIMIT 5;
--
SELECT p.id AS product_id, p.name AS product_name, p.price
FROM products p
LEFT JOIN order_details od ON p.id = od.product_id
WHERE od.product_id IS NULL;
--
SELECT DISTINCT cu.id AS customer_id, cu.name AS customer_name
FROM customers cu
INNER JOIN orders o ON cu.id = o.customer_id
INNER JOIN order_details od ON o.id = od.order_id
INNER JOIN products p ON od.product_id = p.id
WHERE p.category_id = (
    -- Subquery tìm category_id có nhiều sản phẩm nhất
    SELECT category_id 
    FROM products 
    GROUP BY category_id 
    ORDER BY COUNT(id) DESC 
    LIMIT 1
);
