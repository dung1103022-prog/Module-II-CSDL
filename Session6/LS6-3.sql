SELECT *
FROM products
WHERE price BETWEEN 100000 AND 200000;

-- gia trung binh cua san pham
SELECT category, AVG(price) AS avg_price
FROM products
GROUP BY category;
 -- sp gia cao hon gia tb cua cac san pham
 SELECT *
FROM products
WHERE price > (SELECT AVG(price) FROM products);
-- sp co gia thap nhat 
SELECT p1.*
FROM products p1
JOIN (
    SELECT category, MIN(price) AS min_price
    FROM products
    GROUP BY category
) p2
ON p1.category = p2.category AND p1.price = p2.min_price;
 