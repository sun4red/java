--2023_08_22

select * from emp;

create table emp02 as select * from emp;

select * from emp02;

-- ���ϴ� �÷����� ������ ���纻 ���̺�
create table emp03 as select empno, ename from emp;

select * from emp03;

-- ���ϴ� ������ ������ ���纻 ���̺�
create table emp04 as select  * from emp where deptno = 10;
select * from emp04;

-- ���̺� ������ ����
create table emp05 as select * from emp where 1=0;
select * from emp04;

-- alter
-- ���̺� ���� ���� (�÷��߰�, �÷�����, �÷�����)
-- 1) �÷� �߰�
alter table emp02 add(job2 varchar2(10));
desc emp02;

-- 2) �÷� ����
--      i) ������ �÷��� �����Ͱ� ���� ���
--          ������ �÷��� ������ Ÿ�� ���� ����
--          �÷��� ũ�⵵ ������ ����
--      ii) ������ �÷��� �����Ͱ� �ִ� ���
--          �÷��� ������ Ÿ���� ������ �� ����.
--          �÷��� ũ��� �ø����� ������ ���� ����� ������ ũ�⺸�� ���� ũ��� ���� �Ұ�

alter table emp02 modify(job2 varchar2(30));
desc emp02;

-- 3) �÷� ����
alter table emp02 drop column job2;
alter table emp02 drop(job2);

-- 3. rename
-- ���̺� �̸� ����
-- ���� : rename old_name to new_name;

rename emp02 to emp021;
select * from emp021;
select * from emp02;

-- 4. truncate
-- ���̺��� ��� �����͸� ����
-- ���� : truncate table table_name;
truncate table emp021;
select * from emp021;

-- 5. drop
-- ���̺� ����
drop table emp021;  -- �̷��� �ϸ� �ӽ����̺�� ��ü (����Ŭ 10g���� ����)
select * from emp021;
drop table emp03 purge; --������ ����
select * from emp03;
select * from tab;

-- �ӽ� ���̺� ����
purge recyclebin;

-- (user �� �ۼ��ϸ� ���� ������ ���� ��ȸ)
select * from user_views;
select * from user_sequences; 

select * from user_tables;
select * from user_indexes;


-- �����ͺ��̽� ������(DBA)�� ������ �� �ִ� ��ü�� ���ؼ�
select table_name from dba_tables; (DBA������ ��� ����)

-- ����Ŭ �ý����� ��� ���� ���� �˻�
select user_name from dba_users;