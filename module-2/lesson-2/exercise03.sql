CREATE TABLE students_constraint (
    ma_sv VARCHAR(20) PRIMARY KEY,         
    ho_ten VARCHAR(50) NOT NULL,           
    email VARCHAR(30) UNIQUE,            
    tuoi INT CHECK (tuoi >= 18)          
);
