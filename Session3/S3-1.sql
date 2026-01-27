USE session3_ql_sv
CREATE TABLE classes (
	class_id INT AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(100) NOT NULL,
    major VARCHAR(100) NOT NULL,
    academic_year VARCHAR(20) NOT NULL
);
CREATE TABLE students (
	student_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    gender VARCHAR(10) NOT NULL,
    birth_day DATE NOT NULL,
    class_id INT NOT NULL
);