CREATE TABLE IF NOT EXISTS book(
	b_id VARCHAR(10) NOT NULL,
	b_name VARCHAR(100),
	b_price INTEGER,
	b_author VARCHAR(50),
	b_description TEXT,
	b_publisher VARCHAR(50),
	b_category VARCHAR(30),
	b_unitsInStock LONG,
	b_releaseDate VARCHAR(20),
	b_condition VARCHAR(20),
	b_filename VARCHAR(30),
	PRIMARY KEY (b_id)
) default CHARSET=utf8;