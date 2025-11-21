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

-- 직원이름, 입사연도를 출력
select ename, to_char(hiredate, 'YYYY') as "입사연도"
from emp;

-- lower(문자열 타입 컬럼): 소문자로 변환.
-- upper(문자열 타입 컬럼): 대문자로 변환.
-- initcap(문자열 타입 컬럼): 첫글자만 대문자, 나머지는 소문자로 변환.
select 
    ename, lower(ename), upper(ename), initcap(ename)
from emp;

-- replace(문자열 [컬럼], 변환전 문자, 변환할 문자)
select replace('smith', 'i', '*') from dual;
select replace('allen', 'l', '*') from dual;
select ename, replace(ename, 'A', '-') from emp;

-- substr(문자열[컬럼], 자르기 시작 인덱스, 자를 문자 개수)
select substr('hello sql', 3, 5) from dual;
select ename, substr(ename, 1, 2) from emp;

-- substr(문자열[컬럼], 자르기 시작 인덱스): 시작 인덱스부터 문자열 끝까지 자름.
select substr('hello sql', 2) from dual;

-- length(문자열[컬럼]): 글자수를 반환.
-- lengthb(문자열[컬럼]): 문자 바이트 개수를 반환.
select length('hello'), lengthb('hello') from dual;
select length('안녕하세요'), lengthb('안녕하세요') from dual;
--> 영문자, 숫자, 특수기호들은 저장할 때 1바이트(byte)를 사용.
--> 한글 1글자는 저장할 때 3바이트를 사용.

select ename, length(ename) from emp;

-- 직원 이름이 6글자 이상인 직원들의 레코드를 출력.
select * from emp where length(ename) >= 6;

-- 직원 이름의 첫글자와 마지막 글자만 표기하고 중간은 '*'로만 출력.
select substr(ename, 1, 1) || '*' || substr(ename, length(ename), 1)
from emp;
