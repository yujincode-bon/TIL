SELECT version();
CREATE DATABASE tset_db;
USE test_db;-- 생성한 데이터 베이스 사용 
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50),
  email VARCHAR(100) UNIQUE,
  created_at DATETIME DEFAULT CURRENT_TIMESTAMP
); 

