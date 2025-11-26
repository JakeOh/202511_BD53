/* 
 * 연습문제 - scott 계정을 사용
 */

-- 페이징(paging) 처리
-- 1. 직원 테이블을 사번 오름차순으로 정렬했을 때 1 ~ 5번 행까지 출력
-- 2. 직원 테이블을 사번 오름차순으로 정렬했을 때 6 ~ 10번 행까지 출력
-- 3. 직원 테이블을 사번 오름차순으로 정렬했을 때 11 ~ 15번 행까지 출력

-- rownum: Oracle에서 제공되는 가상(pseudo) 컬럼.
select rownum, e.* from emp e;
select rownum, e.* from emp e order by empno;

select
    rownum, t.*
from (
    select * from emp order by empno
) t;

select
    t2.*
from (
    select rownum as "RN", t1.* 
    from (
        select * from emp order by empno
    ) t1
) t2
where t2.RN between 11 and 15;

with t2 as (
    select rownum as "RN", t1.*
    from (
        select * from emp order by empno
    ) t1
)
select t2.*
from t2
where t2.RN between 11 and 15;

-- row_number() 윈도우 함수 사용:
select 
    emp.*,
    row_number() over (order by empno) as "RN"
from emp;

with t as (
    select 
        emp.*,
        row_number() over (order by empno) as "RN"
    from emp
)
select t.*
from t
where t.RN between 11 and 15;

-- Top-N 쿼리(query)
select *
from emp
order by empno
offset 10 rows
fetch next 5 rows only;
--> offset x rows: 첫 x개의 행을 건너뛰고
--> fetch next y rows only: 그다음 y개의 행들만 출력.


/*
 * 연습문제 - hr 계정을 사용
 * - hr.sql 스크립트를 실행
 * - hr 계정의 테이블 내용을 파악
 * - 연습문제들에서 직원의 이름은 이름(first_name)과 성(last_name)을 붙여서 하나의 컬럼으로 출력.
 *   (예) Steven King
 */

-- 1. 직원의 이름과 부서 이름을 출력. (inner join)
select 
    e.first_name || ' ' || e.last_name as "직원이름",
    d.department_name
from employees e
    join departments d on e.department_id = d.department_id
;

select 
    e.first_name || ' ' || e.last_name as "직원이름",
    d.department_name
from employees e, departments d 
where e.department_id = d.department_id
;

-- 2. 직원의 이름과 부서 이름을 출력. 부서 번호가 없는 직원도 출력.
select 
    e.first_name || ' ' || e.last_name as "직원이름",
    d.department_name
from employees e
    left join departments d on e.department_id = d.department_id
;

select 
    e.first_name || ' ' || e.last_name as "직원이름",
    d.department_name
from employees e, departments d 
where e.department_id = d.department_id(+)
;

-- 3. 직원의 이름과 직무 이름(job title)을 출력.
select
    e.first_name || ' ' || e.last_name as "직원이름",
    j.job_title
from employees e
    join jobs j on e.job_id = j.job_id;

select
    e.first_name || ' ' || e.last_name as "직원이름",
    j.job_title
from employees e, jobs j 
where e.job_id = j.job_id;

-- 4. 직원의 이름과 직원이 근무하는 도시 이름(city)를 출력.
select
    e.first_name || ' ' || e.last_name as "직원이름",
    l.city
from employees e
    join departments d on e.department_id = d.department_id
    join locations l on d.location_id = l.location_id;

select
    e.first_name || ' ' || e.last_name as "직원이름",
    l.city
from employees e, departments d, locations l
where e.department_id = d.department_id
    and d.location_id = l.location_id;

-- 5. 직원의 이름과 직원이 근무하는 도시 이름(city)를 출력. 근무 도시를 알 수 없는 직원도 출력.
select
    e.first_name || ' ' || e.last_name as "직원이름",
    l.city
from employees e
    left join departments d on e.department_id = d.department_id
    left join locations l on d.location_id = l.location_id;

select
    e.first_name || ' ' || e.last_name as "직원이름",
    l.city
from employees e, departments d, locations l
where e.department_id = d.department_id(+)
    and d.location_id = l.location_id(+);

-- 6. 2008년에 입사한 직원들의 이름을 출력.
-- 입사일을 DATE 타입의 크기 비교를 사용
select
    first_name || ' ' || last_name as "직원이름"
from employees
where hire_date between to_date('2008-01-01', 'YYYY-MM-DD') and to_date('2008-12-31', 'YYYY-MM-DD');

select
    first_name || ' ' || last_name as "직원이름"
from employees
where hire_date between '2008-01-01' and '2008-12-31';
--> '2008-01-01' 문자열을 암묵적으로 DATE 타입으로 변환한 다음에 크기 비교.

-- 입사일(DATE 타입)을 문자열로 변환해서 문자열 비교.
select
    first_name || ' ' || last_name as "직원이름"
from employees
where to_char(hire_date, 'YYYY') = '2008';

-- 7. 2008년에 입사한 직원들의 부서 이름과 부서별 인원수 출력.
select
    d.department_name, count(*) as "직원수"
from employees e
    join departments d on e.department_id = d.department_id
where to_char(e.hire_date, 'YYYY') = '2008'
group by d.department_name
;

select
    d.department_name, count(*) as "직원수"
from employees e, departments d
where e.department_id = d.department_id
    and to_char(e.hire_date, 'YYYY') = '2008'
group by d.department_name;


-- 8. 2008년에 입사한 직원들의 부서 이름과 부서별 인원수 출력. 
--    단, 부서별 인원수가 5명 이상인 경우만 출력.
-- 9. 부서번호, 부서별 급여 평균을 검색. 소숫점 한자리까지 반올림 출력.
-- 10. 부서별 급여 평균이 최대인 부서의 부서번호, 급여 평균을 출력.
-- (1) having 절과 서브쿼리 사용
-- (2) from 절에서의 서브쿼리 사용
-- (3) with 식별자 as (서브쿼리) 사용
-- (4) offset-fetch 사용
-- 11. 사번, 직원 이름, 국가 이름, 급여 출력.
-- 12. 국가이름, 국가별 급여 합계 출력.
-- 13. 사번, 직원이름, 직무 이름, 급여를 출력.
-- 14. 직무 이름, 직무별 급여 평균, 최솟값, 최댓값을 출력.
-- 15. 국가 이름, 직무 이름, 국가별 직무별 급여 평균을 출력.
-- 16. 국가 이름, 직무 이름, 국가별 직무별 급여 합계을 출력.
--     미국에서, 국가별 직무별 급여 합계가 50,000 이상인 레코드만 출력.
