USE ql_sinh_vien

-- diem tb cua moi sinh vien
SELECT
	student_id,
    AVG(score) AS avg_score
FROM scores
GROUP BY student_id

-- hien thi sv co diem tb >7
SELECT
	student_id,
    AVG(score) AS avg_score
FROM scores
GROUP BY student_id
HAVING AVG(score) >= 7;

-- hien thi sv co diem tb cao nhat
SELECT 
    student_id,
    AVG(score) AS avg_score
FROM scores
GROUP BY student_id
HAVING AVG(score) = (
    SELECT MAX(avg_score) 
    FROM (
        SELECT AVG(score) AS avg_score
        FROM scores
        GROUP BY student_id
    ) AS sub
);

-- hien thi sv co diem tb cao hon tb chung
SELECT 
    student_id,
    AVG(score) AS avg_score
FROM scores
GROUP BY student_id
HAVING AVG(score) > (
    SELECT AVG(score)
    FROM scores
);
