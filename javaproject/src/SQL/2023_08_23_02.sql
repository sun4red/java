--2023-08-23


-- ���Ἲ ��������
-- ���̺� �������� �����Ͱ� �ԷµǴ� ���� ���� ���ؼ� ���̺��� ������ ��
-- �� �÷��� ���ؼ� �����ϴ� �������� ��Ģ
-- not null, unique, primary key, foregin key, check, default

-- 1. not null
-- null ���� ������� �ʴ´�.

drop table emp02 purge;

create table emp02(
empno NUMBER(4) not null,
ename varchar2(12)not null,
job varchar2(12),
deptno number(2) );

select * from emp02;
desc emp02;

-- �������ǿ� ������� �ʴ� ������ �Է�
insert into emp02 values(1111,'ȫ�浿', '�Ŵ���',30);

-- �������� (NOT NULL)�� ����Ǵ� ��
insert into emp02 values(null,'��','�Ŵ�',30);
insert into emp02(job, deptno) values ('�ԷºҰ�',30);


-- 2. unique ��������
-- ������ ���� �Է��� �� �ִ�.
-- �ߺ��� ���� �Է��� �� ����.
-- null ���� �Էµ� �� �ִ�.

drop table emp03 purge;

create table emp03 (
empno number(4) unique,
ename varchar(12) not null,
job varchar2(12),
deptno number(2) );

select * from emp03;

-- �������� ������

insert into emp03 values ( 1111, 'ȫ�浿' , '������' , 10);

-- ����Ǵ� ������

insert into emp03 values (1111, '�Է¾ȵ�', '�����', 20);

insert into emp03 values (null, 'ȫ','������',20);

-- 3. primary key (�⺻Ű) ��������
-- primary key = not null + unique
-- �ݵ�� �ߺ����� �ʴ� ���� �����ؾ��Ѵ�


select * from emp;


drop table emp05 purge;

create table emp05 (
empno number (4) primary key,   -- �ݵ�� �ߺ����� ���� ���� �Է�
ename varchar2(12) not null,       -- �ݵ�� ���� �Է�
job varchar2(12),
deptno number(2) );

select  * from emp05;

insert into emp05 values(1111,'ȫ�浿', '������',20);
insert into emp05 values(1111,'ȫ�浿', '������',20); -- unuque �������� ����
insert into emp05 values(null,'ȫ�浿', '������',20);    -- not null �������� ����


-- �������� �̸�(constraint name)�� �����ؼ� ���̺� ����
drop table emp04 purge;
create table emp04(
empno number(4) constraint emp04_empno_uk unique,
ename varchar2(10) constraint emp04_ename_nn not null,
job varchar2(10),
deptno number(2) );

select * from emp04;
desc emp04;

-- 4. foregin key (�ܷ�Ű) ��������
-- dept (�θ����̺�) - deptno(pk) : �θ�Ű : 10, 20, 30, 40
-- emp (�ڽ����̺�) - deptno(fk): �ܷ�Ű : 10, 20, 30

-- 1) ������̺� (EMP)deptno �÷��� foreign key ���������� �����Ǿ� �ִ�.
-- 2) foreign key ���������� ������ �ִ� �ǹ̴� �θ����̺�(DEPT)�� �θ�Ű(DEPTNO)�� ���� ����
-- 3) �θ�Ű�� �Ǳ� ���� ������ primary key�� unique ������������ �����Ǿ��־���Ѵ�.

-- ������̺�(EMP)�� ���ο� ���Ի���� ���
select * from emp;
insert into emp ( empno, deptno) values(1111, 50);

drop table emp06 purge;

create table emp06 (
empno number(4) primary key,
ename varchar2(10) not null,
job varchar2(10),
deptno number(2) references dept(deptno) ) ;

select * from emp06;
desc emp06;
insert into emp06 values(1111,'ȫ�浿','������',10);
insert into emp06 values(1122,'ȫ�浿','������',20);
insert into emp06 values(1123,'ȫ�浿','������',30);
insert into emp06 values(1134,'ȫ�浿','������',40);
insert into emp06 values(1135,'ȫ�浿','������',50);
insert into emp06 values(1136,'ȫ�浿','������',60);

-- 5. check ��������
-- �����Ͱ� �Էµ� �� Ư�� ������ �����ϴ� �����͸� �Էµǵ��� ������ִ� ��������


-- �޿� 500 ~  5000 
-- ���� M or F

create table emp07(
empno number(4) primary key,
ename varchar2(10) not null,
sal number(7,2) check(sal between 500 and 5000),
gender varchar2(1) check(gender in ('M','F')) );

select * from emp07;
insert into emp07 values(1111, '�浵��', 2000,'M');
insert into emp07 values(1112, 'ȫ�浿',30000,'M');
insert into emp07 values(1211, 'ų��', 1500,'X');

-- 6. DEFAULT ��������
-- ���������� ������ �÷��� ���� �Էµ��� ������, default�� ������ ���� �ڵ� �Է�

drop table dept01 purge;
create table dept01(
deptno number(2) primary key,
dename varchar2(12),
loc varchar(13) default 'SEOUL');


drop  table emp02 purge;

create table emp02(
empno number(4),
ename varchar2(15) not null,
job varchar2(10),
deptno number(4),
primary key(empno),
unique(job),
foreign key(deptno) references dept(deptno) );

-- ���������� ������ �� ���̺� ���� ��ĸ� ������ ���
-- 1. �⺻Ű�� ����Ű�� ����ϴ� ��� (�⺻Ű ���������� 2�� �̻� �����ϴ� ��)
-- 2. alter table ������� ���������� �߰��ϴ� ���

-- 1. 2�� �̻��� �÷��� �⺻Ű�� ����
drop table member01 purge;

-- 1) �÷� ���� ������� 2���� �÷��� primary key�� ����

create table member01(
id varchar2(20) primary key,
passwd varchar2(20) primary key);   -- �ȵȴ�.

-- 2) ���̺� ���� ���
 create table member01(
 id varchar2(20),
 passwd varchar2(20),
 primary key(id, passwd) );
 
 select * from member01;

-- 2. alter table ������� ���������� �߰��ϴ� ���
drop table emp01 purge;

-- �������� X
create table emp01(         -- primary
empno number(4),           -- not null
ename varchar2(15),
job varchar2(10),
deptno number(2) );

alter table emp01 add primary key(empno);
alter table emp01 modify ename not null;
alter table emp01 add unique(job);
alter table emp01 add foreign key(deptno) references dept;

select * from emp01;


alter table emp01 drop constraint SYS_C007039;
alter table emp01 drop primary key;

alter table emp01 drop constraint SYS_C007040;


