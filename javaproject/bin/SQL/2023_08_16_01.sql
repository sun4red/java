--2023_08_16

select * from tab;


select * from salgrade;

describe dept;
desc dept;

select * from mem02;

select * from customer where name = '��ȫŴ';


select * from dept;

-- sql���� ��ҹ��ڸ� �������� �ʴ´�.


desc emp;

select * from emp;

select * from emp where empno >= 7600;

select * from emp where job = 'MANAGER';

-- ����Ŭ�� ������ Ÿ��
-- 1. ���ڵ�����
-- number(n) : number(2) ���� 2�ڸ����� ����
-- number(n1, n2) : n1 - ��ü �ڸ���, n2 - �Ҽ����� �Ҵ�� �ڸ���

-- 2. ���ڵ�����
-- char() : ���� ���� ������, �ִ� 2000byte ���� ���� ������
-- varchar2() : �������̹�����, �ִ� 4000byte���� ���� ������
-- long : 2gb���� ���� ����, �˻���� ���������ʴ´�, �ʹ� ŭ

-- 3. ��¥������
-- date : ��/��/�� ���� ����
-- timestamp : ��/��/�� ��:��:��;

select *  from dept;

select sal + comm from emp;
select sal *100 from emp;

-- null
-- 1. �������� ���� ���� �ǹ�
-- 2. null ���� ��� ������ �� �� ����.
-- 3. null ���� ��
-- emp


select ename, job, sal, comm, sal*12, sal*12+nvl(comm,0) from emp;

-- NVL(�÷�, ��ȯ�� ��) : NULL���� �ٸ���(0)���� ��ȯ���ִ� ����

-- ��Ī �ο� : as "��Ī��"

select ename, sal*12+nvl(comm,0) as "Annsal" from emp;

select ename, sal*12+nvl(comm,0) Annsa from emp;    -- as, "" ���� ����

select ename || '�� ����  ' || sal from emp;
-- ����Ǽ� �Ѱ��� �÷����� ���


-- distinct �ߺ� �� ����, 1���� ���

select distinct deptno from emp;

select distinct job from emp;

-- emp ���̺��� �ߺ��� ������ job�ǰ���

select count(job) from emp;


select count(distinct job) from emp;

== �񱳿����� ( = , > , >- , <, <=, !=, ^=, <>)
-- where ���� ��

-- 1. ���� ������ �˻�
-- 2. ���� ������ �˻�
-- 3. ��¥ ������ �˻�


select * from emp where sal >= 3000;

select * from emp where ename = 'FORD';
-- ���� ������ �˻� �� '' �ٿ���� �Ѵ�.

select empno, ename, sal from emp where ename = 'SCOTT';

select * from emp where hiredate >= '82/01/01';
-- ��¥������ �˻�, ������ �� �쿡 '' �Է�
-- ��¥������ �� �� �񱳿����� ���

select * from emp where hiredate >= '1982/01/01' order by hiredate asc;


