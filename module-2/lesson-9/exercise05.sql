CREATE TABLE IF NOT EXISTS orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    product_id INT,
    quantity INT NOT NULL CHECK(quantity > 0),
    total_amount DECIMAL(10,2) NOT NULL CHECK(total_amount > 0),
    status ENUM('Pending','Success','Cancel') DEFAULT 'Pending',

    FOREIGN KEY(customer_id)
    REFERENCES customers(customer_id)
);



INSERT INTO orders
(customer_id, product_id, quantity, total_amount, status)
VALUES
(1,101,1,1500000.00,'Success'),
(1,102,1,2000000.00,'Success'),
(2,103,2,400000.00,'Success'),
(3,101,1,1500000.00,'Success'),
(3,104,1,1500000.00,'Success'),
(4,105,1,1200000.00,'Success'),
(5,102,1,2000000.00,'Success'),
(5,103,1,200000.00,'Success'),
(6,104,1,1500000.00,'Success'),
(7,105,1,1200000.00,'Success'),
(8,103,1,200000.00,'Success'),
(8,101,1,1500000.00,'Success');



CREATE VIEW view_customer_spending AS

SELECT

    c.customer_id,

    c.customer_name,

    COUNT(o.order_id) AS total_orders,

    SUM(o.total_amount) AS total_spent


FROM customers c


JOIN orders o

ON c.customer_id = o.customer_id


WHERE o.status = 'Success'


GROUP BY

    c.customer_id,

    c.customer_name;



SELECT *

FROM view_customer_spending;