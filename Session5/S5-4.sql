USE ql_san_pham
-- hien thi ma don hang- ngya dat- ten
SELECT 
    o.order_id,
    o.order_date,
    c.customer_name
FROM orders o
JOIN customers c 
    ON o.customer_id = c.customer_id;
-- hien thi dnah sach san pham
SELECT
    o.order_id,
    oi.product_name,
    oi.quantity,
    oi.price
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
ORDER BY o.order_id;

-- tong tien cua moi don hang
SELECT
    o.order_id,
    SUM(oi.quantity * oi.price) AS total_amount
FROM orders o
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY o.order_id;
