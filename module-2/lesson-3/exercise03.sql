CREATE TABLE orders (
    order_id INT AUTO_INCREMENT,
    order_date DATETIME NOT NULL,
    PRIMARY KEY (order_id)
);

CREATE TABLE products (
    product_id INT AUTO_INCREMENT,
    product_name VARCHAR(150) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (product_id)
);

CREATE TABLE order_items ( 
	PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    order_id INT,
    product_id INT,
    quantity INT NOT NULL
  
);
