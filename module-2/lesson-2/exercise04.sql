CREATE TABLE users (
    ma_nguoi_dung VARCHAR(20) PRIMARY KEY,              
    ten_dang_nhap VARCHAR(50) UNIQUE NOT NULL,         
    mat_khau VARCHAR(20) NOT NULL,                   
    trang_thai VARCHAR(20) DEFAULT 'ACTIVE'           
        CHECK (trang_thai IN ('ACTIVE', 'INACTIVE'))  
);
