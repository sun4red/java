--2023-08-30

-- ��Ű�� = ���� ���ν����� ���� �Լ��� ���������

-- ��Ű�� = ��Ű�� ��� + ��Ű���ٵ�

-- ��Ű�� ����

-- 1. ��Ű�� ��� ����
create or replace package exam_pack
is
    function cal_bonus(vempno in emp.empno%type)            -- ���� �Լ�
        return number;
    procedure cursor_sample02;
end;

-- 2. ��Ű�� �ٵ� ����
create or replace package body exam_pack
is
                    -- ���� �Լ� : cal_bonus
                    
    function cal_bonus(vempno in emp.empno%type)
        return number       -- ������ ���� �ڷ���
    is
        vsal number(7,2);           -- ���� ����
    begin
        select sal into vsal from emp where empno = vempno;
        return vsal * 2;
    end;                    
                    
                    
                    -- ���� ���ν��� : cursor_sample02
                    
    procedure cursor_sample02
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
                    
end;

-- 3. �������ν��� ���� : cursor_sample02
execute exam_pack.cursor_sample02;

-- 4. �����Լ� ���� : cal_bonus()
-- ���ε� ���� ����
variable var_res number;

-- ���� �Լ� ����
execute :var_res := exam_pack.cal_bonus(7788);
print var_res;

-- sql ������ �����Լ� ����
select ename, exam_pack.cal_bonus(7788) from emp where empno = 7788;