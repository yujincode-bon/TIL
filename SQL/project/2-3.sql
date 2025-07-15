-- 2-3.sql 
--2010년 이전에 가입한 고객 목록
--2010년 1월 1일 이전에 첫 인보이스를 발행한 고객의 customer_id, first_name, last_name, 첫구매일을 조회하세요.ABORT
 --  첫 인보이스가 1월1일 이전이란 것은.... 
SELECT 
	 c.customer_id, 
	 c.first_name,
	 c.last_name, 
	 MIN(i.invoice_date) AS 첫구매일 --i.invoice_date(i.total numeric=1) AS 첫구매일:i.invoice는 날짜 컬럼인데, 마치 함숴처엄() 안에 사용됨 
FROM customers c 
JOIN invoices i ON c.customer_id=i.customer_id--복수형 오타 주의
GROUP BY c.customer_id, c.first_name, c.last_name
HAVING MIN(i.invoice_date)<'2010-01-01';

--WHERE 절에는 데이터 삽입 선언을 넣을 수 없다. 
--WHERE i.invoice_date<='2010-01-01'AND total numeric(1,2) numeric(1,3)는 컬럼을 정의할 때쓰고 조건절에서는 못쓴다 
--GROUP BY c.customer_id, c.first_name,c.last_name,i.invoice_date, i.total numeric:GROUP BY 없이도 해결이 가능 서브쿼리나 MIN 으로 충분하다.  


-- <새로운 공부>
-- WHERE: 그룹핑 이전에 행을 필터링한다. 
-- HAVING: GROUP BY로 집계한 결과를  필터링하려고 사용한다
-- 이 문제는, " 각 고객별 첫구매일 MIN(invoice_date)->[**그룹별 집계결과 ]이 2010-01-01 이전인 경우만 출력이므로 HAVING 절로만 칠터링이 가능하다. 

--<서브 쿼리를 사용한 예시>
SELECT *
FROM (
    SELECT
        c.customer_id,
        c.first_name,
        c.last_name,
        MIN(i.invoice_date) AS 첫구매일
    FROM customers c
    JOIN invoices i ON c.customer_id = i.customer_id
    GROUP BY c.customer_id, c.first_name, c.last_name
) AS first_purchase
WHERE 첫구매일 < '2010-01-01';

