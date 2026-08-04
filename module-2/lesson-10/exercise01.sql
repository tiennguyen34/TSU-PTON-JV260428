DROP DATABASE IF EXISTS InventoryManagement;

CREATE DATABASE IF NOT EXISTS InventoryManagement;

USE InventoryManagement;


CREATE TABLE products (
    productID INT PRIMARY KEY AUTO_INCREMENT,
    productName VARCHAR(100) NOT NULL,
    quantity INT NOT NULL
);


CREATE TABLE inventoryChanges (
    changeID INT PRIMARY KEY AUTO_INCREMENT,
    productID INT NOT NULL,
    oldQuantity INT,
    newQuantity INT,
    changeDate DATETIME DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY(productID)
    REFERENCES products(productID)
);


INSERT INTO products
(productName, quantity)
VALUES
('Laptop Gaming',10),
('Keyboard',50);



DELIMITER //

CREATE TRIGGER AfterProductUpdate

AFTER UPDATE ON products

FOR EACH ROW

BEGIN

    IF OLD.quantity <> NEW.quantity THEN

        INSERT INTO inventoryChanges
        (
            productID,
            oldQuantity,
            newQuantity
        )

        VALUES
        (
            OLD.productID,
            OLD.quantity,
            NEW.quantity
        );

    END IF;

END //

DELIMITER ;

INSERT INTO products (productName, quantity) VALUES ('Sản phẩm A', 50);

UPDATE products SET quantity = 45 WHERE productID = 1;

SELECT * FROM inventoryChanges;
