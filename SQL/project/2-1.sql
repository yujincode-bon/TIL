--2-1.sql 
-- 직원별 담당 고객 수 집계
-- 각 직원(employee_id, first_name, last_name)이 담당하는 고객 수를 집계하세요.
-- 고객이 한 명도 없는 직원도 모두 포함하고, 고객 수 내림차순으로 정렬하세요.
 SELECT 
	 e.first_name AS 이름,
		 e.last_name AS 성, 
		 COUNT(c.customer_id) AS 고객수 
 FROM employees e 
 JOIN customers c ON e.employee_id = c.support_rep_id-- 꼭 같은 키가 없더라도 담당 직원으로 연결되어 있음 
-- LEFT 조인을 사용해야 하는 이유--> "고객이 한명도 없는 테이블도 모두 포함" JOIN 은 겹치는 것 "만" 출력 "
GROUP BY e.employee_id,e.first_name, e.last_name 
ORDER BY 고객수;
--<COUNT 
-- -- 우리는 employees 테이블과 customers 테이블을 LEFT JOIN 하고 있습니다.
-- 	즉, 고객이 없는 직원도 결과에 포함되어야 합니다.
-- 이때 고객이 없으면 c.customer_id는 NULL입니다.
-- COUNT(*)
-- 모든 행을 셈 (NULL 포함)
-- 고객이 없더라도 1로 카운트됨 ❌
-- COUNT(c.customer_id)
-- NULL 제외하고 셈
-- 고객이 없으면 0으로 나옴 ✅

 