
CREATE TABLE classes (
    ma_lop VARCHAR(20) PRIMARY KEY,          
    ten_lop VARCHAR(20) NOT NULL,           
    nam_hoc VARCHAR(20) NOT NULL            
);


CREATE TABLE students (
    ma_sv VARCHAR(20) PRIMARY KEY,   
    FOREIGN KEY (ma_lop) REFERENCES classes(ma_lop) ,    
    ma_lop VARCHAR(20) ,             
    ho_ten VARCHAR(50) NOT NULL,            
    ngay_sinh DATE,                         
    gioi_tinh VARCHAR(10)   
);
