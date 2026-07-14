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
    PRIMARY KEY (Order_id, product_name),
    FOREIGN KEY (Order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (Customer_id) REFERENCES Customers(customer_id)
);


INSERT INTO Customers (customer_id, customer_name) VALUES
(1, 'Nguyễn Văn A'),
(2, 'Trần Thị B'),
(3, 'Lê Hoàng C');

INSERT INTO Orders (order_id, order_date, customer_id) VALUES
(101, '2026-07-10', 1),
(102, '2026-07-12', 2),
(103, '2026-07-14', 3);

INSERT INTO Order_items (Order_id, Customer_id, product_name, quantity, price) VALUES
(101, 1, 'Điện thoại iPhone 15', 1, 12000000.00),
(101, 1, 'Sạc dự phòng Anker', 2, 500000.00),
(102, 2, 'Tai nghe AirPods 3', 1, 4500000.00),
(103, 3, 'Laptop Dell Inspiron', 1, 15000000.00);

SELECT 
    o.order_id, 
    o.order_date, 
    c.customer_name
FROM Orders o
JOIN Customers c ON o.customer_id = c.customer_id;


SELECT 
    order_id, 
    product_name, 
    quantity, 
    price
FROM Order_items
ORDER BY order_id;


SELECT 
    Order_id, 
    SUM(quantity * price) AS tong_tien
FROM Order_items
GROUP BY Order_id;

SELECT 
    Order_id, 
    SUM(quantity * price) AS tong_tien
FROM Order_items
GROUP BY Order_id
HAVING SUM(quantity * price) > 10000000;