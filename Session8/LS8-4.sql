DELIMITER $$

CREATE PROCEDURE sp_check_order_value (
    IN p_total_amount DECIMAL(15,2)
)
BEGIN
    IF p_total_amount >= 5000000 THEN
        SELECT 'Đơn hàng giá trị cao' AS message;
    ELSE
        SELECT 'Đơn hàng bình thường' AS message;
    END IF;
END $$

DELIMITER ;

CALL sp_check_order_value(6000000);

CALL sp_check_order_value(3200000);

