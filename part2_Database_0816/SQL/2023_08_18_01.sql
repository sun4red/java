--2023_08_18_01

-- instr ���ڿ� �� Ư�� ���� ��ġ ���ϴ� �Լ�


select instr('jeepgagoshpda', 'g') from dual;
select instr('jeepgagoshipda', 'p', 5, 1) from dual;
-- instr(���, ã������, ������ġ, ���° �߰�)

select instr ('Welcome to oracle','o',6,2) from dual;

-- ������̺��� ������� 3��° �ڸ��� R�� �Ǿ��ִ� ����� �˻�

select * from emp where ename like '__R%';

select * from emp where instr(ename,'R',3,1) =3;

select * from emp where substr(ename,3,1)= 'R';




select rpad('oracle' ,  20 ,  '#' ) from dual;
-- 20���ڱ��� ���ڶ� �ڸ��� Ư�� ��ȣ�� ä���ش�.

select ltrim (' oracle ') from dual;
-- ���� ���� ����
select rtrim (' oracle ') from dual;
-- ������ ���� ����
select trim (' oracle ') from dual;
-- �¿� ���� ����
select trim ('       o r a c l e           ') from dual;


select trim ('a' from 'aaaaaoracleAAAAAaaaaA') from dual;
-- �� ���� Ư�� ���� ����



select to_char(sysdate, 'yyyy"��"mm"��"dd"��"') from dual;

-- ��� ���̺��� �� ������� ������� �ٹ��� �ϼ�
select ename as "�����", to_char(hiredate, 'yyyy"��"mm"��"dd"��"') as "�Ի���",
trunc(sysdate-hiredate) as �ټ��ϼ� from emp order by hiredate asc;

select ename as "�����", to_char(hiredate, 'yyyy"��"mm"��"dd"��"') as "�Ի���", 
trunc(months_between(sysdate, hiredate)) as "�ټӿ���" from emp order by hiredate asc;
-- ���� ��¥�� ���� ��¥�κ��� ����� �� ��

select add_months(sysdate,3) from dual;
-- ���� ��¥�� ����� ���� ��

select add_months('23/07/11', 6) from dual;

-- next_day : �ش� ������ ���� ����� ��¥�� �����ִ� �Լ� 
-- ���� : next_day(date,����)

-- ������ �������� ���� ����� �����

select next_day(sysdate, '�����') from dual;
select last_day(sysdate) from dual;

select ename, hiredate, last_day(hiredate) from emp order by hiredate asc;

select ename, hiredate, to_char(last_day(hiredate), 'yy"��"mm"�� ���� : "dd"��"') from emp order by hiredate asc;

select to_char(hiredate, 'yy"��" mm"��"')as "�� ��", to_char(hiredate,'yy')*to_char(hiredate,'mm') as "��*��" from emp;

--1. to_char():��¥��, ������ �����͸� ���������� ��ȯ���ִ� ����ȯ
-- 1) ��¥�� �����͸� ���������� ��ȯ
-- ���� : to_char(��¥ ������, '�������')

select to_char(sysdate, 'yy"�� "mm"�� "dd"�� ��" am hh24"�� "mi"�� "ss"�� "day')as "���� �ð�" from dual;



select to_char(hiredate, 'yyyy"�� "mm"�� "dd"�� "hh24"�� "mi"�� "ss"�� "dy')as "��,��,��,��,��,����" from emp;

select to_char(sysdate, 'yy^mm^dd day')from dual;

-- 2) ������ �����͸� ���������� ��ȯ

select ename, to_char(sal,'L9,999.0')as "õ����" from emp;

-- ���� : to_char(���ڵ�����, '���б�ȣ')

select to_char(12300000000,'999,999,999,999') from dual;

select ename as "�����", to_char(sal, '$990,000.00') as "����($)", to_char(sal*1330,'l990,000,000.00')as "����(\)" from emp;
-- \ ��ȭ ��ȣ�� �ü���� ������ �޴´�.


-- to_date() ���ڸ� ��¥��!
-- to_date('���ڵ�����', '��¥����')

select trunc(sysdate-to_date('2023/01/01')) from dual;

select to_char(sysdate+trunc(sysdate-to_date('2023/01/01')), 'mm/yy') from dual;

select trunc(to_date('2023/12/25')-sysdate+1) from dual;

select to_date('2024/01/19')-to_date('2023/07/11') as "�����Ⱓ" from dual;

select to_char(to_number('20,000','90,000') - to_number('32,050','90,000'),'000,000') from dual;


select ename,empno,  to_char(sal*12+nvl(comm,0),'L999,999') as "����" from emp;


-- decode �Լ�, switch case �Լ��� ���
-- ���� : decode(�÷���, ��1, ���1 ó��, ��2, ���2...)


select * from emp;

select decode(job, 'CLERK', '����', 'SALESMAN', '������', 'MANAGER' , '�Ŵ���') from emp;


select * from dept;

select ename, decode(deptno, '10', 'ACCOUNTING', '20', 'RESEARCH' , '30' , 'SALES', '40' , 'OPERATIONS') as dname from emp order by deptno asc;


-- case �Լ�, if ����������
-- ���� : case when ����1 then ���  when ����2 then ��� 1
--         whel ����2 then ���2
--       else ��� 3
-      end

select ename, depno, case select ename, decode(deptno, '10', 'ACCOUNTING', '20', 'RESEARCH' , '30' , 'SALES', '40' , 'OPERATIONS') from emp order by deptno asc;



 
select ename, deptno, case 
when deptno=10 then 'ACCOUNTING'
when deptno=20 then 'RESEARCH'
when deptno=30 then 'SALES'
when deptno=40 then 'OPERATIONS'
end as dname from emp;