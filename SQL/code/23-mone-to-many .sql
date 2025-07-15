-- 23-mone-to-many.sql
USE lecture;
SELECT
c.customer_id,
c.customer_name, 
COUNT (s,id) AS 주문횟수,
s.product_name 
GROUP_CONCAT (s,pro dict_mae AS 주문제품들 -태concatanate : 그룹의 글자를 싹다 이어붙인다. 
FROM customers c
LEFT JOIN sales s ON c.customer_id=s.customer_id;
GROUP BY c.customer_id, c.customer_name 