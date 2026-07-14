CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255) NOT NULL
);

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    order_date DATE NOT NULL,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

CREATE TABLE Order_items (
    Order_id INT,
    Customer_id INT,
    product_name VARCHAR(255) NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(15, 2) NOT NULL,
    PRIMARY KEY (Order_id, product_name), -- Khóa chính kết hợp
    FOREIGN KEY (Order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (Customer_id) REFERENCES Customers(customer_id)
);

INSERT INTO Customers (customer_id, customer_name) VALUES
(1, 'Nguyễn Văn Anh'),
(2, 'Trần Thị Bình'),
(3, 'Lê Hoàng Cường');

INSERT INTO Orders (order_id, order_date, customer_id) VALUES
(101, '2026-07-01', 1),
(102, '2026-07-05', 2),
(103, '2026-07-10', 1),
(104, '2026-07-12', 3);

INSERT INTO Order_items (Order_id, Customer_id, product_name, quantity, price) VALUES
(101, 1, 'Laptop Asus', 1, 14000000.00),
(101, 1, 'Bàn phím cơ', 1, 1500000.00),
(102, 2, 'Điện thoại iPhone 15', 1, 21000000.00),
(103, 1, 'Màn hình Dell', 2, 5000000.00),
(104, 3, 'Tai nghe không dây', 3, 1500000.00);


SELECT 
    o.order_id, 
    c.customer_name, 
    SUM(oi.quantity * oi.price) AS tong_tien_don_hang
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id
JOIN Order_items oi ON o.order_id = oi.Order_id
GROUP BY o.order_id, c.customer_name;

SELECT 
    c.customer_id, 
    c.customer_name, 
    SUM(oi.quantity * oi.price) AS tong_doanh_thu
FROM Customers c
JOIN Order_items oi ON c.customer_id = oi.Customer_id
GROUP BY c.customer_id, c.customer_name;

SELECT 
    c.customer_id, 
    c.customer_name, 
    SUM(oi.quantity * oi.price) AS tong_doanh_thu
FROM Customers c
JOIN Order_items oi ON c.customer_id = oi.Customer_id
GROUP BY c.customer_id, c.customer_name
HAVING SUM(oi.quantity * oi.price) > 20000000;

SELECT 
    c.customer_id, 
    c.customer_name, 
    SUM(oi.quantity * oi.price) AS tong_doanh_thu
FROM Customers c
JOIN Order_items oi ON c.customer_id = oi.Customer_id
GROUP BY c.customer_id, c.customer_name
HAVING SUM(oi.quantity * oi.price) = (
    SELECT MAX(doanh_thu_khach) 
    FROM (
        SELECT SUM(quantity * price) AS doanh_thu_khach
        FROM Order_items
        GROUP BY Customer_id
    ) AS subquery
);