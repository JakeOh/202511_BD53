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
select job, ename, empno, deptno
from emp
where comm is not null;

commit;

select * from bonus;
