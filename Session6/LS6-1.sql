-- them san pham 
INSERT INTO products (product_id, product_name, price, category)
VALUES
(9, 'Sản phẩm A', 100000, 1),
(10, 'Sản phẩm B', 200000, 1),
(11, 'Sản phẩm C', 150000, 2);

-- cap nhat san pham
UPDATE products
SET price = 180000
WHERE product_id = 9;

-- xoa san pham 
DELETE FROM products
WHERE product_id = 11;
