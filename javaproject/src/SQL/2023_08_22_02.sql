--2023_08_22

-- DML
-- insert into ���̺� (�÷�1, �÷�2, ...) values (������1, ������2...)

drop table dept01 purge;

create table dept01 as select * from dept where 1=0;

select * from dept01;

insert into dept01 (deptno, dname, loc) values ('10', 'ACCOUNTING' , 'SEOUL');

insert into dept01 values('20','RESEARCH' , 'DALLAS');

insert into dept01 values(30,'������','�̱�');

-- null�� �Է�

insert into dept01 (deptno, dname) values (40, '�߱�');
-- loc�÷� null��
insert into dept01 values (50, '��ȹ��',null);

-- 2) ���������� ������ �Է��ϱ�?
drop table dept02 purge;

create table dept02 as select * from dept where 1=0;
select * from dept02;

-- ���������� ������ �Է�
insert into dept02 select * from dept;
-- dept ���̺��� ������ �Էµ�
insert into dept02 select * from dept02;

-- insert all ��ɹ����� �������̺� ������ �Է�

create table emp_hir as select empno, ename, hiredate from emp where 1=0;
create table emp_mgr as select empno, ename, mgr from emp where 1=0;
select * from emp_hir;
select * from emp_mgr;

insert all 
into emp_hir values(empno, ename, hiredate)
into emp_mgr values(empno, ename, mgr)
select empno, ename, hiredate, mgr from emp where deptno = 20;

-- 2. update : ������ ����
-- ���� : update ���̺� set �÷�1 = ������ ��1, �÷�2 = ������ ��2...
-- where ������; where�������� ������������� ��� ���� ������Ʈ�� �ȴ�.

drop table emp01 purge;

create table emp01 as select * from emp;
select * from emp01;

update emp01 set deptno = 30;

-- �޿��λ� �η���
update emp01 set sal = sal * 1.1;

update emp01 set hiredate = sysdate;

drop table emp02 purge;

create table emp02 as select * from emp;
select * from emp02;

-- �޿��� 3000 �̻��� ����� �޿��� 10%�λ� ...
update emp02 set sal = sal * 1.1 where sal >= 3000;

-- 1987�⵵ �Ի��ڸ� �Ի����� ���÷� ����
update emp02 set hiredate = sysdate where hiredate between '1987/01/01' and '1987/12/31';

-- scott ����� �Ի����� ���� ��¥�� ����, �޿��� 50���� ���� Ŀ�̼��� 4000���� ����

update emp02 set hiredate = sysdate,  sal = 50 , comm = 4000 where ename = 'SCOTT';

-- ���������� �̿��� ������ ����
-- 20�� �μ��� ������(DALLAS)�� 40�� �μ��� ���������� ���� (BOSTON)

drop table dept02;
create table dept02 as select * from dept;
update dept02 set loc = (select loc from dept where deptno = '40') where deptno = '20'; 
select * from dept02;


--3. delete : ������ ����
-- ���� : delete from ���̺� where  ������;

-- 1) ��� ������ ���� : where �������� ������� �ʴ´�.

delete from dept01;
rollback;


-- merge :������ ���� 2���� ���̺��� �ϳ��� ���̺�� ��ġ�� ���
-- ������ �����ϴ� ���� ������ ���ο� ������ update,
-- 

select *from emp;

drop table emp02 purge;

create table emp02 as select * from emp where job='MANAGER';

select * from emp02;

update emp02 set job= 'TEST';

insert into emp02 values(8000, 'AHN', 'TOP', 7566,  '2023/08/22', 1200, 10, 20);

merge into emp01 using emp02 on (emp01.empno = emp02.empno)
when matched then update set emp01.ename = emp02.ename,
emp01.job = emp02.job,
emp01.mgr = emp02.mgr,
emp01.hiredate = emp02.hiredate,
emp01.sal = emp02.sal,
emp01.comm = emp02.comm,
emp01.deptno = emp02.deptno
when not matched then
insert values (emp02.empno, emp02.ename, emp02.job,emp02.mgr,emp02.hiredate,
emp02.sal,emp02.comm,emp02.deptno);

select * from emp01;






-- Ʈ�����(Transaction)
-- 1. ������ �۾�����
-- 2. ������ �۾��� DML (insert, update, delete)SQL������ ����
-- 3. �������� �ϰ����� �����ϸ鼭, �����͸� ���������� �����ϱ� ���ؼ� ����� �ȴ�.
-- 4. Ʈ������� All-or-Nothing ������� ó���� �ȴ�.

-- TCL(Transaction Control Language)
-- COMMIT : Transaction�� ����
-- ROLLBACK : Transaction�� ���
-- SAVEPOINT : ������ ����(������)�� �����ϴ� ����

-- �ǽ�

drop table dept01 purge;
create table dept01 as select * from dept;
select * from dept01;

-- 1. rollback : Ʈ����� ���
delete from dept01;

rollback;

-- 2. commit : Ʈ����� ����
-- �޸� �󿡼� ó���� DML SQL���� �����ͺ��̽��� ���������� �ݿ��ϰ� �ȴ�.

delete from dept01 where deptno = 20 ;

commit;

















