-- pg-02-large-dataset.sql
-- 숫자 생성
SELECT generate_series(1,10);
-- 날짜 생성
SELECT generate_series(
	'2024-01-01'::date,
	'2024-12-31'::date,
	'1 day'::interval
);
-- 시간 생성
SELECT generate_series(
	'2024-01-01 00:00:00'::timestamp,
	'2024-01-01 23:59:59'::timestamp,
	'1 hour'::interval
);
CREATE TABLE large_orders AS
SELECT
    generate_series(1, 1000000) AS order_id,
    -- 고객 ID (랜덤)
    'CUST-' || LPAD((floor(random() * 50000) + 1)::text, 6, '0') AS customer_id,
    -- 제품 ID (랜덤)
    'PROD-' || LPAD((floor(random() * 10000) + 1)::text, 5, '0') AS product_id,
    -- 주문 금액 (랜덤)
    (random() * 1000000 + 1000)::NUMERIC(12,2) AS amount,
    -- 주문 날짜 (2023-2024년 랜덤)
    (DATE '2023-01-01' + (floor(random() * 730))::int) AS order_date,
    -- 지역 (배열에서 랜덤 선택)
    (ARRAY['서울', '부산', '대구', '인천', '광주', '대전', '울산'])[
        CEIL(random() * 7)::int
    ] AS region,
    -- 카테고리 태그 (배열)
    CASE
        WHEN random() < 0.3 THEN ARRAY['전자제품', '인기상품']
        WHEN random() < 0.6 THEN ARRAY['의류', '패션']
        WHEN random() < 0.8 THEN ARRAY['생활용품', '필수품']
        ELSE ARRAY['식품', '신선식품']
    END AS category_tags,
    -- 주문 세부 정보 (JSONB)
    jsonb_build_object(
        'payment_method',
        (ARRAY['카드', '현금', '계좌이체', '포인트'])[CEIL(random() * 4)::int],
        'delivery_fee',
        CASE WHEN random() < 0.5 THEN 0 ELSE 3000 END,
        'is_express',
        random() < 0.3,
        'discount_rate',
        (random() * 20)::int
    ) AS order_details,
    -- 생성 시간
    NOW() AS created_at;
-- 생성된 데이터 확인
SELECT COUNT(*) FROM large_orders;
-- 데이터 샘플 확인
SELECT * FROM large_orders LIMIT 5;