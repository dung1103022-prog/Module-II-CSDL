-- them don hang
INSERT INTO orders (order_id, order_date, status, customer_id)
VALUES ('ORD1002', CURDATE(), 'pending', 1);

INSERT INTO products (product_id, product_name, price, category)
VALUES
('P001', 'Sản phẩm A', 100000, 'Danh mục 1'),
('P002', 'Sản phẩm B', 200000, 'Danh mục 1'),
('P003', 'Sản phẩm C', 150000, 'Danh mục 2');

-- Them chi tiet don hang
INSERT INTO order_details (order_id, product_id, quantity)
VALUES
('ORD1002', 'P001', 2),
('ORD1002', 'P002', 1);

-- doanh thu cua toan bo cua hang
SELECT SUM(od.quantity * p.price) AS total_revenue
FROM order_details od
JOIN products p ON od.product_id = p.product_id;
 -- doanh thu tb cua moi don hang
SELECT AVG(order_revenue) AS avg_order_revenue
FROM (
    SELECT od.order_id, SUM(od.quantity * p.price) AS order_revenue
    FROM order_details od
    JOIN products p ON od.product_id = p.product_id
    GROUP BY od.order_id
) AS t;
-- don hang co doanh thu cao nhat
SELECT od.order_id, SUM(od.quantity * p.price) AS order_revenue
FROM order_details od
JOIN products p ON od.product_id = p.product_id
GROUP BY od.order_id
ORDER BY order_revenue DESC
LIMIT 1;
-- 3 sp ban chay nhat
SELECT od.product_id, p.product_name, SUM(od.quantity) AS total_sold
FROM order_details od
JOIN products p ON od.product_id = p.product_id
GROUP BY od.product_id, p.product_name
ORDER BY total_sold DESC
LIMIT 3;
 