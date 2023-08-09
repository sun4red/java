select * from tab; 	-- 테이블 목록
select * from seq; 	-- 시퀀스 목록
select * from CUSTOMER;
select count(*) from customer
select * from member;
select * from mem02;
select * from board;

-- 예 1.


create table customer( no number(4)  primary key, 
		       name varchar2(20),
		       email varchar2(20),
		       tel varchar2(20)
		       );
	
-- 예 2

alter table customer add(address varchar2(50));

alter table customer add(reg_date timestamp);
-- 타임스탬프 객체를 생성해서 

create sequence customer_no_seq
-- 1부터 계속 증가하기 위해서 1을 만들어둠
	start with 1
	increment by 1;


	
	
--	예 4
	
	
	
	create table member(name varchar2(20),
		    gender varchar2(10),
		    jumin1 varchar2(6),
                               jumin2 varchar2(7),
		    address varchar2(100),
		    buseo  varchar2(20),
                              sports varchar2(20),
                              music varchar2(20),
                              movie varchar2(20),
		    computer varchar2(20),
		    intro varchar2(1000)
		  );

		  
		  
--예 5 

		  create  table  mem02(id  varchar2(20)  primary key,
		  passwd  varchar2(20),
		  name  varchar2(20),
		  reg_date  date);
		  
		  
		  
		  
--게시판

		 create table board(
	no number primary key,
	writer varchar2(20) not null,
             passwd varchar2(20) not null,
	subject varchar2(100) not null,
	content varchar2(1000) not null,
	reg_date timestamp );

create sequence board_seq
start with 1
increment by 1;

