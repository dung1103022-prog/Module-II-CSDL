USE ql_san_pham;

CREATE TABLE IF NOT EXISTS employees (
    emp_id VARCHAR(10) PRIMARY KEY,
    full_name NVARCHAR(100) NOT NULL,
    birth_year INT,
    department NVARCHAR(50),
    salary DECIMAL(15,2),
    phone VARCHAR(15)
);

INSERT INTO employees (emp_id, full_name, birth_year, department, salary, phone)
VALUES
('E001','Nguyen Van A',1985,'IT',15000000,NULL),
('E002','Tran Thi B',1990,'HR',12000000,'0912345678'),
('E003','Le Van C',1992,'IT',18000000,'0987654321'),
('E004','Pham Thi D',1988,'Finance',9000000,NULL),
('E005','Hoang Van E',1995,'IT',11000000,'0911222333'),
('E006','Nguyen Thi F',1993,'HR',14000000,NULL),
('E007','Tran Van G',1987,'Marketing',8000000,'0909988776'),
('E008','Le Thi H',1991,'IT',20000000,NULL),
('E009','Pham Van I',1996,'HR',6000000,'0922334455'),
('E010','Nguyen Anh J',1994,'Finance',4000000,NULL);

-- truy van nhan vien co luong tu 10tr-20tr
SELECT * FROM employees
WHERE salary BETWEEN 10000000 AND 20000000;

-- nhan vien HR hoac IT 
SELECT * FROM employees
WHERE department IN ('IT');

-- hien thi nhan vien ho ten cop chu Anh
 SELECT * FROM employees
 WHERE full_name LIKE '%Anh%';

-- hien thi nhan vien chua co sdt
SELECT * FROM employees
WHERE phone IS NULL;

-- tang luong 10% cho IT
UPDATE employees
SET salary = salary * 1.1
WHERE emp_id IN ('E001','E003','E005','E008');

-- cap nhat sdt 
UPDATE employees
SET phone = '0900000000'
WHERE emp_id IN ('E001','E004','E006','E008','E010');

