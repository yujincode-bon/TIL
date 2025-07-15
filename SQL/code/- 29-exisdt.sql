-- 29-exisdtd.sql 

-- 전자제품을 구매한 고객 정보 
SELECT 
custoner_id customer_name, customer_type 
FROM customers c

  
  
  
SELECT column_name(s)
FROM table_name
WHERE EXISTS
(SELECT column_name FROM table_name WHERE condition);

  -- exisxts(~~한 적인 있는) 
  -- 전자제품과 의류를 모두 구매해 본적이 있고, 50 만원 이상 구매이력도 가진 고객을 찾자. 
  
SELECT 
 custoner_id,
 customer_name, 
 customer_type 
FROM customers c
WHERE EXISTS( 
SELECT 1  FROM sales s WHERE category = '가전 제품', 
FROM sales s WHERE total_amount >=50
); 

