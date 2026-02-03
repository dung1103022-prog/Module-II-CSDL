DELIMITER $$

CREATE PROCEDURE sp_check_employee_income (
    IN p_employee_name VARCHAR(100),
    IN p_salary DECIMAL(15,2)
)
BEGIN
    DECLARE income_level VARCHAR(50);

    -- Xác định mức thu nhập
    IF p_salary >= 15000000 THEN
        SET income_level = 'Thu nhập cao';
    ELSEIF p_salary >= 8000000 THEN
        SET income_level = 'Thu nhập trung bình';
    ELSE
        SET income_level = 'Thu nhập thấp';
    END IF;

    -- Hiển thị kết quả
    SELECT 
        p_employee_name AS employee_name,
        income_level AS income_level;
END $$

DELIMITER ;

CALL sp_check_employee_income('Nguyễn Văn A', 18000000);
