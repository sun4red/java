--2023_08_17_02

select 10+20 from dept;

select 10+20 from emp;

-- ���̺� �ȿ��ִ� ������ ������ŭ ����Ѵ�.


select 10+20 from dual;
--  ���ڱ� ��𼭿Գ� dual ���̺���, sys ������ �����̴�.
-- dual ���̺��� sys ���� ������ ���̺��̰�, �������Ǿ�� �����Ǿ��ִ�.
-- dual ���̺��� ������ �Ǿ��ֱ� ������ ������ ����� �� �ִ�.
-- dual ���̺��� �����Ͱ� 1���ۿ� ���� ������ ���� ����� �ѹ��� ����ϰԵȴ�.

select 10+20 from sys.dual;
-- ������ ������ �������� ����������� ���Ǿ�� �Ǿ��ֱ� ������ �Է��ص� �������.

desc dual;
-- ����~ ��í2

select * from dual ;

select * from tab;
-- tab �� sys ������ ... �������Ǿ��.
select * from sys.tab;

select round(avg(sal),0) as "���" from emp group by deptno;

-- avs() : ���밪�� �����ִ� �Լ�
-- �Լ����� ��ҹ��ڸ� �������� �ʴ´�.
-- 


select -10, abs(-10), ABS(-10) from dual;

select log(2,4) from dual;

select floor(34.5534424) from dual;

select round (34.45646546546545) from dual;

select round(2362536.3355,-2) from dual;

select trunc(45295, -2), trunc ( 456.123465,3) from dual;
-- �ڸ��� ����


select mod(mod(150,19),7) from dual;


-- ��� ���̺��� �����ȣ�� Ȧ���� ������� ����ϴ� SQL��

select empno, ename from emp where mod(empno,2)=1 order by empno asc;

---------------------------------------------------
-- ����ó���Լ�
 select 'WWD', lower('WWD') from dual;
 
 select * from emp where job = 'manager';
select * from emp where job = upper('manager');

select initcap('go home') from dual;

select length('char len') from dual;

select lengthb('���ڿ�') from dual;
select length('���ڿ�') from dual;

-- ���� 1���� : 1Byte, �ѱ� 1���� : 3Byte (�����ǿ� ���� 2Byte�� ��찡 ����)


 select substr('��������ʹ���������ʹ�', 4,6) from dual;
 -- ù ���� ������ġ�� 1���̴�.
 -- ���� : substr(����ڿ�,������ġ,������ ���ڰ���)
 -- ������ġ�� (-)�� �Է��ϸ� �ڿ������� ���� (���⼺)
 select substr('��������ʹ���������ʹ�', -3,2) from dual;
 
 
-- ��� ���̺��� �Ի����� ��, ������ �����ϴ� SQL�� �ۼ�

select ename as "�̸�", substr(hiredate,1,2)as"��" ,substr(hiredate,4,2) as"��", substr(hiredate,7,2)as"��" from emp
order by hiredate asc;

--��� ���̺��� 87�⵵�� �Ի��� ����� �˻��ϴ� SQL�� �ۼ�

select * from emp where substr(hiredate,1,2) = 87;

--������̺��� ������� E�� ������ ����� �˻�

select * from emp where ename like '%E';
select * from emp where substr(ename,-1,1) = 'E';