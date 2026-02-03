CREATE VIEW v_order_info AS
SELECT 
    c.customer_id,
    c.customer_name,
    o.order_id,
    o.order_date
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id;
