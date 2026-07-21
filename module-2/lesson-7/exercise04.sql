CREATE DATABASE product_db;
USE product_db;


CREATE TABLE products (
    product_code VARCHAR(20) PRIMARY KEY, 
    name VARCHAR(255) NOT NULL,            
    category VARCHAR(100) NOT NULL,       
    price DOUBLE NOT NULL                 
);

CREATE INDEX idx_category_price ON products(category, price);
