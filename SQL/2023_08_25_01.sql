--2023-08-25

select rownum, rnum, ename, hiredate from (
select rownum rnum, ename, hiredate from(
select * from emp order by hiredate asc) )
where rnum >= 3 and rnum<=5;


select rownum, rnum, empno, ename from(
select rownum rnum, empno, ename from(
select * from emp order by empno asc) )
where rnum between 3 and 5 ;

-- ������ seq �������Ǿ�
-- ���̺� ���ڸ� �ڵ����� ���������ִ� ���� �ִ� 10^27����?
-- mysql�� �ٸ� (auto increment)

select * from seq;

create sequence dept_deptno_seq
start with 10           -- ������ ��ȣ ��
increment by 10;      -- ����ġ

-- ������ ���
select * from user_sequences;


-- �ܵ����� �������ʰ� ���̺��� ��ȣ������ ���ԵǴ� �̸��� �� ��������Ѵ�.
-- ���� ���̺�� ����

select dept_deptno_seq.nextval from dual;
select dept_deptno_seq.currval from dual;

drop table emp01 purge;
create table emp01 (
empno number(4) primary key,
ename varchar2(10),
hiredate date);

-- 1���� 1�� �����Ǵ� ������ ����
create sequence emp01_empno_seq;

select * from seq;
select * from tab;

insert into emp01 values(
emp01_empno_seq.nextval,'ȫ�浿',sysdate);

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

insert into dept_example values(dept_example_seq.nextval,'�λ��','����');
insert into dept_example values(dept_example_seq.nextval,'�渮��','����');
insert into dept_example values(dept_example_seq.nextval,'�ѹ���','����');
insert into dept_example values(dept_example_seq.nextval,'�����','��õ');

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
-- index ������ �˻��ϱ����� ���Ǵ� ��ü
select * from user_indexes;

-- �⺻Ű�� ������ �÷��� �ڵ����� ���� �ε����� ������ �ȴ�.


-- �ε��� �ǽ� �˻��ӵ� ����

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

-- �ε��� ����
-- ���� �ε��� : �ߺ��� �����Ͱ� ���� �÷��� ������ �� �ִ� �ε���
-- ����� �ε��� : �ߺ��� �����Ͱ� �ִ� �÷��� ������ �� �ִ� �ε���

-- 
drop table dept01 purge;

create table dept01 as select * from dept where 1=0;

insert into dept01 (deptno, dname, loc) values (10,'�ѹ���','����');
insert into dept01 (deptno, dname, loc) values (20,'�λ��','�̱�');
insert into dept01 (deptno, dname, loc) values (30,'�����','����');
insert into dept01 (deptno, dname, loc) values (40,'���','����');
insert into dept01 (deptno, dname, loc) values (50,'����','����');

select * from dept01;

-- ���� �ε���

create unique index idx_dept01 on dept01(deptno);
select * from user_indexes;

-- �����ε��� ������ deptno�÷��� �ߺ��������Է�


create index idx2_dept01 on dept01(loc);

-- ������ε���





--6. ���� �ε���, 2���̻��� �÷����� ������� �ε���
create index idx_dept01_com on dept01(deptno, dname);

--�Լ�����ε��� : �����̳� �Լ��� �����Ͽ� ����� �ε���
create index idx_emp01_annsal on emp(sal*12 + nvl(comm,0));