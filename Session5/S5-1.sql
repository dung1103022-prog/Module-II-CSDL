USE ql_sinh_vien;
ALTER TABLE students
ADD score DECIMAL(4,2);

-- hien thi ma sinh vien va ho ten viet hoa
SELECT 
    student_id,
    UPPER(full_name) AS full_name_upper
FROM students;

-- hien thi ho ten va tuoi sinh vien
SELECT
    full_name,
    YEAR(CURDATE()) - YEAR(birth_date) AS age
FROM students;

-- hien thi diem tb
SELECT
    full_name,
    ROUND(score, 1) AS rounded_score
FROM students;

-- hien thi tong so sinh vien, diem cao nhat, diem thap nhat 
SELECT
    COUNT(*) AS total_students,
    MAX(score) AS max_score,
    MIN(score) AS min_score
FROM students;
