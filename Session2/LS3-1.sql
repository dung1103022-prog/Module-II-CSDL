CREATE SCHEMA ql_sinh_vien;
USE ql_sinh_vien;
CREATE TABLE students (
	ma_sv VARCHAR(20) PRIMARY KEY,
	ho_ten VARCHAR(100) NOT NULL,
	ngay_sinh DATE,
	gioi_tinh ENUM('Nam', 'Nu', 'Khac')
);


