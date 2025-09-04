# Write your MySQL query statement below
SELECT s.store_id,
       s.store_name,
       s.location,
       e.product_name AS most_exp_product,
       c.product_name AS cheapest_product,
       ROUND(c.quantity * 1.0 / e.quantity, 2) AS imbalance_ratio
FROM stores s
JOIN (
    SELECT i1.store_id, i1.product_name, i1.quantity
    FROM inventory i1
    WHERE i1.price = (
        SELECT MAX(price) FROM inventory WHERE store_id = i1.store_id
    )
) e ON s.store_id = e.store_id
JOIN (
    SELECT i2.store_id, i2.product_name, i2.quantity
    FROM inventory i2
    WHERE i2.price = (
        SELECT MIN(price) FROM inventory WHERE store_id = i2.store_id
    )
) c ON s.store_id = c.store_id
JOIN (
    SELECT store_id, COUNT(DISTINCT product_name) AS product_count
    FROM inventory
    GROUP BY store_id
) pc ON s.store_id = pc.store_id
WHERE pc.product_count >= 3
  AND e.quantity < c.quantity
ORDER BY imbalance_ratio DESC, s.store_name ASC;
