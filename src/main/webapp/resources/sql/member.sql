CREATE TABLE member (
    id VARCHAR(20) PRIMARY KEY,
    password VARCHAR(20) NOT NULL,
    name VARCHAR(20) NOT NULL,
    gender VARCHAR(4),
    birth DATE,
    email VARCHAR(50) NOT NULL,
    phone VARCHAR(20) NOT NULL,
    address VARCHAR(90) NOT NULL,
    reg_date TIMESTAMP DEFAULT NOW(),
    PRIMARY KEY (id)
) DEFAULT CHARSET=utf8;