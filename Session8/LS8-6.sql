DELIMITER $$

CREATE PROCEDURE sp_classify_student (
    IN  p_avg_score DECIMAL(4,2),
    OUT p_classification VARCHAR(20)
)
BEGIN
    DECLARE result VARCHAR(20);

    -- phan loai hoc luc
    SET result = CASE
        WHEN p_avg_score >= 8.0 THEN 'Giỏi'
        WHEN p_avg_score >= 6.5 THEN 'Khá'
        WHEN p_avg_score >= 5.0 THEN 'Trung bình'
        ELSE 'Yếu'
    END;

    SET p_classification = result;
END $$

DELIMITER ;

SET @classification = '';
CALL sp_classify_student(7.2, @classification);
SELECT @classification AS classification;

