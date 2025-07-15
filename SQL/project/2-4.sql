--2-4.SQL
--국가별 총 매출 집계 (상위 10개 국가)
--국가(billing_country)별 총 매출을 집계해, 매출이 많은 상위 10개 국가의 국가명과 총 매출을 출력하세요.
SELECT
	i.billing_country AS 국가명,
	SUM (t.quantity *t.unit_price) AS 국가별총매출
FROM invoices i
JOIN invoice_items t ON i.invoice_id = t.invoice_id 
GROUP BY i.billing_country,t.quantity
ORDER BY 국가별총매출 DESC
LIMIT 10;




-- GROUP BY i.billing_country,t.quantity:답이 나오긴 하지만 ,, 
-- 	•	→ t.quantity로도 그룹을 나누면, 같은 국가라도 quantity가 다른 경우마다 그룹이 쪼개집니다.
-- 	•	즉, 예를 들어 USA에서 한 번은 quantity = 1, 또 다른 주문은 quantity = 2일 경우, 두 개의 행으로 나뉘게 됩니다.
-- !! 근데 최종적으로 정답은 잘나와서 뭔가 .. 뿌듯
--GPT
SELECT
    i.billing_country AS 국가명,
    SUM(t.quantity * t.unit_price) AS 국가별총매출
FROM
    invoices i
JOIN
    invoice_items t ON i.invoice_id = t.invoice_id
GROUP BY
    i.billing_country
ORDER BY
    국가별총매출 DESC
LIMIT 10;