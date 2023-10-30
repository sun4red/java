--2023-08-30

-- ��� ���̺��� ������� �����Լ��� �Ű������� �����Ͽ� �ش� ����� ������ ���ؿ��� �Լ�
 create or replace function job_emp2(vename in emp.ename%type)
    return varchar2                -- ������ ���� �ڷ���
is
    vjob emp.job%type;          -- ���ú��� (��������� �˻��� ����� job����)
begin
    select job into vjob from emp where ename = vename;
    return vjob;
end;

-- �����Լ� ���

select * from user_source;

variable var_job2 varchar2(10);

execute :var_job2 := job_emp2('SCOTT');

print var_job2;

-- ������ �ȸ����� ����?

-- �����Լ��� SQL���� ����
select ename, job_emp2('SCOTT') from emp where ename = 'SCOTT';

-------------------------------------------------------

-- Ŀ��
-- 2�� �̻��� �����͸� ó���� �� Ŀ���� ��� / ���� �ݺ����� ������ �Ǿ� ���

-- �μ� ���̺� DEPT �� ��� �����͸� ����ϱ����� PL/SQL�� �ۼ�

set serveroutput on
create or replace procedure cursor_sample01
is
    vdept dept%rowtype;                    -- ���� ����
    
    cursor c1                                   -- Ŀ�� ����
    is
    select * from dept;

begin
    dbms_output.put_line('�����ȣ / �μ��� / ������');
    dbms_output.put_line('----------------------');
    
    open c1;                                            -- Ŀ������ (ù��° �����͸� �����´�)
    
        loop 
        
            fetch c1 into vdept.deptno, vdept.dname, vdept.loc;     -- ����
                exit when c1%notfound;          -- Ŀ���� ������ �����Ͱ� ���� �� true�� ����
                
                dbms_output.put_line(vdept.deptno || '/' || vdept.dname || '/' || vdept.loc);

        end loop;
    close c1;
end;

select  * from user_source;

execute cursor_sample01;


-- for loop ������ ó��
-- 1. open ~ fetch ~ close ���� ó���� �� �ִ�.
-- 2. for loop���� ����ϰ� �Ǹ� �� �ݺ�������, cursor�� ����,
--      �� ���� ����(fetch)�ϰ� cursor�� �ݴ� �۾��� �ڵ����� ó��

-- ���� ���ν��� ����
create or replace procedure cursor_sample02
is
    vdept dept%rowtype;             -- ���ú���
    
    cursor c1                            -- Ŀ�� ����
    is
    select * from dept;

begin
    dbms_output.put_line('�μ���ȣ / �μ��� / ������');
    dbms_output.put_line('----------------------');
    
    for vdept in c1 loop
    
        exit when c1%notfound;          -- Ŀ���� ������ �����Ͱ� ���� �� true ����
    
        dbms_output.put_line(vdept.deptno || '/' || vdept.dname || '/' || vdept.loc);
    
    end loop;
end;
    

select * from user_source;

execute cursor_sample02;

-- ������̺��� �μ���ȣ�� �����Ͽ�
-- �ش� �μ��� �Ҽӵ� ����� ������ ����ϴ� ���ν����� Ŀ���� �̿��ؼ� ó��

create or replace procedure info_emp(vdeptno in emp.deptno%type)
is
    vemp emp%rowtype;
    cursor c1
    is
    select * from emp where deptno = vdeptno;
begin
    dbms_output.put_line('�μ���ȣ / �����ȣ / ����� / ���� / �޿�');
    dbms_output.put_line('----------------------------------');
    
    for vemp in c1 loop
        exit when c1%notfound;
    
    dbms_output.put_line(vemp.deptno || '/' || vemp.empno || '/' || vemp.ename ||
    '/' || vemp.job || '/' || vemp.job || '/' || vemp.sal);
    
    end loop;
end;

select * from user_source;
execute info_emp(20);

--------------------------------------------------
