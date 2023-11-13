create user spring identified by spring123;
grant connect, resource to spring;


         create table myboard(
	  no number primary key,
	  writer varchar2(20),
          passwd varchar2(20),
	  subject varchar2(50),
	  content varchar2(100),
	  readcount number,
	  register date );

       create sequence myboard_seq
           start with 1
           increment by 1
           nocache;

select * from myboard;