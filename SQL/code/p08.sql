-- p08.sql 
CREATE TABLE sales AS SELECT*FROM lecture_db.sales;
CREATE TABLE products AS SELECT*FROM lecture_db.products;

-- p08.sql

-- practice DB에
USE practice_db;
-- lecture - sales, products 복사해오기
CREATE TABLE sales AS SELECT * FROM lecture.sales;
CREATE TABLE products AS SELECT * FROM lecture.products;

-- 단일값 서브쿼리
-- 1-1. 평균 이상 매출 주문들|(성과가 좋은 주문들) 
SELECT * FROM sales
WHERE total_amount >= (
  SELECT AVG(total_amount) FROM sales
);
-- 연습 (최고 매출)


--최고 매출 지역이란 
SELECT 
region ,

SELECT region, 
FROM sales
GROUP BY region,
ORDER BY SUM(total_amount) 
DESC LIMIT 1; 

SELECT * FROM sales
WHERE region = (
-- 지역 = MAX [지역매출총합]
SELECT *FROM sales
WHERE 지역별총합 =
-- 2. 최고 매출 지역의 모든 주문들
SELECT *
FROM sales
WHERE product_id IN (
  SELECT product_id
  FROM sales
  GROUP BY product_id
  HAVING SUM(quantity) < 50
); 
-- 3. 각 카테고리에서 [카테고리별 평균] 보다 높은 주문들
SELECT *
FROM sales
WHERE region IN (    -- IN: WHERE 절에서 특정 칼럼의 값이 주어진 목록에 포람되는지 확인하, 여러개의 OR 조건들을 간결하게 표현할떄 
  SELECT region
  FROM sales
  GROUP BY region
  ORDER BY SUM(total_amount) DESC
  LIMIT 3
);


-- 여러데이터 서브쿼리
-- 1. 기업 고객들의 모든 주문 내역

-- 2. 재고 부족(50개 미만) 제품의 매출
SELECT product_id FROM product
WHERE stock_quantity < 50; 

SELECT*FROM sales 
WHERE ?? IN 재고가 50개 미만인 제품들 

 SUM(total_amount) AS 지역 총매출 \
 -- 상위 3개 매출 지역의 주문들 
 SELECT
 SELECT*FROM 
 

-- 3. 상위 3개 매출 지역의 주문들 
SELECT *
FROM sales
WHERE region IN (
  SELECT region
  FROM sales
  GROUP BY region
  ORDER BY SUM(total_amount) DESC
  LIMIT 3
);

-- 4. 상반기(24-01-01 ~ 24-06-30) 에 주문한 고객들의 하반기(0701~1231) 주문 내역
-- 서브 쿼리를 사용하는 경우: 1. 평균 최대 최소 등과 비교한다 2. "~~한 사람들의 ~~~ " / VIP들의 고객등급이 높은사람들의 3. ~한 적이 있는 .. >> 90% 서브쿼리는 아래
-- 문장으로 문제 정의가 됨 
-- (쓰면 안되는 경우) 1. 단순 조건 -고정된 값 (100) 2.JOIN이 더 직관적일 경우  2. JOIN이 더 직관적인 경우 
-- 서브쿼리란 쿼리안의 쿼리이다. 