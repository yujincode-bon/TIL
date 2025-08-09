-- 04-update-deletes.sql

SELECT * FROM members;
INSERT INTO members(name) VALUES('익명');

-- UPDATE(데이터 수정)
UPDATE members SET name = '홍길동', email = 'hong@a.com' WHERE id = 6;
-- 원치 않는 케이스 (name이 같으면 동시 수정) 
UPDATE members SET name = ' No name' WHERE name = '김유진';
-- 데이터 삭제
DELETE FROM members WHERE id=7;
DELETE FROM members;

SELECT *
FROM members;

