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
 *    FROM 테이블1 JOIN종류 테이블2 ON JOIN조건;
 * 2. Oracle 문법
 *    SELECT 컬럼, ...
 *    FROM 테이블1, 테이블2, ...
 *    WHERE JOIN조건;
 */

select * from emp;  -- 사번, 이름, 업무, 매니저사번, 입사일, 급여, 수당, 부서번호
select * from dept;  -- 부서번호, 부서이름, 위치(도시)




