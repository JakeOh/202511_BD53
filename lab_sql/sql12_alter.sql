/*
 * alter table: 테이블 (정의) 변경.
 * 1. 이름 변경: alter table ... rename ... to ...;
 * 2. 추가: alter table ... add ...;
 * 3. 삭제: alter table ... drop ...;
 * 4. 수정: alter table ... modify ...;
 */

-- 1. 이름 변경(rename): 테이블 이름, 컬럼 이름, 제약조건 이름 변경
-- (1) 테이블 이름: ALTER TABLE table_name RENAME TO new_table_name;
-- 테이블 ex_students의 이름을 students로 변경
alter table ex_students rename to students;

-- (2) 컬럼 이름 변경: ALTER TABLE table_name RENAME COLUMN column_name TO new_column_name;
-- students 테이블의 stu_no 컬럼 이름을 id로 변경.
alter table students rename column stu_no to id;

-- studnets 테이블의 stu_name 컬럼 이름을 name으로 변경.
alter table students rename column stu_name to name;

-- (3) 제약조건 이름 변경: ALTER TABLE table_name RENAME CONSTRAINT orginal_name TO new_name;
-- ex_tbl1 테이블의 제약조건 SYS_C008351 이름을 tbl1_pk로 변경
alter table ex_tbl1 rename constraint SYS_C008351 to tbl1_pk;


-- 2. 추가(add): 컬럼 추가, 제약조건 조건.
-- (1) 컬럼 추가
-- ALTER TABLE table_name ADD new_column data_type [기본값 제약조건];
-- students 테이블에 grade 컬럼(2자리 정수)을 추가.
alter table students add grade number(2);

-- students 테이블에 email 컬럼(가변길이 문자열 100 byte, 기본값 '')을 추가.
alter table students add email varchar2(100) default '';

insert into students (id, name) values (1234, '김길동');
commit;
select * from students;

-- (2) 제약조건 추가
-- ALTER TABLE table_name ADD CONSTRAINT 제약조건_이름 제약조건_내용;
-- students 테이블에 id 컬럼에 고유키 제약조건을 추가
-- students 테이블의 id 컬럼에는 이미 null이 포함되어 있음. -> PK 제약조건을 줄 수 없음.
-- id가 null인 행들을 먼저 삭제.
delete from students where id is null;
commit;

-- id 컬럼은 null이 없고, 중복되는 값들도 없음. -> PK 제약조건을 줄 수 있음.
alter table students add constraint students_pk primary key (id);


-- 3. 삭제(drop): 컬럼 삭제, 제약조건 삭제.
-- (1) 컬럼 삭제
-- ALTER TABLE 테이블_이름 DROP COLUMN 컬럼_이름;
-- students 테이블에서 birthday 컬럼을 삭제
alter table students drop column birthday;

-- (2) 제약조건 삭제
-- ALTER TABLE 테이블_이름 DROP CONSTRAINT 제약조건_이름;
-- students 테이블에서 제약조건 students_pk를 삭제
alter table students drop constraint students_pk;


-- (참고) 메타 테이블: 테이블을 관리하기 위한 테이블. (예) user_tables, user_constraints
select * from user_tables;
--> 현재 접속 계정(scott)에서 생성한 테이블들.

select table_name from user_tables;

-- 'ex_'로 시작하는 모든 테이블 이름들을 찾아보세요.
select table_name from user_tables
where lower(table_name) like 'ex_%';
-- where upper(table_name) like 'EX_%';
-- where table_name like 'EX_%';
--> 오라클은 테이블 이름/컬럼 이름/제약조건 이름들을 메타 테이블에 저장할 때 대문자로만 저장.
--> 메타 테이블에서 테이블 이름 또는 제약조건 이름을 찾고 싶을 때는 대문자 비교를 사용.

-- 제약조건을 관리하는 메타 테이블
select * from user_constraints;

-- ex_tbl1 테이블에 설정된 제약조건 이름, 타입, 내용(search_condition)을 출력
select constraint_name, constraint_type, search_condition
from user_constraints
where table_name = 'EX_TBL1';

-- 'SYS_'로 시작하는 제약조건 이름들을 찾으세요.
select constraint_name from user_constraints
where constraint_name like 'SYS_%';
