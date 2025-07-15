--1-3.sql 
-- 트랙(곡)별 단가와 재생 시간 조회
-- tracks 테이블에서 각 곡의 name, unit_price, milliseconds를 조회하세요.
--5분(300,000 milliseconds) 이상인 곡만 출력하세요.

SELECT 
	name,
	unit_price,
	milliseconds --- TAB 으로 들여쓰기 하지 않았더니 오류발생 
FROM tracks 
--GROUP BY name ,unit_price,  milliseconds >집계함수 없어서 필요없음 
WHERE milliseconds >=300000; -- grop by 앞에 존재 해야함 