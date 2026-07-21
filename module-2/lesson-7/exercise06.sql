CREATE DATABASE order_management_db;
USE order_management_db;

CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE NOT NULL,         
    status VARCHAR(50) NOT NULL,       
    total_amount DOUBLE NOT NULL     
);

CREATE INDEX idx_search_status_date ON orders(status, order_date);
