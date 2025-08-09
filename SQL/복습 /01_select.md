# select 와 alter의 차이점 
SQL에서 ALTER와 CHANGE는 비슷해 보이지만, 쓰임과 범위가 다릅니다.

⸻

1. ALTER
	•	의미: 테이블 구조를 변경할 때 쓰는 상위 명령어
	•	기능: 컬럼 추가, 삭제, 수정, 제약조건 변경, 인덱스 추가/삭제 등 폭넓은 변경 작업 가능
	•	예시:

-- 컬럼 추가
ALTER TABLE members ADD COLUMN age INT;

-- 컬럼 삭제
ALTER TABLE members DROP COLUMN age;



⸻

2. CHANGE
	•	의미: ALTER TABLE 명령 안에서 컬럼 이름과 타입을 동시에 변경할 때 사용 (MySQL 전용 문법)
	•	특징: 기존 컬럼명과 새 컬럼명 둘 다 써야 함
	•	예시:

-- 컬럼 이름 변경 + 자료형 변경
ALTER TABLE members CHANGE old_name new_name VARCHAR(50);



⸻

핵심 차이

구분	ALTER |	CHANGE
역할	테이블 전체 구조 변경 명령어	|  컬럼 이름/타입 변경 (MySQL 한정)
범위	컬럼 추가/삭제, 제약조건 변경, 인덱스 변경 등	| 컬럼명과 타입을 동시에 수정
문법	ALTER TABLE ... ADD / DROP / MODIFY / CHANGE ...	| ALTER TABLE ... CHANGE old_name new_name type
특징	다양한 세부 명령 포함	| 기존 이름 + 새 이름 모두 명시 필요


⸻

💡 참고:
	•	MySQL에서는 CHANGE 대신 MODIFY를 쓰면 컬럼명은 그대로 두고 타입만 변경할 수 있습니다.
	•	표준 SQL에는 CHANGE라는 키워드는 없고, ALTER TABLE ... RENAME COLUMN 같은 표준 문법을 사용합니다.

⸻