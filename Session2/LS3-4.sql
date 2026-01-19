CREATE TABLE users (
	user_id INT PRIMARY KEY,
    username VARCHAR(50) UNIQUE,
    `password` VARCHAR(100) NOT NULL,
    `status` VARCHAR(10) DEFAULT 'ACTIVE'
		CHECK (`status` IN ('ACTIVE', 'INACTIVE'))
);