/*
 * DML: insert, update, delete
 */

-- INSERT INTO table_name [(column1, column2, ...)] VALUES (value1, value2, ...);
-- INSERT INTO table_name [(column1, column2, ...)] SELECT 문장;
-- select를 결과를 테이블 table_name에 삽입(저장). 여러 개의 행들이 한 번에 삽입될 수 있음.

-- bonus 테이블에 이름, 업무, 급여, 수당을 삽입.
insert into bonus /* (ename, job, sal, comm) */
values ('홍길동', '도적', 100, 10);

-- bonus 테이블에 이름, 급여를 삽입.
insert into bonus (ename, sal)
values ('오쌤', 200);

-- emp 테이블에서 comm이 null이 아닌 직원들의 이름, 업무, 급여, 수당을 bonus 테이블에 삽입.
insert into bonus /* (ename, job, sal, comm) */
select ename, job, sal, comm
from emp
where comm is not null;

commit;

select * from bonus;


-- update 문장: 테이블의 특정 컬럼(들)의 값을 수정(업데이트)
-- (문법) UPDATE 테이블이름 SET 컬럼이름 = 값, ... [WHERE 조건절];
-- where 절은 생략 가능. where 절을 생략하면 테이블의 모든 행들이 업데이트됨.

select * from emp;

update emp set job = 'CLERK';
--> where 절이 없는 경우, 테이블의 모든 행(15개 행)의 job 컬럼 값들이 업데이트!

-- 직전(마지막) commit 상태로 되돌림.
rollback;


-- 사번이 1004인 직원의 업무를 'MANAGER', 입사일을 오늘날짜로 업데이트.
update emp
set job ='MANAGER', hiredate = sysdate
where empno = 1004;

commit;
--> 변경 내용 저장.

rollback;
--> rollback을 하더라도 이미 commit된 내용을 되돌릴 수는 없음.

-- 사번이 7369인 직원의 급여를 1000, 수당을 100으로 업데이트.
update emp
set sal = 1000, comm = 100
where empno = 7369;

-- 업무가 'CLERK'인 직원들의 급여를 10% 인상.
update emp
set sal = sal * 1.1
where job = 'CLERK';
