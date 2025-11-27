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
 
 
 
 
 
 
 
 
 

