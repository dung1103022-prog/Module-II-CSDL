CREATE SCHEMA ql_san_pham;
USE ql_san_pham;
CREATE TABLE products (
	ma_san_pham VARCHAR(20) PRIMARY KEY,
    ten_san_pham VARCHAR(100) NOT NULL,
    gia_ban DECIMAL(10,2),
    so_luong INT
);