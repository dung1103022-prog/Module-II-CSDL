USE ql_san_pham

-- thong ke phong ban co bao nhieu nhan vien
SELECT
    department,
    COUNT(*) AS total_employees
FROM employees
GROUP BY department;

-- muc luong tb cua tung phong ban
SELECT
    department,
    AVG(salary) AS avg_salary
FROM employees
GROUP BY department;

-- cac phong ban co tren 3 nv
SELECT
    department,
    COUNT(*) AS total_employees
FROM employees
GROUP BY department
HAVING COUNT(*) > 3;

-- phong ban co luong tb > 12tr
SELECT
	department,
    AVG(salary) AS avg_salary
FROM employees
GROUP BY department
HAVING AVG(salary) > 12000000;