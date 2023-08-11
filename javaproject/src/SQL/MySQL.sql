select * from board;
select * from customer;

-- 오라클이랑 다르다
-- auto_increment : 1부터 1씩 증가된 값을 자동으로 입력

create table customer( no int(4) auto_increment primary key, 
		       name varchar(20),
		       email varchar(20),
		       tel varchar(20),
		       address varchar(50),
		       reg_date timestamp
		       );

		       
		       
		       
		       
		       drop table board;
		       describe board; -- 테이블 구조 확인
		       
		       
	create table board(
	no int(4) auto_increment primary key,
	writer varchar(20) not null,
    passwd varchar(20) not null,
	subject varchar(100) not null,
	content varchar(1000) not null,
	reg_date timestamp );

