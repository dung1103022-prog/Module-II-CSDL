CREATE TABLE students (
	student_id VARCHAR(10) PRIMARY KEY,
    full_name NVARCHAR(100) NOT NULL,
    birth_date DATE,
    gender NVARCHAR(10),
    email VARCHAR(100)
);
INSERT INTO students (student_id, full_name, birth_date, gender, email)
VALUES
('SV001','Nguyen Van A', '2002-01-04','Nam','A@gmail.com'),
('SV002','Vo Thi B', '2004-07-23','Nu','B@gmail.com'),
('SV003','Nguyen Van C', '1990-11-01','Nam','C@gmail.com'),
('SV004','Tran Thi D', '1992-09-25','Nu','D@gmail.com'),
('SV005','Nguyen Van E', '2006-03-13','Nam','E@gmail.com');
