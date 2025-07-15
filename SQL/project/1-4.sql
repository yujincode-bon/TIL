--1-4.sql 
-- 국가별 고객 수 집계
--각 국가(country)별로 고객 수를 집계하고, 고객 수가 많은 순서대로 정렬하세요.
SELECT
	country,
	COUNT(*) AS 고객수 
-- customer_id,>> 고객 수를 구해야 하므로 COUNT(*) 혹은 COUNT(customer_id)를 써야함 
-- DESC(SUM(customer_id)) 존재하지 않는 함수 이고, 정렬은 ORDER BY 에서 처리해야함 ABORT
-- 고객수가 숫자일 수 있을 경우에 SUM을 사용하지만 이경우, COUNT 가 더 적절함 . 
FROM customers
GROUP BY country --PK인 customer_id 로 할 수 없음 ABORT
ORDER By 고객수 DESC;

