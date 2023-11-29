--2023_08_17_01

select * from tab;

-- 1. and ������

select * from emp where deptno = 10 and job = 'MANAGER';


-- 2. or ������ : �� ���ǽ� �߿��� �Ѱ����� �����ص� �˻�

select * from emp where deptno =10 or job = 'MANAGER';

-- 3. not ������

select * from emp where not deptno = 10;


-- �޿� 2000~3000

select * from emp where sal>= 2000 and sal<=3000 ;

select * from emp where sal between 2000 and 3000;
-- where �÷���, between ������ and ū��

-- Ŀ�̼� 300 / 500 / 1400

select * from emp where comm = 300 or comm = 500 or comm = 1400;

-- �����ȣ

select * from emp where empno = 7521 or empno =  7654 or empno =  7844;
select * from emp where empno in(7521,7654,7844);



-- �޿� 2000�̸� 3000 �ʰ�

select * from emp where sal<2000 or sal >3000;
select * from emp where sal not between 2000 and 3000;


select * from emp where hiredate between '87/01/01' and '87/12/31';

-- in ������ : or �����ڸ� ����ؼ� ǥ���� �� ���ȴ�.
-- ���� : where �÷��� in (������1, ������2 ....)

select * from emp where comm != 300 and comm! = 500 and comm!=1400;
select * from emp where comm not in(300,500,1400);

select * from emp where hiredate like '87/%/%';
select * from emp where ename like 'F%';

--like ������ �� ���ϵ� ī�� : �˻������ ������ �� �����
-- ���� : where �÷��� like pattern(���ϵ� ī�� �̿�)

-- ���ϵ� ī��
-- 1. % : ���ڰ� ���ų� �ϳ� �̻��� ���ڿ� � ���� �͵� ����� ����
-- 2. _ : �ϳ��� ���ڿ� � ���� �͵� ����� ����.

select * from emp where ename like 'F___';

select * from emp where ename like '%S';

-- ����� N���� ������

select * from emp where ename like '%N';

select * from emp where ename like '%A%' order by ename asc;


select empno, ename, job from emp where ename like '_A%' order by empno asc;

select * from emp where ename not like '%A%';



select ename, sal*10 as "?" from emp;
select ename, sal*12+nvl(comm,0) as "Annsal" from emp;

select * from emp where mgr is null;
select * from emp where comm is not null;


select * from emp order by sal asc;

select * from emp order by sal;
-- �⺻ ���� ��� : ��������

select * from emp order by sal desc;

-- ��¥�����ͷ� ����

select * from emp order by hiredate desc;
select * from emp order by hiredate asc;

== null  �� ����

select ename, comm from emp order by comm asc;
select ename, comm from emp order by comm desc;
select ename, comm from emp where comm is null order by ename asc;

select ename, sal*sal*sal*sal*sal*sal*sal*sal*sal*sal*sal*sal*sal*sal*sal*sal*sal*sal*sal*sal*sal
*sal*sal*sal*sal*sal*sal*sal*sal*sal*sal*sal*sal*sal*1.71798691 as "ma" from emp;

-- ������ �÷� �׸��� �ι��� ����

-- �ѹ� ���� ���� �� ���� �� ����� ������ ��� �ѹ� �� ����
-- �ι�° ���� ������ �ѹ� ���� ���� �� ������ ����� ���� �����͸� �ι�° ���� ������ ������ �޴´�.
-- ��� �Խ����� ����� ��쿡 �ַ� ����Ѵ�.

-- 2�� ���� ����

-- ��� ���̺��� �Ի� �������� ��¼�� �Ҷ� ���������������

select * from emp order by hiredate asc, ename desc;


-- ��� ���̺��� �޿��� �������� ������������ ������ �Ѵ�. �̶� ������ �޿��� �޴� �������
-- ������������ �����ؼ� ����ϴ� SQL�� �ۼ�

select * from emp order by sal desc, ename asc;

-- ��� ���̺��� �μ� ��ȣ�� �������� �������� �����ϰ�, 
-- ������ �μ��� �Ҽӵ� ���� �Ի����� �������� ������������ �����ؼ� ���

select * from emp order by deptno asc, hiredate desc;

select deptno as "�μ� ��ȣ", sum (sal) as "�հ�", avg(sal) as "���" from emp group by deptno order by deptno asc;















