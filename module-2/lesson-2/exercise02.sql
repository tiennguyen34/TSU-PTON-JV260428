create database quan_ly_san_pham;
use quan_ly_san_pham;
CREATE TABLE products (
    ma_sp VARCHAR(20) PRIMARY KEY,      
    ten_sp VARCHAR(50) NOT NULL,        
    gia_ban INT,                         
    so_luong_ton INT                     
);
DESCRIBE products;