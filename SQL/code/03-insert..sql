-- 03-insert.sql

USE lecture_db;
DESC members;


-- 데이터 입력 
INSERT INTO members(name, email) VALUES ('김유진', 'yu@a.com') ;
INSERT INTO members(name, email) VALUES ('김재석', 'ssu@a.com');




-- 여러줄, (cil1,col2) 순서 잘 맞추기!
 
INSERT INTO members (email,name) VALUES ('e@male', '이제필'), ('park@.com', '박지수');


-- 데이터 전체 조회(REAd) 
SELECT * FROM members;

-- 단일 데이터 조회 (*-> 모든 칼럼) 
SELECT * FROM members WHERE id=1;


