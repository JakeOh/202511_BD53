/*
 * OECD 국가 연평균 근로 시간
 * 연평균_근로시간_OECD.xlsx 파일의 테이블을 데이터베이스에 저장, 분석.
 * (1) create table
 * (2) data import
 * (3) select
 */

-- 엑셀(xlsx) 파일의 내용을 저장할 수 있는 테이블 생성
-- 테이블 이름: work_times
-- 컬럼 이름: country, y2014, y2015, y2016, y2017, y2018
create table work_times (
    country varchar2(60),
    y2014   number(4),
    y2015   number(4),
    y2016   number(4),
    y2017   number(4),
    y2018   number(4)
);


-- [접속 패널] -> work_times 테이블 오른쪽 클릭 -> 데이터 임포트

select * from work_times;

-- 우리나라(한국)의 연평균 근로시간을 출력
select * from work_times where country = '한국';
--> 결과 행이 1개도 없음. 국가 이름 앞에 공백들이 포함되어 있기 때문에.

select * from work_times where country like '%한국%';
--> 결과 행이 1개.

-- country 컬럼의 국가 이름들에서 공백들을 모두 제거하고 업데이트.
select trim('    hello sql    ') from dual;
--> trim(): 문자열의 시작과 끝에 있는 모든 공백들을 제거.

select trim(country) from work_times;
--> 엑셀에서 임포트한 공백들이 잘리지 않음.

select substr(country, length('　　　') + 1) from work_times;

update work_times
set country = substr(country, length('　　　') + 1);

rollback;

select replace('   hello', ' ', '') from dual;

select replace(country, '　', '') from work_times;

-- 정규 표현식(regular expression) 문자열 대체
select regexp_replace(country, '[[:space:]]', '') from work_times;

update work_times
set country = regexp_replace(country, '[[:space:]]', '');

select * from work_times;

commit;

select * from work_times where country = '한국';


-- 2018년에 한국의 평균 근로시간보다 근로시간이 더 많은 국가들.

-- 2018년의 평균 근로시간 상위 5개 국가들.
