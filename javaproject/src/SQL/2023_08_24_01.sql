--2023-08-24










-- 1. �θ����̺� ����


drop table dept01 purge;

create table dept01(
deptno number(2) primary key,
dname varchar2(14),
loc varchar2(13));

insert into dept01 values (10, 'ACCOUNTING', 'NEW YORK');
select * from dept01;

-- 2. �ڽ� ���̺� ����

drop table emp01 purge;

create table emp01(
empno number(4) primary key,
ename varchar2(10) not null,
job varchar2(10) unique,
deptno number(2) references dept01(deptno) );

insert into emp01 values(1111, 'ȫ�浿', '������' , 10 );
select * from emp01;

-- ���� �Ұ�
delete from dept01;
rollback;

-- 4. �ڽ����̺��� �ܷ�Ű �������� ��Ȱ��ȭ
-- �θ����̺��� �����͸� �����ϱ����ؼ� �ڽ����̺��� �ܷ�Ű ���������� ��Ȱ��ȭ

alter table emp01 disable constraint SYS_C007047;
alter table emp01 enable constraint SYS_C007047;

-- cascade

-- 1. cascade �ɼ��� �ٿ� �θ����̺��� ���������� ��Ȱ��ȭ ��Ű�� �����ϰ��ִ�
-- �ڽ����̺��� �ܷ�Ű �������ǵ� ���� ��Ȱ��ȭ
alter table dept01 disable constraint SYS_C007043 cascade;

-- 2. cascade �ɼ��� �ٿ��� �θ����̺��� primary key�� �����ϸ�,
-- �����ϴ� �ڽ����̺��� foregin key �������ǵ� ���� ������ �ش�.
alter table dept01 drop constraint SYS_C007043 cascade;

alter table dept01 add primary key(deptno);
alter table emp01 add foreign key(deptno) references dept01(deptno);

alter table dept01 drop primary key cascade;

drop table dept01 purge;
create table dept01(
deptno number(2) primary key,
dname varchar2(14),
loc varchar2(13));

create table emp01(
empno number(4) primary key,
ename varchar2(10) not null,
job varchar2(10) unique,
deptno number(2) references dept01(deptno) on delete cascade);
-- �θ����̺��� �����Ͱ� �����Ǹ� �ڽ� ���̺��� �����͵� ��������


-- �� VIEW �⺻���̺��� �̿��ؼ� ������� ���� ���̺�
-- �ǽ��� ���� �⺻���̺� ���� dept_copy, emp_copy
-- 2���� �⺻ ���̺� ����

create table dept_copy as select * from dept;
create table emp_copy as select * from emp;

select * from tab;
select * from dept_copy;
select * from emp_copy;

create view emp_view30
as
select empno, ename, deptno from emp_copy
where deptno = 30;

select * from emp_view30;

-- �信 insert�� ������ �Է� ���� ��쿡, �⺻ ���̺��� �ԷµǴ���
insert into emp_view30 values(1111,'�浿','30');

-- �ȴ�.

-- �ܼ��� / ���պ�

-- �ܼ��� 
create view emp_view20 as select empno, ename, deptno, mgr from emp_copy
where deptno = 20;

select * from emp_view20;

-- ���պ�
create view complex_view as select empno, ename, dept_copy.deptno, dname
from emp_copy, dept_copy
where emp_copy.deptno = dept_copy.deptno;

select * from complex_view;

create view sal_view as select dname, max(sal) as max, min(sal) as min
from emp_copy, dept_copy
where emp_copy.deptno = dept_copy.deptno
group by dname;

select * from sal_view;

-- �� ���� �ɼ�

-- 1. or replace �ɼ�
-- ������ �䰡 �������� ������ �並 �����ϰ�, ���Ͽ� ������ �̸��� ���� �䰡 �����ϸ�
-- ���� ������ �����ϵ��� ������ִ� �ɼ�

-- 1) or replace �ɼ� ���� ������ �� ���� �� ���� �߻�

create view emp_view30
as
select empno, ename, deptno, sal, comm from emp_copy
where deptno = 30;

-- 2) or replace �ɼ��� �ٿ��� ������ �並 ����
create or replace view emp_view30
as
select empno, ename, deptno, sal, comm from emp_copy
where deptno = 30;

select * from emp_view30;

-- 2. with check option
-- where ���� ���� ���� ���� �������� ���ϵ��� ������ִ� �ɼ�

-- 1) with check option ������� ���� ���
-- 2) with check option ����� ���

create or replace view emp_view30
as select empno, ename, deptno, sal, comm 
from emp_copy where deptno=30;

create or replace with check opt view emp_view30
as select empno, ename, deptno, sal, comm 
from emp_copy where deptno=30;


-- �޿� 30, �μ���ȣ 30������ 20

update emp_view30 set deptno = 20 where sal >== 1200

drop table emp_copy purge;
create table emp_copy as select from emp;

create or replace view emp_view30
as select empno, ename, deptno, sal, comm from emp_copy where deptno = 30
with check option;

-- 3. with read only 
-- �б������� �並 ������ִ� �ɼ�
-- �並 ���ؼ� �⺻���̺��� ������ �������� ���ϵ��� ������ִ� ����

create or replace view view_read30
as select empno, ename, sal, comm, deptno from emp_copy
where deptno=30 with read only;

select * from view_read30;
select * from user_views;

-- ������ �� ����

update view_read30
set sal = 3000;

-- rownum �÷�
-- 1. �������� �˻� ������ �������ִ� ������ �÷��̴�.
-- 2. rownum ���� 1������ ���۵ȴ�.
-- 3. rownum ���� order by ���� �����ϴ��� ���� �ٲ��� �ʴ´�.
-- 4. rownum ���� �����ϱ� ���ؼ��� ���̺��� �����ؾ��Ѵ�.


select rownum, rowid, deptno, dname, loc from dept;
-- ���� ������ �ʾ����� �ڵ������� ��ȣ

select rownum, ename, sal from emp;
select rownum, ename, sal from emp where ename = 'WARD';

select rownum, ename, sal from emp order by sal desc;
-- order by ���ε� ���� �ٲ��� ����

-- �Ի��� ���� 5�� �⸴

select ename, hiredate from emp order by hiredate asc;

-- 2) �����

create or replace view hire_view
as select empno,ename,hiredate from emp order by hiredate asc;

--3) ���
select rownum, ename, hiredate from hire_view;

-- �ϼ�
select rownum, ename, hiredate from hire_view where rownum <=5 ;

-- 4) �ζ��κ� = ���������� ������� ��

select rownum, ename, hiredate from (
select empno, ename, hiredate from emp order by hiredate asc)
where rownum <= 5 ;


select rownum, empno, ename from(
select empno, ename from emp order by empno asc)
where rownum <=5 ;

-----------------------------------------------------------
select rownum, empno, sal from(
select empno, sal from emp order by sal desc)
where rownum <= 5 ;





