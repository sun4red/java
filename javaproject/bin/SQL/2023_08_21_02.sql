--2023_08_21_02

select dname from dept where deptno =
(select deptno from emp where ename = 'SCOTT');

select dname from dept, emp where dept.deptno = emp.deptno and ename = 'SCOTT';
select dname from dept inner join emp on dept.deptno = emp.deptno where ename = 'SCOTT';
select dname from dept natural join emp where ename = 'SCOTT';


-- 1. ������ ��������
-- 1) ���������� �˻������ 1���� ��ȯ�Ǵ� ����
-- 2) ���������� where ���������� �� �����ڸ� ����� �� �ִ�.
--      ( = . > . >= . < . <= , != )

 select ename, hiredate from emp where hiredate 
 = (select max(hiredate) from emp);
 
 select ename, sal from emp where sal
 = (select max(sal)from emp);
 
 select *from emp;
 
 -- ���ӻ�� ŷ
 select ename, sal from emp where mgr
 = (select empno from emp where ename = 'KING');
 
 
 -- 2. ������ ��������
 -- 1) ������������ ��ȯ�Ǵ� �˻� ����� 2�� �̻��� ��������
 -- 2) ���������� WHERE ���������� ������ ������ ��� (in, all, any ...)�� ����ؾ��Ѵ�.
 
-- <in ������>
-- ���������� �˻� ��� �߿��� �ϳ��� ��ġ�Ǹ� ���̵ȴ�.

select * from emp;
-- �޿� 3000�̻� �޴� ����� �Ҽӵ� �μ��� ������ �μ����� �ٹ��ϴ� ������� ����
select ename, deptno, sal from emp where deptno in
(select distinct deptno from emp where sal >= 3000);

-- <all ������>
-- ���������� �������� ���������� �˻� ����� ��� ���� ��ġ�Ǹ� ���̵ȴ�.

-- 30�� �μ��� �Ҽӵ� ��� �߿��� �޿��� ���� ���� �޴� ������� ������ �޿��� �޴� ����� �̸��� �޿����

-- ������ ��������
select deptno, ename, sal from emp where sal >
(select max(sal) from emp where deptno = '30') order by deptno asc;

-- ������ ��������
select deptno, ename, sal from emp where sal > all
(select sal from emp where deptno= '30');

-- �Ѵ� �ᵵ �Ǹ� ���������� ���� ���� ���� ����.

-- <any ������>
-- ���������� �� ������ ���������� �˻� ����� �ϳ� �̻� ��ġ�Ǹ� ���̵ȴ�.

-- �μ���ȣ�� 30�� ������� �޿��߿��� ���� ���� �޿� ���� �� ���� �޿��� �޴� �����
select ename, sal, deptno from emp where sal > any
(select sal from emp where deptno = '30') order by deptno asc;


-- DDL (Data Definition Language) : ������ ���Ǿ�
-- create : ���̺� ����
-- alter : ���̺� ���� ����
-- rename : ���̺� �̸� ����
-- drop : ���̺� ����
-- truncate : ������ ����

-- ���̺� ���
select * from tab;
select * from user_tables;

--1. create
-- �����ͺ��̽� ����, ���̺� ����

-- ���� : create table ���̺�� (�÷���1, ������Ÿ��1,  �÷���2, ������Ÿ��2, ....)


--  ����Ŭ�� ������ Ÿ��
-- 1) ���� ������
--      number(n) : ���� n�ڸ����� ����
--      number(n1,n2) : ��ü �ڸ���, n2 : �Ҽ��� ���Ͽ� �Ҵ�� �ڸ���

-- 2) ���� ������
-- char() : �������� ������, �ִ� 2000byte ���� ���� ����
-- varchar2() : �������� ������, �ִ� 4000byte ���� ���� ����
-- long : 2GB ���� ���� ����, long������ ������ �÷��� �˻������ �������� �ʴ´�.

-- 3) ��¥������
-- date : ��/��/�� ���� ����
-- timestamp : ��/��/�� ��:��:�� ���� ����