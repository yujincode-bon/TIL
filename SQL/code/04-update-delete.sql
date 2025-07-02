-- 04- update-delete.sql


SELECT * FROM members;



UPDATE members SET name ='홍길동', email='hong@a.com' WHERE id=6;
-- 원치 않는 케이스 (name 이 같으면 동시 수정)  
UPDATE members SET name='NO name'  WHERE name='유태영';


-- DELETE(데이터 삭제)

DELETE FROM members WHERE id=2; 
-- 테이블 모든 데이터 삭제 (위험)
DELETE FROM members; 