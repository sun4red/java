--2023-08-25 �׽�Ʈ


--[����1]  �Ʒ��� ���� ��ȸ����� �������� �־��� ���ǿ� �°� book ���̺��� �����Ͻÿ�? (20��)

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
values(1,'�׽�Ʈå','��','���ǻ�',3000);

--[����2]  Oracle �����ͺ��̽��� ���� ���� ��¥�� �⺻����(23/01/01)�� 
--����� ����(2023-01-01)���� ���ʷ� ����ϴ� SQL���� �ۼ��Ͻÿ�?  (20��)

select sysdate, to_char(sysdate,'yyyy-mm-dd') from dual;
	
--[����3]  ������̺�(EMP)���� �ִ� �޿��� �޴� ������, 
--�ִ�޿� �ݾ��� ����ϴ� SQL���� �ۼ��Ͻÿ�? (20��)

select * from emp;

select ename , sal from emp where sal = 
(select max(sal) from emp) ;

	
--[����4]  MySQL�� Oracle�� DB Migration�� �ϰ��� �Ѵ�.
--���̱׷��̼� �� ����� ���������� �Ʒ� ������ �ϼ��Ͻÿ�? (20��)

create table member_exam (
id number(6) primary key,
name varchar2(20) );

select * from member_exam;

-- 1) Oracle sequence ����
create sequence member_id_seq
start with 1
increment by 1;

-- 2) insert�� �ۼ�
insert into member_exam
(id, name)
values (member_id_seq.nextval, 'hong');


--[����5]  ������ ���̺��� ���� �� name, phone �÷��� �⺻Ű�� ������� �Ѵ�.
--composite key(����Ű) �̸�(Constraint)�� member_compo_pk�̸�, 
--�Ʒ� ���̺��� �ϼ��Ͻÿ�? (20��)

create table member_exam2 (
name varchar2(10),
address varchar2(30),
phone varchar2(16),
constraint member_compo_pk primary key(name,phone) );


