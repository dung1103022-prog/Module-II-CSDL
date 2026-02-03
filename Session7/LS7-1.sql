DESCRIBE students;
CREATE VIEW v_student_basic 
AS
SELECT student_id, full_name, gender, email, score
FROM students;
SELECT * FROM students;