# # 1.  데이터 베이스 테이블 다루기

### 테이블 생성

- USE lecture_db; : 사용할 데이터베이스 선택
- DROP TABLE students;: 기존 테이블 삭제
- CREATE TABLE students(..); t새 테이블 생성

### 데이터 삽입

INSERT INTO students(…) VALUSE(…);: 여러명의 학생 정보를 테이블에 삽입 

### 데이터 조회 (나이가 다양한 여러명의 사람 중 원하는 데이터 조회)

- SELECT*FROM students; >>모든 커럼, 모든 데이터를 출력
- WEHERE  조건 조회
- C,U,D 를 주의 해야하는 이유: 데이터 중복 발생 가능
- ctrl+t→ 새탭
- 특정기호와 =의 조합 은 무조건 =이 뒤에 온다고 기억하기
    - AND OR : and는 모든 게 T 이고, OR 은 하나라도 T면된다.
- SELECT *FROM userinfo  WHERE phone LIKE ; %수%’
- safe 모드 끄는 법
- SELECT * FROM

age ASC 와 grade DESC; >>순서 차이 

- ORDERBY 함수의 역할: 쿼리 결과를 특정 컬럼을 기준으로 정렬해준다.
- SQL에서 `LIMIT` 절은 **쿼리 결과에서 반환되는 행의 수를 제한하는 데 사용**
- 이름 오름차순인데 가장 이름이 빠른 사람 1명은 제외하고 3명 만 조회.
- 페이지네이션, LIMTIT 3 , 이 중요한 이유 ex) 1p 특면 OFFSET 1;
- LIMTIT과 오프셋이 묶여서 사용되는 이유