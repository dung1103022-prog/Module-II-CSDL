USE ql_sinh_vien;

-- cap nhat email cho sinh vien chua co email 
UPDATE students
SET email = 'not_provided@gmail.com'
WHERE email IS NULL;
SELECT * FROM students;

-- cap nhat gioi tinh cho sinh vien sv005
UPDATE students
SET gender = 'Nu'
WHERE student_id = 'SV005';
SELECT * FROM students;

-- xoa sinh vien sv003
DELETE FROM students
WHERE student_id = 'SV003';
SELECT * FROM students
