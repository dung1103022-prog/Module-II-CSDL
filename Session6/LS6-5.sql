SELECT product_id, product_name, price, category AS category_name
FROM products;
-- Dem so don hang cua tung khach hang
SELECT c.customer_id, c.customer_name, COUNT(o.order_id) AS num_orders
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.customer_name
ORDER BY num_orders DESC;
-- 5 khach hang co chi tieu ca nhat
SELECT c.customer_id, c.customer_name, SUM(od.quantity * p.price) AS total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_details od ON o.order_id = od.order_id
JOIN products p ON od.product_id = p.product_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_spent DESC
LIMIT 5;
-- san pham chua tung xuat hien trong don hang 
SELECT p.product_id, p.product_name
FROM products p
LEFT JOIN order_details od ON p.product_id = od.product_id
WHERE od.order_id IS NULL;
-- khach hang da mua sp co danh muc lon nhat 
SELECT category
FROM products
GROUP BY category
ORDER BY COUNT(*) DESC
LIMIT 1;
 