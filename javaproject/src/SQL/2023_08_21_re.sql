-- ����

select * from emp;
select * from dept;

-- 1,���� �Ŵ����� ��� �̸� �μ��� ���

select ename, dname, job  from emp, dept where dept.deptno = emp.deptno and job = 'MANAGER';

-- 2. �Ŵ����� ŷ�� ������� �̸��� ����

select ename, job, mgr from emp where mgr
= (select empno from emp where ename = 'KING');

-- 3. SCOTT�� ������ �ٹ������� �ٹ��ϴ� ����� �̸�
select ename, deptno, loc from emp inner join dept using(deptno) where loc
= (select loc from dept where deptno
= (select deptno from emp where ename = 'SCOTT'));

select ename from emp where deptno
= (select deptno from dept where loc
= (select loc from dept where deptno
= (select deptno from emp where ename = 'SCOTT')));