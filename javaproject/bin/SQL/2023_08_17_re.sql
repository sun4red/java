-- 2023_08_17 ����

-- 1) ������̺� ���� �Ի����� 4�ڸ� ������ ���

select * from emp;

select empno, ename, job, mgr, to_char(hiredate,'yyyy/mm/dd') as hiredate_ren, sal, comm, deptno from emp;

-- 2) ������̺��� MGR�÷��� ���� null�� �������� MGR�� ���� CEO�� ����ϴ� SQL���� �ۼ�

select empno, ename, to_char('CEO') as "CEO" from emp where mgr is null;
-- ?

select empno, ename, nvl(to_char(mgr),'CEO') as MGR_ren  from emp;