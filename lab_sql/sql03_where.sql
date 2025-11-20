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
