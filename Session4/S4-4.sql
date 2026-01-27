USE ql_sinh_vien;

-- hien thi sinh vien chua co email
SELECT student_id, full_name, birth_date, gender, email
FROM students
WHERE email IS NULL;

-- hien thi sinh vien da co email 
SELECT student_id, full_name, birth_date, gender, email
FROM students
WHERE email IS NOT NULL;

-- hien thi sinh vien co ho bat dau bang ng
SELECT student_id, full_name, birth_date, gender, email
FROM students
WHERE full_name LIKE 'Ng%'; 

-- hien thi sinh vien gioi tinh nu
SELECT student_id, full_name, birth_date, gender, email
FROM students
WHERE gender <> 'Nam';