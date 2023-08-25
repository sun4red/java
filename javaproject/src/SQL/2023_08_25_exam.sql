--2023-08-25 테스트


--[문항1]  아래와 같은 조회결과가 나오도록 주어진 조건에 맞게 book 테이블을 생성하시오? (20점)

create table book (
no number unique,
title varchar2(20) not null,
author varchar2(20),
publisher varchar2(20),
price number(5),
pub_day date default sysdate);

drop table book purge;
desc book;
select * from book;

insert into book (no, title, author, publisher, price)
values(1,'테스트책','미','출판사',3000);

--[문항2]  Oracle 데이터베이스를 통한 현재 날짜를 기본형식(23/01/01)과 
--사용자 형식(2023-01-01)으로 차례로 출력하는 SQL문을 작성하시오?  (20점)

select sysdate, to_char(sysdate,'yyyy-mm-dd') from dual;
	
--[문항3]  사원테이블(EMP)에서 최대 급여를 받는 사원명과, 
--최대급여 금액을 출력하는 SQL문을 작성하시오? (20점)

select * from emp;

select ename , sal from emp where sal = 
(select max(sal) from emp) ;

	
--[문항4]  MySQL을 Oracle로 DB Migration을 하고자 한다.
--마이그레이션 한 결과가 같아지도록 아래 내용을 완성하시오? (20점)

create table member_exam (
id number(6) primary key,
name varchar2(20) );

select * from member_exam;

-- 1) Oracle sequence 생성
create sequence member_id_seq
start with 1
increment by 1;

-- 2) insert문 작성
insert into member_exam
(id, name)
values (member_id_seq.nextval, 'hong');


--[문항5]  다음은 테이블을 만들 때 name, phone 컬럼을 기본키로 만들려고 한다.
--composite key(복합키) 이름(Constraint)은 member_compo_pk이며, 
--아래 테이블을 완성하시오? (20점)

create table member_exam2 (
name varchar2(10),
address varchar2(30),
phone varchar2(16),
constraint member_compo_pk primary key(name,phone) );


