--2023_08_22 ����

select * from emp;


-- 1. SMITH�� ������ ������ ���� ����� �̸�, ���� ���

select ename, job from emp where job = (select job from emp where ename = 'SMITH');

-- 2. ���� SALESMAN�� ������� �ִ�޿����� ���̹޴� ������� �̸�, �޿� ����ϵ� 
--      �μ���ȣ 20�� ���� (all������ �̿�)

select ename, sal from emp
where deptno != '20' 
and sal > all  (select sal from emp where job = 'SALESMAN');


-- 3. ���� SALESMAN�� ����� �޴� �޿����� �ּ� �޿����� ���� �޴� ������� �̸��� �޿� ���, 
--      �μ���ȣ 20�� ����

select ename, sal from emp
where sal > any(select sal from emp where job = 'SALESMAN')
and deptno !=20;