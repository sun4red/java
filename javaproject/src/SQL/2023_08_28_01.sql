--2023-08-28

-- scott ����
select * from system.systbl;

create synonym stbl for system.systbl;

select * from stbl;

drop synonym stbl;

select * from stbl;

-------------------------------------------------


set serveroutput on
begin
dbms_output.put_line('Hello World!');
end;








set serveroutput on
declare                                                     -- ����� ����
    vempno number(4);                                -- ���� ���� : ��Į�� ����
    vename varchar2(10);
begin                                                       -- ����� ����
    vempno := 7788;
    vename := 'SCOTT';
    dbms_output.put_line('��� / �̸�');
    dbms_output.put_line('---------');
    dbms_output.put_line(vempno || '/' || vename);
    
end;                                                         -- ����� ��

-- ����� �̸��� �˻��ϱ� : ���۷��� ���� 
set serveroutput on
declare
    vempno emp.empno%type;
    vename emp.ename%type;
begin
    select empno, ename into vempno,vename from emp
        where ename = 'SCOTT';

    dbms_output.put_line('��� / �̸�');
    dbms_output.put_line(vempno || '/' || vename);

end;

-- ���ǹ� (=���ù�)

-- 1. if ~ then ~ end if
-- ������̺� emp ���� scott ����� �μ���ȣ�� �˻��ؼ�, �μ����� ����ϴ� PL/SQL�� �ۼ�

set serveroutput on
declare
    vempno number(4);
    vename varchar(20);
    vdeptno dept.deptno%type;
    vdname varchar2(20) := null;
begin
    select empno, ename, deptno into vempno,vename,vdeptno from emp
        where ename='SCOTT';
    
    if vdeptno = 10 then
        vdname := 'ACCOUNTING';
    end if;
    if vdeptno = 20 then
        vdname := 'RESEARCH';
    end if;
    if vdeptno = 30 then
        vdname := 'SALES';
    end if;
    if vdeptno = 40 then
        vdname := 'OPERATIONS';
    end if;
    
    dbms_output.put_line('��� / �̸� / �μ���');
    dbms_output.put_line(vempno || '/' || vename || '/' || vdname);
end;


