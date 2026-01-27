USE ql_san_pham;

INSERT INTO products (product_id, product_name, category, price, quantity)
VALUES
('P001','Samsung Galaxy S23','Phone',12000000,10),
('P002','MacBook Pro 14','Laptop',45000000,5),
('P003','Dell XPS 13','Laptop',35000000,8),
('P004','iPad Air','Tablet',15000000,12),
('P005','Samsung Galaxy Tab S8','Tablet',13000000,7);

SELECT * 
FROM products
WHERE price BETWEEN 5000000 AND 15000000;

SELECT * 
FROM products
WHERE category IN ('Laptop','Tablet');

SELECT * 
FROM products
WHERE product_name LIKE 'Sam%';

SELECT * 
FROM products
WHERE category <> 'Phone';

UPDATE products
SET price = price * 0.95
WHERE category = 'Laptop';
SELECT * FROM products;


DELETE FROM products
WHERE quantity = 0;
SELECT * FROM products;


