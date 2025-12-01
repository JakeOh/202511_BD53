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
