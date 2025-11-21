/*
 * 오라클 함수(function)
 * 1. 단일 행 함수:
 *    - 행(row)이 하나씩 함수의 아규먼트로 전달되고, 행마다 결과값이 반환되는 함수.
 *    - (예) to_number, to_date, to_char, lower, upper, ...
 * 2. 다중 행 함수:
 *    - 테이블에서 여러개의 행들이 함수의 아규먼트로 전달되고, 하나의 결과값이 반환되는 함수.
 *    - 통계 관련 함수. (예) count, sum, avg, ...
 */

-- 단일 행 함수
-- to_char(컬럼, '포맷'): 컬럼의 값들을 '포맷' 형식의 문자열로 변환.
select 
    ename, 
    to_char(hiredate, 'YYYY-MM-DD') as "입사일1",
    to_char(hiredate, 'MM/DD/YYYY') as "입사일2"
from emp;
