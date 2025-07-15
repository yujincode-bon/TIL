-- 해결하지  못함 이해를 못함 . 
-- 각 고객의 최근 구매 내역
-- 각 고객별로 가장 최근 인보이스(invoice_id, invoice_date, total) 정보를 출력하세요.
SELECT
	c.customer_id,
	i.invoice_id,
	i.invoice_date,
	i.total,
	--MAX(i.invoice_date) AS 기장최근주문일 --같은 열을 집계하며서 
--동시에 그룹핑에 넣으면 집계의미가 사라진다. 
FROM customers c
JOIN invoice.i ON i.customer_id= c.customer_id
--힌트:먼저 고객별 최신 날짜를 구한 뒤, 다시 invoices와 조인해 해당 날짜의 인보이스를 가져옵니다. 
JOIN(SELECT 
 customer_id,
 MAX(i.invoice_date)AS 기장최근 주문일 
FROM invoices
GROUP BY customer_id 
)r ON r.customer_id 

