--2023-08-28 �׽�Ʈ

--[����1]  ��� ���̺�(EMP)����  SCOTT�� �޿����� ���� �޴� ����� �̸�, 
--�޿��� ����ϴ� SQL���� �ۼ��Ͻÿ�? (10��)

select ename, sal from emp where sal <
    (select sal from emp where ename = 'SCOTT');
	
--[����2]  ��� ���̺�(EMP)���� �� �μ��� ��� �޿��� ���ϴ� 
--SQL���� �ۼ��Ͻÿ�? (10��)

select deptno, avg(sal) from emp group by deptno;

	
--[����3]  ������̺�(EMP)����  ����� A�� ���Ե� ����� �˻��ϴ� 
--SQL���� �ۼ��Ͻÿ�? (10��)

select ename from emp where ename like '%A%';

	
--[����4]  ������̺�(EMP)���� �޿��� ���� �޴� ���  5���� ���ϴ� SQL���� 
--�ζ��κ�� �ۼ��Ͻÿ�? (10��)

select ename, sal from
    (select rownum, ename, sal from emp order by sal desc)
    where rownum <=5;


	
--[����5]  ������̺�(EMP)���� 82�⵵�� �Ի��� ��� ����� ������ ����ϴ� 
--SQL���� �ۼ��Ͻÿ�? (10��)


select * from emp where to_char(hiredate,'yy') = '82';


	
--[����6]  ������̺�(EMP)���� ���, �̸�, �޿�, ������ ��ȸ�ϴ� 
--SQL������ �ۼ��Ͻÿ�? (10��)

--��, ������ ��Ī�� ����ϰ�, comm�� null���� ��쿡�� 0���� ���� ó���Ͻÿ�.

select empno, ename, sal, sal*12+nvl(comm,0) ysal from emp;


--[����7]  �Ʒ��� �������� �䱸�ϴ� SQL���� ���� �ۼ��Ͻÿ�?  (10��)

--1) �Ʒ��� ������ ����ǿ� �Ի��� ���Ի������ ���ο� ������ �����Ͻÿ�.
--    ������ : myuser ,  ��й�ȣ : tiger
--2) ������ �������� ������ ���� �� ���̺�, �並 ������ �� �ִ� ������ 
--    ���� ��(role)�� �����ؼ� ������ �ο��Ͻÿ�.

--1)
create user myuser identified by tiger;
--2)
create role my_role;
grant create session, create table, create view to my_role;


	
--[����8]  �Ʒ��� ������ ���� ���������� �����ϴ� ���̺��� ���� �ۼ��Ͻÿ�? (30��)

create table Book (
bookid number(2) primary key,
bookname varchar(40),
publisher varchar(40),
price number(8)
);

create table Customer (
custid number(2) primary key,
name varchar(40),
address varchar(50),
phone varchar(20)
);

create table Orders (
orderid number(2) primary key,
custid number(2) references Customer(custid),
bookid number(2) references "Book"(bookid),
saleprice number(8),
orderdate date
);



