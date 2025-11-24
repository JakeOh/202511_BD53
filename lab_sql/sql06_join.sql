/*
 * join: 관계형 데이터베이스(RDBMS)에서 2개 이상의 테이블에서 필요한 정보들을 검색하는 방법.
 * join의 종류:
 * 1. (inner) join
 * 2. outer join
 *    (1) left (outer) join
 *    (2) right (outer) join
 *    (3) full (outer) join
 * join 문법
 * 1. ANSI 표준 문법
 *    SELECT 컬럼, ...
 *    FROM 테이블1 [테이블1별명] JOIN종류 테이블2 [테이블2별명] ON JOIN조건;
 * 2. Oracle 문법
 *    SELECT 컬럼, ...
 *    FROM 테이블1 [테이블1별명], 테이블2 [테이블2별명], ...
 *    WHERE JOIN조건;
 */

-- inner join과 outer join의 차이점을 비교하기 위한 데이터
insert into emp (empno, ename, sal, deptno)
values (1004, '오쌤', 4500, 50);
commit;

select * from emp;  -- 사번, 직원이름, 업무, 매니저사번, 입사일, 급여, 수당, 부서번호
select * from dept;  -- 부서번호, 부서이름, 위치(도시)

-- inner join: 직원이름, 부서번호, 부서이름 검색
-- (1) ANSI 표준 문법
select 
    emp.ename, emp.deptno, dept.dname
from emp 
    inner join dept on emp.deptno = dept.deptno;
--> 컬럼 이름이 한 테이블에서 있는 경우에는 "테이블."을 생략해도 됨.
--> 컬럼 이름이 2개 이상의 테이블에 존재하는 경우에는 "테이블."을 생략할 수 없음.
--> inner join에서 inner는 생략 가능.

-- (2) Oracle 문법
select
    e.ename, e.deptno, d.dname
from emp e, dept d
where e.deptno = d.deptno;

-- left (outer) join: 직원이름, 부서번호, 부서이름
-- (1) ANSI 문법
select
    e.ename, e.deptno, d.deptno, d.dname
from emp e
    left outer join dept d on e.deptno = d.deptno;
--> left outer join에서 outer는 생략 가능.

-- (2) Oracle 문법
select
    e.ename, e.deptno, d.deptno, d.dname
from emp e, dept d
where e.deptno = d.deptno(+);


-- right outer join: 직원이름, 부서번호, 부서이름
-- (1) ANSI 문법
select
    e.ename, e.deptno, d.deptno, d.dname
from emp e
    right join dept d on e.deptno = d.deptno;
--> right outer join에서 outer는 생략 가능.

-- (2) Oracle 문법
select
    e.ename, e.deptno, d.deptno, d.dname
from emp e, dept d
where e.deptno(+) = d.deptno;


-- full outer join: 직원이름, 부서번호, 부서이름.
-- (1) ANSI 문법
select
    e.ename, e.deptno, d.deptno, d.dname
from emp e
    full join dept d on e.deptno = d.deptno;
--> full outer join에서 outer는 생략 가능.

-- (2) Oracle 문법
-- 오라클에서는 full outer join 문법을 제공하지 않음!
-- 오라클에서는 left outer join의 결과와 right outer join의 결과를 "합집합(union)"
select
    e.ename, e.deptno, d.deptno, d.dname
from emp e, dept d
where e.deptno = d.deptno(+)
union
select
    e.ename, e.deptno, d.deptno, d.dname
from emp e, dept d
where e.deptno(+) = d.deptno;


-- equi-join: 조인 조건식이 등호(=)로 작성된 경우.
-- non-equi join: 조인 조건식이 부등호(>, >=, <, <=, ...)로 작성된 경우.
-- emp과 salgrade 테이블에서 사번, 이름, 급여, 급여등급을 검색(inner join)
-- (1) ANSI 문법
select
    e.empno, e.ename, e.sal, s.grade
from emp e
    join salgrade s 
    on e.sal between s.losal and s.hisal;
    -- on e.sal >= s.losal and e.sal <= s.hisal;

-- (2) Oracle 문법
select
    e.empno, e.ename, e.sal, s.grade
from emp e, salgrade s
where e.sal between s.losal and s.hisal;
