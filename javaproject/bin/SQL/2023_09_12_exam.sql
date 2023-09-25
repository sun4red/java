-- 2�� ����
-- 1~10 ������ ���� �߿��� ¦���� �� ���ϱ�

set serveroutput on

declare

    n number := 1;
    s number := 0;

begin
    loop
    
        s := s + (n*2);
        n := n + 1;
    
        if n > 5 then
            exit;
        end if;
    
    end loop;
    
dbms_output.put_line(s);
    
end;

-- 3�� ����
-- ������� ���� ���ν���

create or replace procedure del_empno(vempno in emp.empno%TYPE)
is
begin
    delete from emp where empno = vempno;
end;

execute del_empno('1111');


select * from emp01;


-- 4�� ����
-- ������� �Ű������� �����ؼ� �޿����� ���

create or replace procedure emp_sal(
    vename in emp.ename%TYPE,
    vsal out emp.sal%TYPE)
is
begin
    select sal into vsal from emp where ename = vename;
end;

variable var_sal number;
execute emp_sal('SCOTT', : var_sal);
print var_sal;

select * from user_source;

select * from emp;

-- 5�� ����
-- �����ȣ�� �Ű������� �޾� �����, �޿�, �μ���ȣ ���ϱ�

create or replace procedure emp_info(
    vempno in emp.empno%type,
    vename out emp.ename%type,
    vsal out emp.sal%type,
    vdeptno out emp.deptno%type)
is
begin
    select ename, sal, deptno into vename, vsal, vdeptno from emp
    where empno = vempno;
end;

variable var_ename varchar2;
variable var_sal number;
variable var_deptno number;

execute emp_info('7369', :var_ename, :var_sal, :var_deptno);

print var_ename;
print var_sal;
print var_deptno;

select * from emp;
    