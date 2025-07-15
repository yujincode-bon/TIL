--1-5.sql A
--각 장르별 트랙 수 집계
-- 각 장르(genres.name)별로 트랙 수를 집계하고, 트랙 수 내림차순으로 정렬하세요.
SELECT
	g.name AS 장르,--genre_id  GROUP BY 에 있으니 꼭 넣기 
	COUNT(*) AS 트랙수
FROM genres g-- 장르 정보만 담고 있어서 트랙 수는 조인이 필요함 
JOIN  tracks t ON g.genre_id= t.genre_id 
GROUP BY g.name--genre_id genres.name 이지만 GROP BY에서 바로 쓰려면 SELECT에 포함되어야 함 
-- 숫자 ID로 묶기 보다 장르명을 기준으로 직접 묶는 것이 더 의미가 분명함 
ORDER BY 트랙수 DESC; 



	



