--
SELECT * FROM products 
WHERE price BETWEEN 100.0 AND 300.0;
--
SELECT * FROM products 
WHERE name LIKE '%Sản phẩm%';
--
SELECT category_id, AVG(price) AS gia_trung_binh
FROM products
GROUP BY category_id;
--
SELECT * FROM products 
WHERE price > (SELECT AVG(price) FROM products);
--
SELECT p1.*
FROM products p1
WHERE p1.price = (
    SELECT MIN(p2.price) 
    FROM products p2 
    WHERE p2.category_id = p1.category_id
);
