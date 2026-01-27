USE ql_sinh_vien;
-- su dung between
SELECT full_name, birth_date
FROM students
WHERE YEAR (birth_date) BETWEEN 2003 AND 2005;
-- su dung in 
SELECT full_name, birth_date
FROM students
WHERE gender IN ('Nam', 'Nu');
