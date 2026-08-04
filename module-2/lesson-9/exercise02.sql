DROP VIEW IF EXISTS view_customer_contact;


CREATE VIEW view_customer_contact AS
SELECT 
    customer_id,
    customer_name,
    email,
    phone
FROM customers;



INSERT INTO customers
(customer_name, email, phone, address)
VALUES
('Alice','alice@example.com','1234567890','123 Street A'),
('Bob','bob@example.com','1234567891','456 Street B'),
('Carol','carol@example.com','1234567892','789 Street C'),
('David','david@example.com','1234567893','101 Street D'),
('Eva','eva@example.com','1234567894','202 Street E'),
('Frank','frank@example.com','1234567895','303 Street F'),
('Grace','grace@example.com','1234567896','404 Street G'),
('Hannah','hannah@example.com','1234567897','505 Street H');



SELECT *
FROM view_customer_contact;