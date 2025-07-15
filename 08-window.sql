--pg-08-window.sql

-- window 함수 -> OVER() 구문 
-- 전체 구매액 평균
SELECT AVG(amount)FROM orders;
-- 고객별 구매액 평균 ACCESS
SELECT 
FROM ordersGROUP BY CUSTIMER_ID; 
GROUP BY CUSTOMER

SELECT *
row_nember() over(orderby amount desc)as 호구번호 
FROM

--각 데이터와 전체 평균을 동시에 확인 
sSELECT
	order_id,
	AVG(amount)OVER()as 전체평균 

---ROW NUMBER()->줄세우기 [ROW_ NUMBER() OVER(ORDER BY 정렬기준)]

 --주문날짜가 최신인 순서대로 번호 매기기
 SELECT
 	order_id,
	order_date 
	ROW_NUNBER() OVER(ORDER BY order_date DESC) AS 가장최근주문\
	RANK() OVER(ORDER BY order_date DESC) AS  랭크 -- 올림픽 등에 랭크메기는 방식 1-1-1-1-->16
	DENSE_RANK() OVER(ORDER BY order_date DESC) AS 덴스랭크 -- 댄스랭크는 군집화에 초점을 둔다 1->2
 FROM 
 --> 단순히 절렬만이 아니라 숫자를 보여줌 몇번쨰인지!! 전체적인 모습을 봐야 보이는 데이터를 같이 보여준다. 

-- 7월 매출 TOP3 고객 찾기  7월 매출 고객 찾기 
-- [이름, (해당고객)7월구입액, 순위)]
-- 7월 고객 주문 조회, 총매출 집계

 WITH july AS (
  SELECT
  customer_id,
  SUM(total_amount)AS 월구매액 
  FROM orders 
  WHERE order_date BETWEEN '24-07-01' AND '24-07-31'
  GROUP BY customer_id
  ),--아직 테이블 계산이 안끝났는데 계산해줄 수 없음.  
  
   ranking AS (
   			SELET
   			customer_id,
			월구매액,
			ROW_NUMBER() OVER (ORDER BY 월구매액) AS 순위
		    FROM july
			),-- 여기서 그룹바이 쓸지 고민함 
	SELECT
	c.customer_name,
	r.customer_id,
	r.월구매액,
	r.순위 
	FROM ranking r 
	INNER JOIN customers c ON r.xustomer_id=c.customer_id
	WHERE r.순위 <=10;
			
  -- 
  SELECT 
  	order_id,
	order_date
	SUM(total_amount) AS 총주문량
	RANK() OVER( ORDER BY customer_id DESC)
	  
-- 각 지역에서 매출 1위 고객 (ORDER BY LIMIT ONE 해도 상관은 없음.) 이컬럼의 값이 1인 사람 
--[지역, 고객이름, 총구매액]
--1. 고객 주문과 고객의 총구매비용을 계산한다. 
--2. 지역별 총 매출을 조회하는 테이블을 만든다. (고객 구매비용과 연관)
--3. 지역별 매출 1위 고객 중에서 그값이 1인사람을 고른다.
 WITH AREA AS (
SELECT
customer_id,
sum(amount) AS 매출
FROM 
 )
