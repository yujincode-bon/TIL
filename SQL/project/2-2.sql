-- 2-2.sql 
--판매량(구매된 수량)이 가장 많은 트랙 5개(track_id, name, 총 판매수량)를 출력하세요.
--동일 판매수량일 경우 트랙 이름 오름차순 정렬하세요
SELECT
	t.track_id AS 고유번호,
	t.name AS 트랙이름,
	SUM(i.quantity) AS 총판매수량 --SUM(unit_price) AS 총판매수량 : unit_price는 가격이지 판매수량이 아니다 
FROM tracks t -- 오타제발..주의 
JOIN invoice_items i ON t.track_id=i.track_id 
GROUP BY t.track_id, t.name -- SUM과 같은 집계함수 사용시에 GROUP BY 필수임. 그리고 JOIN 헤서 붙인 t. 과 같은 테이블별칭(삭별자) 꼭 붙여야함 ABORT
ORDER BY 총판매수량 DESC, 트랙이름
LIMIT 5;






