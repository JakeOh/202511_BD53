/*
 * 조건 검색 - where 구문
 * 조건을 만족하는 행(row)들을 선택하는 방법.
 * (문법) select 컬럼, ... from 테이블 where 조건식 [order by 컬럼, ...];
 *
 * 조건식에서 사용되는 연산자:
 * (1) 비교 연산자: =, !=, >, >=, <, <=, is null, is not null, ...
 * (2) 논리 연산자: and, or, not
 */

-- 10번 부서에서 근무하는 직원들의 사번, 이름, 부서번호를 출력.
select empno, ename, deptno
from emp
where deptno = 10;

-- 10번 부서가 아닌 직원들의 사번, 이름, 부서번호를 출력.
select empno, ename, deptno
from emp
where deptno != 10;


-- 수당(comm)이 null이 아닌 직원들의 모든 정보를 출력.
select * from emp
where comm is not null;

-- (주의) null인지 null이 아닌지를 비교할 때는 =, != 연산자를 사용하면 안됨!
-- 반드시 is null, is not null 키워드를 사용해야 됨.
select * from emp where comm != null;
select * from emp where comm = null;

-- 수당이 null인 직원들 정보
select * from emp where comm is null;

-- 수당이 null이 아닌 직원들의 부서번호, 사번, 이름, 급여, 수당을 검색
-- 정렬 순서: (1) 부서번호 오름차순, (2) 사번 오름차순
select deptno, empno, ename, sal, comm
from emp
where comm is not null
order by deptno, empno;

-- 급여가 2000 이상인 직원들의 이름, 업무, 급여를 출력.
-- 정렬 순서: (1) 급여 내림차순, (2) 이름 오름차순
select ename, job, sal
from emp
where sal >= 2000
order by sal desc, ename;

-- 급여가 2000 이상이고 3000 이하인 직원들의 이름, 업무, 급여를 출력
-- 정렬 순서: 급여 내림차순.
select ename, job, sal
from emp
where sal >= 2000 and sal <= 3000
order by sal desc;

select ename, job, sal
from emp
where sal between 2000 and 3000
order by sal desc;

-- 비교: 급여가 2000 이하이거나 3000 이상인 직원들.
select ename, job, sal
from emp
where sal <= 2000 or sal >= 3000
order by sal desc;

-- 수당은 null이 아니고, 급여는 1500 미만인 직원들
select * from emp 
where comm is not null and sal < 1500;

-- 10번 또는 20번 부서에서 근무하는 직원들의 부서번호, 이름, 급여를 출력.
-- 정렬: (1) 부서번호 오름차순, (2) 급여 내림차순.
select deptno, ename, sal
from emp
where deptno = 10 or deptno = 20
order by deptno, sal desc;

select deptno, ename, sal
from emp
where deptno in (10, 20)
order by deptno, sal desc;

-- 업무가 'CLERK'인 직원들의 이름, 업무, 급여를 출력. 이름순으로 출력.
select ename, job, sal
from emp
where job = 'CLERK'
order by ename;
--> (주의) SQL 식별자(예약어, 테이블 이름, 컬럼 이름)를 제외한 문자열은 작은따옴표('')를 사용해야 함.
-- 문자열 비교는 대/소문자를 구분함.
-- 식별자들은 대/소문자를 구분하지 않음.

-- 업무가 'CLERK' 또는 'MANAGER'인 직원들의 이름, 업무, 급여를 출력.
-- 정렬: (1) 업무, (2) 급여
select ename, job, sal
from emp
where job = 'CLERK' or job = 'MANAGER'
order by job, sal;

select ename, job, sal
from emp
where job in ('CLERK', 'MANAGER')
order by job, sal;

-- 업무가 영업사원, 관리자, 분석가인 직원들.
select * from emp
where job = 'SALESMAN' or job = 'MANAGER' or job = 'ANALYST'
order by job;

select * from emp
where job in ('SALESMAN', 'MANAGER', 'ANALYST')
order by job;

-- 20번 부서에서 근무하는 'CLERK'의 모든 레코드(모든 컬럼)를 출력.
select * from emp
where deptno = 20 and job = 'CLERK';

-- CLERK, ANALYST, MANAGER가 아닌 직원들의 사번, 이름, 업무, 급여를 사번순 출력.
select empno, ename, job, sal
from emp
where job != 'CLERK' and job != 'ANALYST' and job != 'MANAGER'
order by empno;

select empno, ename, job, sal
from emp
where job not in ('CLERK', 'ANALYST', 'MANAGER')
order by empno;


-- like 검색: 특정 문자열이 포함된 값들을 찾는 검색 방법
-- like 검색에서 사용되는 wildcard:
-- (1) %: 글자수 상관없이 어떤 문자열이어도 상관 없음.
-- (2) _: 밑줄(underscore)이 있는 자리에 한 글자가 어떤 문자이더라도 상관 없음.

select * from emp where job like 'C%';
--> 업무가 'C'로 시작하는 모든 단어인 경우.

select * from emp where job like '%R';
--> 업무가 'R'로 끝나는 모든 단어인 경우.

select * from emp where job like '%A%';
--> 업무에 'A'가 포함된 경우.

select * from emp where job like 'C_';
select * from emp where job like '_LERK';
select * from emp where job like '__ERK';

-- 이름에 'A'가 포함된 직원들의 정보.
select * from emp where ename like '%A%';

-- 업무에 'MAN'이 포함된 직원들의 정보.
select * from emp where job like '%MAN%';

