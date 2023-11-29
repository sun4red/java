--2023-08-29
set serveroutput on
declare
    vempno number(4);
    vename varchar2(20);
    vdeptno dept.dept%type;
    vdname varchar2(20) := null;
begin
    select empno, ename, deptno into vempno, vename, vdeptno from emp
        where ename = 'SCOTT';
    
    if vdeptno = 10 then
        vdename := 'ACCOUNTING';
    end if;
    if vdeptno = 20 then
        vdename := 'RESEARCH';
    end if;
    if vdeptno = 30 then
        vdename := 'SALES';
    end if;
    if vdeptno = 40 then
        vdename := 'OPERATIONS';
    end if;
end;
    
-- ������̺��� SCOTT ����� ������ ���ϴ� PL/SQL��

set serveroutput on
declare                                -- %rowtype : emp���̺��� 8�� �÷��� �ڷ����� ��� �����Ѵ�.
    vemp emp%rowtype;           -- ���۷��� ����
    annsal number(7,2);          -- ��Į�� ����
begin
    select * into vemp from emp where ename = 'SCOTT';

    if vemp.comm is null then
        vemp.comm := 0;
    end if;

    annsal := vemp.sal * 12 + vemp.comm;
--    annsal := vemp.sal * 12 + nvl(vemp.comm,0);

    dbms_output.put_line('��� / �̸� / ����');
    dbms_output.put_line(vemp.empno || '/' || vemp.ename || '/' || annsal);

end;

-- ��� ���̺��� SCOTT ����� ������ ���ϴ� PL/SQL�� �ۼ�
-- if ~ then ~ else ~
set serveroutput on
declare
    vemp emp%rowtype;
    annsal number(7,2);
begin
    select * into vemp from emp where ename = 'SCOTT';
    
    if vemp.comm is null then
        annsal := vemp.sal * 12;
    else 
        annsal := vemp.sal*12 + vemp.comm;
    end if;
    
    dbms_output.put_line('��� /  �̸� / ����');
    dbms_output.put_line(vemp.empno || '/' || vemp.ename || '/' || annsal);
    
end;

-- 3. if ~ then ~ elsif ~ else ~ end if
-- scott ����� �μ���ȣ�� �̿��ؼ� �μ����� ���ϴ� PL/SQL �� �ۼ�

set serveroutput on

declare

    vemp emp%rowtype;
    vdname varchar2(14);
    
       
    
begin

    select * into vemp from emp where ename = 'SCOTT';
    
    if vemp.deptno = 10 then
    vdname := 'ACCOUNTING';
    elsif vemp.deptno = 20 then
    vdname := 'RESEARCH';
    elsif vemp.deptno = 30 then
    vdname := 'SALES';
    elsif vemp.deptno = 40 then
    vdname := 'OPERATION';
    end if;

    dbms_output.put_line('��� / �̸� / �μ���');
    dbms_output.put_line(vemp.empno || '/' || vemp.ename || '/' || vdname);

end;

-------------------------------------------------
-- �ݺ���
-- 1. basic loop��
-- loop
--      �ݺ������ ����;
--      ���ǽ� exit;
-- end loop;

-- basic loop������ 1~5 ���� ����ϴ�
set serveroutput on

declare

    n number := 1;          -- n ������ �ʱⰪ ����

begin

    loop
    
        dbms_output.put_line(n);
        n := n+1;
    
        if n > 5 then 
            exit;
        end if;
        
    end loop;


end;

-- 1���� 10���� ���� ���ϴ� ���α׷�

set serveroutput on
declare
    n number := 1;
    s number := 0;
begin
    loop
    
        s := s + n;
        
        n := n + 1;
    
        if n>10 then
            exit;
        end if;
    
    end loop;

        dbms_output.put_line(s);
end;

-----------------------------------------------------
-- for loop
-- for ���� in [reverse] ������..ū�� loop (�ڵ����� 1���� �����Ѵٰ�)
-- �ݺ������ ����;
-- end loop;


set serveroutput on

begin

    for n in 1..5 loop              -- �ڵ����� 1�� ����
    
        dbms_output.put_line(n);

    end loop;
end;


set serveroutput on

begin

    for n in  reverse 1..5 loop              -- �ڵ����� 1�� ����
    
        dbms_output.put_line(n);

    end loop;
end;

-- for loop���� �̿��ؼ� �μ����̺�(dept)�� ��� ������ ��� PL/SQL�� �ۼ�

set serveroutput on

declare
    vdept dept%rowtype;

begin
    dbms_output.put_line('�μ���ȣ / �μ��� / ������');
    
    for cnt in 1..4 loop
        select * into vdept from dept where deptno = 10 * cnt;
        
        dbms_output.put_line(vdept.deptno || '/' || vdept.dname || '/' || vdept.loc);
        
    end loop;

end;

-- while loop��
-- while ���ǽ� loop
--      ����� ����;
--  end loop;

-- while loop ������ 1���� 5���� ���

set serveroutput on

declare

    n number := 1;
    
begin

    while n <= 5 loop
        dbms_output.put_line(n);
        n := n+1;
    end loop;
    
end;

-- while loop������ ��(*)�� �ﰢ�� �������� ���

set serveroutput on

declare
    c number := 1;
    star varchar2(100) := '';

begin
    while c <= 10 loop
        star := star || '*';
        dbms_output.put_line(star);
        c := c+1;
    end loop;

end;