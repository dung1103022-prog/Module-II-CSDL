DROP TABLE IF EXISTS students_constraint;
CREATE TABLE students_constraint (
	ma_sv VARCHAR(20) PRIMARY KEY,
    ho_ten VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    tuoi INT CHECK (tuoi >= 18)
);