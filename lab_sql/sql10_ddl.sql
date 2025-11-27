/*
 * SQL 문장의 종류:
 * 1. DDL(Data Definition Language): create, alter, truncate, drop
 * 2. DQL(Data Query Language): select
 * 3. DML(Data Manipulation Language): insert, update, delete
 * 4. TCL(Transaction Control Language): commit, rollback
 *
 * 테이블 생성하기:
 * create table 테이블이름 (
 *     컬럼이름 데이터타입 [[기본값] [제약조건]],
 *     ...
 * );
 *
 * 데이터 타입으로 사용되는 키워드들은 데이터베이스 종류에 따라서 다를 수 있음.
 * 오라클의 데이터 타입: number, varchar2(가변길이 문자열), date, timestamp,
 *                       clob(character large object), blob(binary large object), ...
 * 
 */


/*
 * 테이블 이름: ex_students
 * 컬럼:
 *   (1) stu_no: 아이디(학번). 숫자 타입(4자리 정수).
 *   (2) stu_name: 학생 이름. 문자열 타입(최대 10글자).
 *   (3) birthday: 학생 생일. 날짜 타입.
 */
 create table ex_students (
    stu_no number(4),
    stu_name varchar2(10 char),
    birthday date
 );
 
 
 /*
  * 테이블에 행(row)을 삽입(저장):
  * insert into 테이블이름 (컬럼이름, ...) values (값, ...);
  *
  * 테이블에 삽입하는 값들의 개수가 컬럼 개수와 같고, 값들의 순서가 테이블 컬럼 순서와 같으면,
  * insert into 테이블이름 values(값, ...);
  */
insert into ex_students (stu_no, stu_name, birthday)
values (1001, '홍길동', '2025/11/27');

-- 테이블의 모든 컬럼에, 테이블 컬럼 순서대로 값들을 삽입(저장)
insert into ex_students values (1002, '오쌤', '2000/12/01');

select * from ex_students;

-- insert into에서 컬럼 순서들은 테이블 컬럼 순서와 같아야 할 필요는 없음.
insert into ex_students (birthday, stu_name, stu_no)
values ('2010/01/01', 'Scott', 2000);
 
-- 제약조건이 없으면 테이블의 모든 컬럼에 값을 삽입할 필요는 없음.
insert into ex_students (stu_no, stu_name)
values (2001, 'King');

commit;
--> 커밋(commit): DB에서 작업한(변경한) 내용(들)을 영구적으로 저장.

-- insert into ex_students values (2002, '김길동');
--> ex_students 테이블의 컬럼은 3개인데, 삽입하려는 값은 2개 밖에 없어서 에러.

-- insert into ex_students values ('2025/11/27', 1234, '홍길동');
--> 테이블의 컬럼 순서와 삽입하려는 값들의 순서가 달라서(데이터 타입이 달라서)

-- insert into ex_students (stu_no) values (12345);
--> stu_no에 저장할 수 있는 자릿수(4자리)보다 큰 값을 삽입하려고 해서.


