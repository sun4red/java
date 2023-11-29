--2023_08_21

-- having ������
-- group by���� ���Ǵ� ��쿡 ������ ������ ���ϱ� ����
-- where ������ ��ſ� having���� ���� ����ؾ��Ѵ�.

-- ���μ��� ��� �ݾ��� 2000 �̻��� �μ��� ���

select deptno, round(avg(sal)) as "�޿� ���" from emp group by deptno having avg(sal)>=2000;

select deptno, max(sal) from emp group by deptno having max(sal) >= 2900 order by deptno asc;

-- ���� (join)
-- 2�� �̻��� ���̺��� �����ؼ� ������ ���ؿ��� ��.

-- scott ����� �Ҽӵ� �μ��� ���
-- 1) ������̺��� scott ����� �μ���ȣ�� ���Ѵ�
select deptno from emp where ename = 'SCOTT' ;
select dname from dept where deptno = '20';

-- Cross Join
select * from dept, emp;        -- 4 * 14 = 56���� ������ �˻�
select * from emp, dept;        -- 14 * 4 = 56���� ������ �˻�


-- 1. ����� (Equi Join)
-- �ΰ��� ���̺� ������ �÷��� �������� ���� �ϴ� ��.

select * from emp, dept where emp.deptno = dept.deptno;

-- JOIN��� 
select ename, dname, dept.deptno from dept, emp where dept.deptno = emp.deptno and ename = 'SCOTT';

-- �����÷��� ���̺�.�����÷��� �������� ����ؾ��Ѵ�.
-- �����÷��� �ƴ� �÷����� �տ� ���̺���� ������ �� �ִ�.


-- ���̺� ��Ī �ο��ϱ�

-- 1) ���̺� ���� ��Ī�� �ο��� �������ʹ� ���̺���� ����� �� ����.
--      ��Ī�� ����ؾ� �Ѵ�.
-- 2) ��Ī���� ��,�ҹ��ڸ� �������� �ʴ´�.
-- 3) �����÷�(deptno)�� ��Ī��.�����÷��� �������� ����ؾ��Ѵ�.
-- 4) �����÷��� �ƴ� �÷����� �տ� ��Ī���� ������ �� �ִ�.

select e.deptno , e.ename, d.dname from dept d, emp e where d.deptno = e.deptno and e.ename = 'SCOTT';

-- ���� �߻� select dept.deptno, e.ename, d.dname from dept d, emp e where..;


-- 2. �� ���� (Non-Equi Join)
-- �ΰ��� ���̺� ������ �÷����� �ٸ� ������ ����Ͽ� �����ϴ°�

-- ��� ���̺� �ִ� �� ������� �޿��� �� ��������� ����ϴ� sql�� �ۼ�
-- emp(sal) - salgrade(grade)

select sal from emp;
select * from salgrade;

select ename, sal, grade from emp, salgrade where sal >= losal and sal <= hisal;
select ename, sal, grade from emp, salgrade where sal between losal and hisal;

-- SelfJoin
-- �Ѱ��� ���̺� ������ �÷��� �÷� ������ ���踦 �̿��ؼ� �����ϴ� ��
-- ������̺��� �� ������� ��ϸ�� �Ŵ���(���ӻ��) �� ���

select employee.ename || '�� ���� ' || manager.ename
from emp employee, emp manager where employee.mgr = manager.empno;

-- 4. �ܺ����� (Outer Join)
-- ���������� �������� �ʴ� �����͸� ������ִ� ����
-- 1) ���̺��� ������ �� ��� ������ ���̺��� �����Ͱ� ����������,
--      �ٸ����̺� �����Ͱ� �������� �ʴ� ��쿡, �� �����Ͱ� ��µ����ʴ� ������ �ذ��ϱ� ���ؼ�
--      ���Ǵ� ���� ���
-- 2) ������ ������ ���� (+)�� �߰��Ѵ�.

-- �ܺ������� �̿��Ͽ� ŷ����� ���

select employee.ename as "�����", manager.ename as "���� ���"
from emp employee, emp manager where employee.mgr = manager.empno(+);

-- �μ����̺�� ������̺� Equi Join�� �ϸ� 40�� �μ��� ��µ�������

select ename, dept.deptno, dname from emp, dept 
where emp.deptno(+) = dept.deptno order by dept.deptno asc;
-- emp���̺��� 10,20,30 �μ���ȣ�� �ֱ� ������ ������ emp�ʿ� (+)ǥ��


-- ANSI JOIN    ANSI �̱� ǥ�� ��ȸ���� ����
-- ANSI Cross Join

select * from emp cross join dept;

-- ANSI Inner Join
-- ����ΰ� ���� �ǹ̸� �������ִ� ���ι��

select * from emp inner join dept on emp.deptno = dept.deptno;
-- scott ����� �Ҽӵ� �μ����� ����ϴ�....

select ename, dname from dept inner join emp on dept.deptno = emp.deptno where ename = 'SCOTT';
select ename, dname from dept inner join emp using (deptno) where ename = 'SCOTT';

-- using(�����÷�) 

-- ANSI Natural Join
-- �� ���̺��� �����÷��� ���ٴ� �ǹ̸� ������ �ִ�.
select * from emp natural join dept;



-- ANSI Outer Join
-- ���� : select * from table1 [left | right | full ] outer join table2;
-- left, right, full �� �ϳ� ���

create  table dept01 (deptno number(2), dname varchar2(14) );
insert into dept01 values (10, 'ACCOUNTING');
insert into dept01 values (20, 'RESEARCH');
select * from dept01;

create table dept02 (deptno number(2) , dname varchar2(14) );
insert into dept02 values(10, 'ACCOUNTING');
insert into dept02 values(20, 'SALES');
select * from dept02;

-- left outer join
select * from dept01 left outer join dept02 using(deptno);

-- right
select * from dept01 right outer join dept02 using(deptno);

select * from dept01 full outer join dept02 using(deptno);