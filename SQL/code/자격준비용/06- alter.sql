-- 06 alter. sql

USE lecture;
DESC members;

-- 테이블 스키마(컬럼 구조) 변경

-- 컬럼 추가 
ALTER TABLE members ADD COLUMN age  INT NOT NULL DEFAULT 20; #새로운 행 추가할 때 age 값 짖ㅇ 안하면 자동ㅇ르ㅗ 20이 입력된다. 
ALTER TABLE members ADD COLUMN address VARCHAR(100) DEFAULT '미입력';

-- 컬럼 이름 + 데이터 타입 수정 
ALTER TABLE members CHANGE COLUMN address judo VARCHAR(100);
-- 컬럼 데이터 타입 수정
ALTER TABLE members MODIFY COLUMN judo VARCHAR(50);

-- 컬럼 삭제 
ALTER TABLE members;
SELECT * FROM members;
