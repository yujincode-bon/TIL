#POpe입문
- MYSQL과의 차이점 
<다른 문법>
1. EXPLAIN (실행은 해주지 않음)
   SELECT * FROM slaes WHERE total_amount> 50000; 
2. EXPLANE EXTENDED 
SELECT*FROM SLAES WHERE...>... --> 추가정보 확인 
3. EXPLANE FORMAT=JASON --> MY SQL에서 쿼리의 실행계획을 JSON 형식으로 출력하는 명령어, 사람이 읽기 쉽도록 한다. 쿼리 성능 
SELECT*FROM sales WHERE total_amount>50000; 

4. 출력 형태 


-카디널리티(Cardinality) 개념
특정 컬럼에 들어 있음

*  특정 컬럼에 들어 있는 "서로 다른 값의 수를 의미한다. 
 ## PostgreSQL 방식
 PostgreSQL: 비용기반확보
 cost= 0.42.. 8.45: 시작비용.. 총비용
 rows=1: 예상 반환 행 수 
 width =89: 행당 평균  바이트 수 
 axtual time=0.123..0.125:실제 실행 시간(ANALYZE 시)
 liips-1 노드 실행 횟수 

 ## 인덱싱 
 PostgreSQL에서 인덱싱이란..
 1. index type 지정가능
 CREATED INDEX member_name_

HASH_INDEX: 범위 검색이나 정렬된 결과를 가져오려는 목적으로는 사용이 불가하다. 일반적인 DBMS 에서 해시 인덱스는 메모리 기반의 테이블에 주로 구현돼 있음. 동등비교 
- 장점: 실제 키 값과 관계없이 인덱스 크기가 작고 검색이 빠르다 B-tree 인덱스보다 훨씬 크기가 작다. 

B트리 인덱스 (특별지정 없으면 , 우선지정 됨 )
-하나의 노드에 여러 값 저장 , 2개 이상 자식 노드 가능 
여러개의 값을 저장할 수 있어 데이터가 많아도 DEPT는 항상 적다. 

## 인덱스 성능 개선 결과 
1. 인덱싱을 통해 수만개 행 검사대신 필요한 행만 검사함. 매우빠름 
2. 범위 검색(amoun) 
3. 복합 조건 검색  복합 인덱스는 모든 조건이 인덱스를 사용해서 매우 빠름 
 1) 복합인덱스는 왼쪽부터 순서대로 사용해야한다. 
 ``
 -- 아래 쿼리는 인덱스 사용 O
SELECT * FROM users WHERE name = '홍길동';

-- 아래 쿼리는 인덱스 사용 X
SELECT * FROM users WHERE age = 30;  -- name이 빠졌기 때문
 ``

마크다운 수정 