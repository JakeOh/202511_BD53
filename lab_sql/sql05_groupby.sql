/*
 * 다중행 함수: 여러개의 행들이 함수의 아규먼트로 전달되고 하나의 값이 반환되는 함수.
 * 통계 함수: count, sum, avg, ...
 */

-- count(var): var(컬럼)에서 null이 아닌 행의 개수를 반환.
select count(empno) from emp;
select count(mgr) from emp;

-- count(*): 테이블의 전체 행의 개수를 반환.
select count(*) from emp;

-- 통계(집계) 함수: null을 제외하고 계산.
-- sum(): 합계
select sum(sal) from emp;
select sum(comm) from emp;

-- avg(): average. 평균(= sum / count).
select avg(sal) from emp;
-- select 29025 / 14 from dual;

select avg(comm) from emp;
-- select 2200 / 4 from dual;

-- variance(): 분산
-- stddev(): 표준편차. standard deviation.
-- max(): 최댓값
-- min(): 최솟값

-- 급여 개수, 합계, 평균, 분산, 표준편차, 최댓값, 최솟값 출력
select
    count(sal) as 개수,
    sum(sal) as 합계,
    round(avg(sal), 2) as 평균,
    round(variance(sal), 2) as 분산,
    round(stddev(sal), 2) as 표준편차,
    max(sal) as 최댓값,
    min(sal) as 최솟값
from emp;

-- 다중행 함수는 단일행 함수와 함께 사용될 수 없음!
-- select count(comm), nvl(comm, 0) from emp;
-- select comm, count(comm) from emp;

/*
 * 그룹별 쿼리
 * (예) 부서별 직원수, 부서별 급여 평균, ...
 * (문법)
 * select 컬럼, 그룹함수, ...
 * from 테이블, ...
 * where 조건식(1)
 * group by 컬럼(그룹을 묶기 위한 필드), ...
 * having 조건식(2)
 * order by 컬럼(정렬 기준이 되는 필드), ...;
 * 
 * where 조건식(1): 그룹을 묶기 전에 조건을 만족하는 행들만 선택하기 위한 조건식.
 * having 조건식(2): 그룹을 묶은 다음에 조건에 맞는 그룹들만 선택하기 위한 조건식.
 */
 
-- group by에서 사용한 그룹을 묶기 위한 컬럼 이름은 select에서 사용할 수 있음.
-- groub by에서 설정되지 않은 컬럼은 select할 수 없음.
-- 부서별 인원수
select deptno, count(*)
from emp
group by deptno
order by deptno;

-- 부서별 급여 평균(소숫점 2자리까지)
select deptno, round(avg(sal), 2) as AVG_SAL
from emp
group by deptno
order by deptno;
