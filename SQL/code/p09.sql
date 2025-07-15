-- p09.sql 
USE practice_db; 
 
DROP TABLE sales; 
DROP TABLE  products;
DROP TABLE  customers; 

CREATE TABLE sales AS SELECT*FROM lecture_db.sales;
CREATE TABLE products AS SELECT*FROM lecture_db.products;
CREATE TABLE customers AS SELECT*FROM lecture_db.customers;

SELECT COUNT(*) FROM sales 
UNION 
SELECT COUNT(*) FROM customers;

-- 1.주문 거래액이 가장 높은 10 건을 높은순으로 [고객명, 상품명, 주문금액]을 보여주자
SELECT 
    c.customer_name AS 고객명,
    s.product_name AS 상품명,
    s.total_amount AS 주문금액
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
ORDER BY s.total_amount DESC
LIMIT 10;

-- 2.고객 유형별 [고객 유형, 주문건수, 평균주문금액]을 평균주문금액 높은순으로 정렬해서 보여주자. 
SELECT 
    c.customer_type AS 고객유형, 
    COUNT(*) AS 주문건수, 
    ROUND(AVG(s.total_amount), 0) AS 평균주문금액 
FROM sales s
INNER JOIN customers c ON s.customer_id = c.customer_id 
GROUP BY c.customer_type
ORDER BY 평균주문금액 DESC; 

-- 문제 1: 모든 고객의 이름|과 구매한 상품명 조회
 SELECT 
    c.customer_name AS 고객이름,
    p.product_name AS 상품명 
 FROM customers c 
 INNER JOIN sales s ON c.customer_id = s.customer_id
 INNER JOIN products p ON s.product_id = p.product_id;  
 
 SELECT
    c.customer_name AS 고객이름,
    p.product_name AS 상품명
FROM customers c
JOIN sales s ON c.customer_id = s.customer_id
JOIN products p ON s.product_id = p.product_id;-- 문제: 고객이름이 나오지 않음, 궁금한점  INNER JOIN 인지 LEFT 조인인지 ...
 
-- 문제 2: 고객 정보와 주문 정보를 모두 포함한 상세 조회
SELECT
    c.customer_id AS 고객ID,
    c.customer_name AS 고객명,
    c.customer_type AS 고객유형,
    s.id AS 주문ID,
    s.product_name AS 상품명,
    s.total_amount AS 주문금액,
    s.order_date AS 주문일자
FROM customers c
JOIN sales s ON c.customer_id = s.customer_id
ORDER BY s.order_date DESC;

DESC sales; 

-- 문제 3: VIP 고객들의 구매 내역만 조회
SELECT
    c.customer_id AS 고객ID,
    c.customer_name AS 고객명,
    c.customer_type AS 고객유형,
    s.id AS 주문ID,
    s.product_name AS 상품명,
    s.total_amount AS 주문금액,
    s.order_date AS 주문일자
FROM customers c
INNER JOIN sales s ON c.customer_id = s.customer_id 
WHERE c.customer_type = 'VIP' 
ORDER BY s.total amount DESC;


-- 문제 4: 건당 50만원 이상 주문한 기업 고객들
-- 문제 5: 2024년 하반기(7월~12월) 전자제품 구매 내역

-- (AVG ROUND처리 도전하기) 문제 6: 고객별 주문 통계 (INNER JOIN) [고객명, 유형, 주문횟수, 총구매, 평균구매, 최근주문일]

-- 문제 7: 모든 고객의 주문 통계 (LEFT JOIN) - 주문 없는 고객도 포함
-- 문제 8: 상품 카테고리별로 고객 유형 분석
-- 문제 9: 고객별 등급 분류
-- 활동등급(구매횟수) : [0(잠재고객) < 브론즈 < 3 <= 실버 < 5 <= 골드 < 10 <= 플래티넘]
-- 구매등급(구매총액) : [0(신규) < 일반 <= 10만 < 우수 <= 20만 < 최우수 < 50만 <= 로얄]
-- 문제 10: 활성 고객 분석
-- 고객상태(최종구매일) [NULL(구매없음) | 활성고객 <= 30 < 관심고객 <= 90 관심고객 < 휴면고객]별로
-- 고객수, 총주문건수, 총매출액, 평균주문금액 분석  
-- 그룹화를 하면 이제 거기서 선택을 하는 것이 된다. 
SELECT 
   고객상태, 
   COUNT(*) AS 고객수 
SUM (총주문건수 AS 상태별 총주문건수, 
SUM(총매출액)AS 상태별 총매출액, 
ROUND(ㅁㅍㅎ( vudrbswnans rmador)) ㅁㄴ 상태별 평균주문금ㅇ액 

SELECT 
c.customer_id, 
c.customer_name AS 이름, 
COUNT (s.id) AS 구매횟수 
SUM
FROM customers c
LEFT JOIN sales s ON c.customer_id = s.customer_id
GROUP BY c.customer_id, c.customer_name 
; ) AS customer_analisis
GROUP BY 고개상태 
;




