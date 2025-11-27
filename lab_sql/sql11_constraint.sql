/*
 * 제약조건(constraint): 데이터의 무결성을 유지하기 위한 조건들.
 * 1. primary key(PK, 고유키)
 *    - 테이블에서 유일한 1개의 행(row)을 선택할 수 있는 컬럼(들).
 *    - PK인 컬럼(들)은 null이 될 수 없고, 중복된 값을 가질 수 없음.
 * 2. not null(NN)
 *    - 반드시 값을 가져야만 하는 컬럼. null이 될 수 없는 컬럼.
 * 3. unique
 *    - 중복된 값을 가질 수 없는 컬럼. null은 여러개 있을 수 있음.
 * 4. check
 *    - 컬럼에 삽입되는 값들이 어떤 특정 조건을 만족해야만 하는 경우.
 *    - not null 제약 조건은 check의 특별한 경우. check (column is not null)
 * 5. foreign key(FK, 외래키)
 *    - 다른 테이블의 고유키(PK)를 참조하는 컬럼.
 *    - (예) dept 테이블 PK인 deptno를 참조하는 emp 테이블의 컬럼(deptno).
 */

-- 테이블을 생성 시 제약조건 만들기 1: 제약조건의 이름을 설정하지 않는 경우.
-- 오라클에서 제약조건 이름을 자동으로 만들어 줌. (예) SYS_C001234
create table ex_tbl1 (
    eno     number(4) primary key,
    ename   varchar2(10) not null,
    email   varchar2(20) unique,
    salary  number(9) check (salary >= 0),
    memo    varchar2(100)
);

insert into ex_tbl1
values (1004, '오쌤', 'jake', 1000000, '안녕하세요.');

commit;

select * from ex_tbl1;

-- 위 28줄의 insert 문장을 다시 실행시키면 primary key 위배로 에러가 발생.

-- insert into ex_tbl1 (ename) values ('홍길동');
--> PK 컬럼인 eno는 null이 될 수 없기 때문에 에러가 발생.

-- insert into ex_tbl1 (eno, ename) values (2001, null);
--> ename이 not null이라는 제약조건 위배

insert into ex_tbl1 (eno, ename) values (2001, '홍길동');
commit;

select * from ex_tbl1;

-- insert into ex_tbl1 (eno, ename, email) values (2002, '홍길동', 'jake');
--> email 컬럼이 unique라는 제약조건 위배.

-- insert into ex_tbl1 (eno, ename, salary) values (3000, '김길동', -100);
-- salary >= 0 이라는 체크 제약조건 위배.

-- 데이터 무결성: 테이블에 데이터를 삽입(insert)할 때 결점이 없는 데이터들만 입력될 수 있도록 유지 하는 것.


-- 테이블 생성 시 제약조건 만들기 2: 제약조건의 이름 설정.
-- (1) 컬럼을 선언하는 줄에서 제약조건 이름을 설정.
create table ex_tbl2 (
    /* 컬럼 선언과 함께 제약조건 이름/내용을 설정 */
    id      number(4) 
            constraint tbl2_pk_id primary key,
    name    varchar2(10) 
            constraint tbl2_nn_name not null,
    email   varchar2(20) 
            constraint tbl2_uq_email unique,
    salary  number(9) 
            constraint tbl2_ck_salary check (salary >= 0),
    memo    varchar2(100)
);

-- (2) 컬럼 선언 따로, 제약조건 선언 따로.
create table ex_tbl3 (
    /* 컬럼 선언부 */
    id      number(4),
    name    varchar2(10),
    email   varchar2(20),
    salary  number(9),
    memo    varchar2(100),
    
    /* 제약조건 선언부 */
    constraint tbl3_pk_id primary key (id),
    constraint tbl3_nn_name check (name is not null),
    constraint tbl3_uq_email unique (email),
    constraint tbl3_ck_salary check (salary >= 0)
);

