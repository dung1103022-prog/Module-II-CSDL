INSERT INTO customers (customer_id, customer_name)
VALUES
(4, 'Nguyễn Văn A'),
(5, 'Trần Thị B');

-- liet ke khach hang co it nhat 1 don hang 
SELECT DISTINCT c.customer_id, c.customer_name
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id;

-- khach hang chua dat 1 don nao 
SELECT c.customer_id, c.customer_name
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
WHERE o.order_id IS NULL;

-- tong doanh thu khach hang dem lai
SELECT c.customer_id, c.customer_name, SUM(od.quantity * p.price) AS total_revenue
FROM customers c
JOIN orders o
    ON c.customer_id = o.customer_id
JOIN order_details od
    ON o.order_id = od.order_id
JOIN products p
    ON od.product_id = p.product_id
GROUP BY c.customer_id, c.customer_name;
