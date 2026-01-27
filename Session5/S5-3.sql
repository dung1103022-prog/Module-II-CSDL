USE ql_san_pham;

INSERT INTO products (product_id, product_name, price, category) VALUES
(1, 'Laptop A', 15000000, 'Laptop'),
(2, 'Laptop B', 12000000, 'Laptop'),
(3, 'Laptop C', 18000000, 'Laptop'),
(4, 'Dien thoai X', 22000000, 'Phone'),
(5, 'Dien thoai Y', 9000000, 'Phone'),
(6, 'Dien thoai Z', 25000000, 'Phone'),
(7, 'Chuot Gaming', 500000, 'Phu kien'),
(8, 'Ban phim', 1500000, 'Phu kien');
SELECT * FROM products;

-- san pham co gia cao hon gia tb cac sp
SELECT *
FROM products
WHERE price > (SELECT AVG(price) FROM products);

--  san pham co gia cao nhat
SELECT *
FROM products p1
WHERE price = (
	SELECT MAX(price)
    FROM products p2
    WHERE p2.category = p1.category
);

-- san pham thuooc loai co gia lon hon 20tr
SELECT *
FROM products
WHERE category IN (
	SELECT DISTINCT category
    FROM products
    WHERE price > 20000000
);