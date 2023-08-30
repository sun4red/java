--2023-08-25

select rownum, rnum, ename, hiredate from (
select rownum rnum, ename, hiredate from(
select * from emp order by hiredate asc) )
where rnum >= 3 and rnum<=5;


select rownum, rnum, empno, ename from(
select rownum rnum, empno, ename from(
select * from emp order by empno asc) )
where rnum between 3 and 5 ;

-- 시퀀스 seq 공개동의어
-- 테이블에 숫자를 자동으로 증가시켜주는 역할 최대 10^27까지?
-- mysql과 다름 (auto increment)

select * from seq;

create sequence dept_deptno_seq
start with 10           -- 시작할 번호 값
increment by 10;      -- 증가치

-- 시퀀스 목록
select * from user_sequences;


-- 단독으로 사용되지않고 테이블의 번호값으로 들어가게되니 이름을 잘 지어줘야한다.
-- 보통 테이블명 포함

select dept_deptno_seq.nextval from dual;
select dept_deptno_seq.currval from dual;

drop table emp01 purge;
create table emp01 (
empno number(4) primary key,
ename varchar2(10),
hiredate date);

-- 1부터 1씩 증가되는 시퀀스 생성
create sequence emp01_empno_seq;

select * from seq;
select * from tab;

insert into emp01 values(
emp01_empno_seq.nextval,'홍길동',sysdate);

select*from emp01;


create table dept_example(
deptno number(2) primary key,
dname varchar2(15),
loc varchar2(15) );

create sequence dept_example_seq
start with 10
increment by 10;

select * from tab;
select * from seq;

insert into dept_example values(dept_example_seq.nextval,'인사과','서울');
insert into dept_example values(dept_example_seq.nextval,'경리과','서울');
insert into dept_example values(dept_example_seq.nextval,'총무과','대전');
insert into dept_example values(dept_example_seq.nextval,'기술과','인천');

select * from dept_example;

drop sequence dept_deptno_seq;

create sequence dept_deptno_seq
start with 10
increment by 10
maxvalue 30;

select * from seq;
select dept_deptno_seq.nextval from dual;
select dept_deptno_seq.currval from dual;

alter sequence dept_deptno_seq maxvalue 1000;

-------------------------------------------------
-- index 빠르게 검색하기위해 사요되는 객체
select * from user_indexes;

-- 기본키로 설정된 컬럼은 자동으로 고유 인덱스로 설정이 된다.


-- 인덱스 실습 검색속도 차이

drop table emp_01 purge;
create table emp_01 as select * from emp;

insert into emp_01 select * from emp_01;

insert into emp_01(empno, ename)
values(1111, 'sss');

set timing on;

select * from emp_01 where ename = 'sss';
create index idx_emp01_ename on emp_01(ename);
drop index idx_emp01_ename;

select * from user_indexes;

-- 인덱스 종류
-- 고유 인데스 : 중복된 데이터가 없는 컬럼에 적용할 수 있는 인덱스
-- 비고유 인덱스 : 중복된 데이터가 있는 컬럼에 적용할 수 있는 인덱스

-- 
drop table dept01 purge;

create table dept01 as select * from dept where 1=0;

insert into dept01 (deptno, dname, loc) values (10,'총무과','서울');
insert into dept01 (deptno, dname, loc) values (20,'인사과','미국');
insert into dept01 (deptno, dname, loc) values (30,'생산과','북한');
insert into dept01 (deptno, dname, loc) values (40,'사과','북한');
insert into dept01 (deptno, dname, loc) values (50,'애플','북한');

select * from dept01;

-- 고유 인덱스

create unique index idx_dept01 on dept01(deptno);
select * from user_indexes;

-- 고유인덱스 설정된 deptno컬럼에 중복데이터입력


create index idx2_dept01 on dept01(loc);

-- 비고유인덱스





--6. 결합 인덱스, 2개이상의 컬럼으로 만들어진 인덱스
create index idx_dept01_com on dept01(deptno, dname);

--함수기반인덱스 : 수식이나 함수를 적용하여 만드는 인덱스
create index idx_emp01_annsal on emp(sal*12 + nvl(comm,0));