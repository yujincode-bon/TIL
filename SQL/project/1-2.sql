-- 1-2.spl
-- 모든 앨범과 해당 아티스트 이름 출력
-- 각 앨범의 title과 해당 아티스트의 name을 출력하고, 앨범 제목 기준 오름차순 정렬하세요.
SELECT 
 a.title AS 제목,
 i.name AS 아티스트이름 -- 아티스트 에서 이름 컬럼명은 name 이다
FROM albums a
JOIN artists i ON a.artist_id=i.artist_id
-- GROUP BY title, artist_name 는 집계함수 없으면 굳이 필요 없음 
ORDER BY a.title;






	


