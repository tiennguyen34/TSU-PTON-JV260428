
CREATE TABLE orders (
    ma_don_hang VARCHAR(20) PRIMARY KEY,      
    ngay_dat_hang DATE NOT NULL,              
    trang_thai VARCHAR(50) NOT NULL          
);

CREATE TABLE products (
    ma_san_pham VARCHAR(20) PRIMARY KEY,       
    ten_san_pham VARCHAR(150) NOT NULL,       
    gia_ban INT NOT NULL                      
);

CREATE TABLE order_items (
    PRIMARY KEY (ma_don_hang, ma_san_pham),         
    FOREIGN KEY (ma_don_hang) REFERENCES orders(ma_don_hang),
    FOREIGN KEY (ma_san_pham) REFERENCES products(ma_san_pham),
	ma_don_hang VARCHAR(20),                 
    ma_san_pham VARCHAR(20),             
    so_luong INT NOT NULL
  
);
