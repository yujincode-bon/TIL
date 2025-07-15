-- pg-07-recursive-cte.sql
--Re
WITH RECURSIVE numbers AS(
	--초기값
	SELECT 1 as num
	--
	UNION ALL
	--재귀 부분 
	SELECT num + 1 
	FROM numbers 
	WHERE num<10 --NUM dl 10을 넘지 않으면 계속 반복한다.numbers가 없었는데 그것을 활용하려고함 
)
 SELECT * FROM numbers;

 WITH RECURSIVE factorial(n) AS (
 	  SELECT 

 )
 SELECT *FROM numbers;
 SELECT *FROM
  WITH RECURSIVE org_chart AS(--반드시 이구조안에서만 테스트 가능함)
		SELECT
		 employee_id,
		 employee_name,
		 manager_id,
		 departmnet,
		 1 AS 레벨,
		 employee_name AS 조직구조 
		FROM  employees 
		WHERE manager_id is NULL

		UNION ALL

		SELECT
		 e.employee_id,
		 e.employee_name,
		 e.manager_id,
		 e.departmnet,
		 oc.레벨 + 1
		 oc.조직구조 ||'>>'|| e,employee_name, 
		 employee_name AS 조직구조 
		FROM  employees e
		INNER JOIN org_chart oc ON e.manager_id =oc.employee_id 
		WHERE manager_id is NULL
	
	
  ) SELECT *FROM org_chart 


WITH RECURSIVE org_chart AS (
	SELECT
		employee_id,
		employee_name,
		manager_id,
		department,
		1 AS 레벨,
		employee_name::text AS 조직구조
	FROM employees
	WHERE manager_id is NULL OR employee_id 
	UNION ALL 
	SELECT
		e.employee_id,
		e.employee_name,
		e.manager_id,
		e.department,
		oc.레벨 + 1, --2
		(oc.조직구조 || '>>' || e.employee_name)::text -- 스트링 더하는 것 
	FROM employees e
	INNER JOIN org_chart oc ON e.manager_id=oc.employee_id--1줄 (CEO)가 내 상사인 사람들 
)
SELECT 
  	*
FROM org_chart
ORDER BY 레벨;


	



  
 