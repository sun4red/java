--2023_08_18_02

-- �׷��Լ�
-- : �ϳ� �̻��� �����͸� �׷����� ��� ������ �����ϰ� �ϳ��� ����� ó�����ִ� �Լ�


select sum(sal) as "�μ��� �޿� ��" from emp group by deptno;

select * from emp;

select nvl(to_char(mgr),'X'), count(mgr) as "��������" from emp group by mgr order by mgr asc;

-- �׷��Լ��� ������ ���� ����� �� �ִ�.
-- �׷��Լ��� �Ϲ��÷��� ���� ����� �� ����.


select decode(deptno, '10', 'ȸ��', '20', '����', '30', '����') as "�μ�", to_char(round(avg(sal),0), 'l9,999') as "�μ��� ��� �޿�" from emp group by deptno;
select avg(comm) as "��� Ŀ�̼� �ݾ�" from emp where deptno=30;

-- max() : �ִ밪�� �����ִ� �Լ�

select decode(deptno, '10', 'ȸ��', '20', '����', '30', '����') as "�μ�", to_char(max(sal), 'l9,999') as "�μ��� �ְ� �޿�", to_char(round(avg(sal),0), 'l9,999') as "�μ��� ��� �޿�" from emp group by deptno;
select max(comm) from emp;

select max(hiredate) from emp;

select max(ename) from emp;

select min (sal) from emp where deptno = 10;
select min (sal) from emp where deptno = 20;
select min (sal) from emp where deptno = 30;

select min (hiredate) from emp;
select deptno, min (hiredate) from emp group by deptno;


--count (): �� ������ ���� 

select count(distinct(deptno)) as "�μ� ��" from emp;
select count(mgr) from emp; -- null���� counting ���� �ʴ´�.
select count(comm) from emp;


select deptno , count(empno) from emp group by deptno; -- empno �÷��� �⺻Ű ���������� ����
-- ���� primary Ű�� ������ ���� count�� ���� ���

select count(deptno) from dept;

select count(*) from emp;


-------------------------------------------------------

select count(distinct(job)) as "���� ����" from emp;


select count(job)*count(job)*max(sal)*min(sal)+round(avg(sal)) from emp;


select count(comm) from emp where deptno = 30 ;

-- group by  : Ư�� �÷��� �������� ���̺� �����ϴ� �����͸� �׷����� �����Ͽ� ���
-- �׷��Լ��� �Ϲ��÷��� ���� ����� �� ������, ���������� group by���� ���Ǵ�
-- �÷��� �׷��Լ��� ���� ����� �� �ִ�.


select 
    decode(deptno, '10', 'ȸ��', '20', '����', '30', '����') as "�μ�",
    count(ename) as "�����",
    count(comm) as "Ŀ�̼Ǽ����ο�" 
        from emp 
            group by deptno 
                order by deptno asc;




