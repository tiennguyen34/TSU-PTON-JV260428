
CREATE TABLE books (
    book_id INT AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    PRIMARY KEY (book_id)
);

CREATE TABLE readers (
    reader_id INT AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    PRIMARY KEY (reader_id)
);

CREATE TABLE borrowings (
    borrowing_id INT AUTO_INCREMENT,
    book_id INT,
    reader_id INT,
    borrow_date DATE,
    return_date DATE,
    PRIMARY KEY (borrowing_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id),
    FOREIGN KEY (reader_id) REFERENCES readers(reader_id)
);

ALTER TABLE borrowings 
MODIFY COLUMN borrow_date DATE NOT NULL;

