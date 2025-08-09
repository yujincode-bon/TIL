
CREATE TABLE members (  -- 테이블 명: memebers 생성
	id INT AUTO_INCREMENT PRIMARY KEY,  -- 회원 고유번호 (정수, 자동증가)
    name VARCHAR(30) NOT NULL,  -- 이름(필수 입력)
    email VARCHAR(100) UNIQUE,  -- 이메일(중복 불가능) 
    join_date DATE DEFAULT(CURRENT_DATE)  -- 가입일(기본값-오늘)
);

-- lecture, practice 생성후 확인
CREATE DATABASE lecture;
CREATE DATABASE practice;
SHOW DATABASES;
-- DB 사용
USE lecture;
-- 03- insert.sql 
USE lecture;
DESC members; 

-- 데이터 입력(Create) 
INSERT INTO members (name) VALUES ('김유진');
INSERT INTO members (name, email) VAlUES ('김재석', 'kim@a.com');

-- 여러줄, (col1, col2)순서 잘맞추기
INSERT INTO members (email, name) VALUES;
('lee@a.com','이재필'),
('park@a.com', '박지수');

-- 데이터 전체 조회( READ)
SELECT*FROM members;




  
  
  
