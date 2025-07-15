-- pg-03-explain-analyze.sql

-- 실행 계획을 보자
EXPLAIN --실행계획을 보여주는 명령어.실제 실행이 아님 
SELECT * FROM large_customers WHERE customer_type = 'VIP';

-- Seq Scan on large_customers  (cost=0.00 .. 3746.00 rows=10013 width=159byte)
-- cost = 점수(낮을수록 좋음) / rows * width = 총 메모리 사용량
-- Filter: (customer_type = 'VIP'::text)

-- 실행 + 통계
EXPLAIN ANALYZE --쿼리를 실행한 뒤 실행시간과 실제 실행 경로 출력 
SELECT * FROM large_customers WHERE customer_type = 'VIP';

-- Seq Scan on large_customers  (cost=0.00..3746.00 rows=10013 width=159) 
-- 인덱스 없고
-- 테이블 대부분의 행을 읽어야 하고
-- 순차 스캔이 빠를 때
-- // seq scan 이 사용된 이유 1. 조거절이 없거나, 인덱스가 없는 칼럼으로 검색하거나, 인덱스보다 더 효율적이라고 판단되는 경우
-- Explain 옵션들

-- 버퍼 사용량 포함(쿼리가 데이터를 읽거나 쓸때 메모리와 디스크를 얼마나 사용했는지를 나타낸다.
EXPLAIN (ANALYZE, BUFFERS)
SELECT * FROM large_customers WHERE loyalty_points > 8000;

-- 상세 정보 포함
EXPLAIN (ANALYZE, VERBOSE, BUFFERS)
SELECT * FROM large_customers WHERE loyalty_points > 8000;

-- JSON 형태
EXPLAIN (ANALYZE, VERBOSE, BUFFERS, FORMAT JSON)
SELECT * FROM large_customers WHERE loyalty_points > 8000;


-- 진단 (Score is too high)
EXPLAIN ANALYZE
SELECT
	c.customer_name,
	COUNT(o.order_id)
FROM large_customers c
LEFT JOIN large_orders o ON c.customer_name = o.customer_id  -- 잘못된 JOIN 조건
GROUP BY c.customer_name;

-- 3. 메모리 부족
EXPLAIN (ANALYZE, BUFFERS)
SELECT customer_id, array_agg(order_id)
FROM large_orders
GROUP BY customer_id;