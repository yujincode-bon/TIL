--해시테이블 비트리 
CREATE INDEX <index
--범위검색 BETWEEN, >,>
-- 정렬 ORDER BY
-- 부분 일치 LIKE 

-- Haxh 인덱스
CREATED INDEX <index_name> ON <table name> (<col_name>)
--정확한 일치 검색 - 
-- 범위x정렬x
-- 부분 인덱스 
CREATED INCEX <indec_name> ON <table_name>(<coll_name>)
WHERE 조건='blaf;

--특정 조건의 데이터만 자주 검색
-- 공간/비용 모두 절약  (아직 배송이 안끝난 ...)
--인덱스 추가하는 데 사용하지 않음 (함수사용 타입변환 앞쪽 와일드 카드), 부정 조건)
SELECT*FROMusers WHERE UPPER (name)='JOHN;
--age는 숫자인데 문자를 넣은 경우
-- 해결 방법
함수 기반 인덱싱 CREATE INDEX <name> ON users 
%김-- LIKE -> 앞쪽 와일드카드 
부정조건
인덱스는 검색성능은 올리지만 저장곤간을 잡아 먹는다  추가필요 --|| 저장공간 추가 필요 =. 수정 성능- 실제 쿼리 패턴으 분석하고 나서 인덱스를 설꼐해라 성능 측정은 실제 대=ㅔ이터를 가지고 해야만한다. 
 