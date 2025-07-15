-- 연습쿼리 window함수 

-- 전체 구매액 평균
SELECT
	AVG(amount) FROM orders;

--고객별 구매액 평균
SELECT
	 customer_id,
	 AVG(amount)
FROM orders;
GROUP BY customer_ id;

--각 데이터와 전체 평균을 동시에 확인
SELECT 
	order_id
	customer_id, 
	amount
	AVG (amount)
FROM 

--ROW_NUMBER() 줄세우기[ROW_NUMBER()OVER(ORDER BY정렬기준)]
-- 주문 금액이 높은 순서로 
--주문 날짜가 최신인 순서대로 번호매기기

---- 7월 매출 TOP 3 고객 찾기
-- [이름, (해당고객)7월구매액, 순위]
-- CTE
-- 1. 고객별 7월의 총구매액 구하기 [고객id, 총구매액]
-- 2. 기존 컬럼에 번호 붙이기 [고객id, 구매액, 순위]
-- 3. 보여주기

