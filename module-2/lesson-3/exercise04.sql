CREATE TABLE users (
	PRIMARY KEY (user_id),
    CONSTRAINT uk_username UNIQUE (username),
    CONSTRAINT uk_email UNIQUE (email),
    user_id INT AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100),
    status VARCHAR(20) DEFAULT 'active'
   
);

ALTER TABLE users
ADD CONSTRAINT chk_status CHECK (status IN ('active', 'inactive', 'banned'));

DROP TABLE IF EXISTS users;
