USE session3_ql_nguoi_dung
CREATE TABLE users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE,
    password VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE,
    status VARCHAR(20) DEFAULT 'active'
);
ALTER TABLE users
ADD CONSTRAINT chk_status
CHECK (status IN ('active', 'inactive', 'blocked'));


