USE ql_san_pham
-- hien thi ma don hang- ten kh-tong tien
SELECT
    o.order_id,
    c.customer_name,
    SUM(oi.quantity * oi.price) AS total_amount
FROM orders o
JOIN customers c
    ON o.customer_id = c.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY o.order_id, c.customer_name;

-- tong doanh thu moi kh
SELECT
    c.customer_id,
    c.customer_name,
    SUM(oi.quantity * oi.price) AS total_revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name;

-- chi hien thi kh doanh thu >20tr
 SELECT
    c.customer_id,
    c.customer_name,
    SUM(oi.quantity * oi.price) AS total_revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name
HAVING SUM(oi.quantity * oi.price) > 20000000;

-- hien thi kh co doanh thu cao nhat
SELECT
    c.customer_id,
    c.customer_name,
    SUM(oi.quantity * oi.price) AS total_revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_items oi
    ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name
HAVING SUM(oi.quantity * oi.price) = (
    SELECT MAX(total_revenue) 
    FROM (
        SELECT SUM(oi2.quantity * oi2.price) AS total_revenue
        FROM customers c2
        JOIN orders o2
            ON c2.customer_id = o2.customer_id
        JOIN order_items oi2
            ON o2.order_id = oi2.order_id
        GROUP BY c2.customer_id
    ) AS sub
);
