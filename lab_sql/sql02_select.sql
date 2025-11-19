/*
 * 기본 질의(Query) 문법: 테이블에서 데이터를 검색.
 * (문법) select 컬럼이름, 컬럼이름, ... from 테이블이름;
 * 테이블의 모든 컬럼을 검색: select * from 테이블이름;
 */

-- 직원 테이블(emp)에서 사번(empno)과 직원 이름(ename)을 검색:
select empno, ename from emp;

-- 직원 테이블의 모든 컬럼을 검색:
select * from emp;

-- 직원들의 정보를 부서번호, 사번, 이름, 업무, 급여, 수당, 입사일, 매니저 사번 순서로 출력.
select deptno, empno, ename, job, sal, comm, hiredate, mgr
from emp;

-- 컬럼 이름에 별명(alias) 주기: 컬럼이름 as "별명"
-- as 키워드는 생략 가능.
-- 별명에 공백이 없는 경우에는 큰따옴표("") 생략 가능.
-- 별명 이름에서는 작은따옴표('')는 사용 불가!
select
    empno as "사번",
    ename "직원 이름",
    sal 급여
from emp;

