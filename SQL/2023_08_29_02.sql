--2023-08-29

-- �������ν���

drop table emp01 purge;

create table emp01 as select * from emp;
select * from emp01;

-- �Ű������� ���� ���ν���
create or replace procedure del_all
is
begin
    delete from emp01;
end;



-- 2. ���ν��� ��� Ȯ��
select * from user_source;

-- 3. ���ν��� ����
exec del_all;
execute del_all;

-- 4. ���ν��� ���� Ȯ��

rollback;

insert into emp01 select * from emp;
--------------------------------------------------
-- �Ű������� �ִ� ���ν���
-- in : �Ű������� ���� �޴� ����




create or replace procedure del_ename(vename in emp01.ename%type)
is
begin
    delete from emp01 where ename = vename;
end;

-- ���ν��� ����

execute del_ename('SCOTT');
execute del_ename('KING');
execute del_ename('SMITH');

---------------------------------------------------------------

-- �Ű������� MODE�� in, out ���� �Ǿ��ִ� ���ν���
-- in : �Ű������� ���� �޴� ����
-- out : �Ű������� ���� �����ִ� ����

-- ���ν��� �Ű������� �����ȣ�� �����ؼ�, �� ����� �����, �޿�, ��å�� ���ϴ� ���ν���
-- ���ν�������

create or replace procedure sal_empno(
    vempno in emp.empno%type,                               -- �����ȣ ����
    vname out emp.ename%type,                              -- ����� �����ؼ� ������
    vsal out emp.sal%type,                                      -- �޿�
    vjob out emp.job%type)                                       -- ��å
    
is

begin

    select ename, sal, job into vname, vsal, vjob from emp
            where empno = vempno;

end;


-- 2. ���ν��� ��� Ȯ��

select * from user_source;
    
    
-- ���ε� ������ �̸� ����������

-- 3. ���ε� ���� : ���ν����� ������ �� ����� �����޴� ����
variable var_ename varchar2(12);
variable var_sal number;
variable var_job varchar2(10);

-- 4. ���ν��� ����

execute sal_empno(7788, :var_ename, :var_sal, :var_job);
execute sal_empno(7839, :var_ename, :var_sal, :var_job);

-- 5. ���ε� ������ �������� �� ���
print var_ename;
print var_sal;
print var_job;


-- �ڹ����α׷����� ����
-- �Ű������� ���� ���ν���
-- 1. ���ν��� ����
create or replace procedure del_all
is
begin
    delete from emp01;
end;

drop table emp01 purge;
create table emp01 as select * from emp;
select * from emp01;


----------------------------------------
create or replace procedure sel_customer(
    vname in customer.name%type,
    vemail out customer.email%type,
    vtel out customer.tel%type)  
is
begin
    select email, tel into vemail, vtel from customer
        where name = vname;
end;

select * from user_source;


select * from customer;

variable var_email varchar2(20);
variable var_tel varchar2(20);

execute sel_customer('��ȫŴ', :var_email, :var_tel);

print var_email;
print var_tel;

-------------------------------------------------
-- ���� �Լ� 
-- ���� ���ν����� ������ ����� ����������, �������� �����ִ� ������ �Ѵ�.

-- ��� ���̺��� Ư�� ����� �޿��� 200% �λ��� ����� �����ִ� ���� �Լ� ����

create or replace function cal_bonus(vempno in emp.empno%type)
    return number       -- ������ ���� �ڷ���
is
    vsal number(7,2);           -- ���� ����
begin
    select sal into vsal from emp where empno = vempno;
    return vsal * 2;
end;
-- �����Լ� ��� Ȯ��
select * from user_source;

variable var_res number;

execute :var_res := cal_bonus(7788);
print var_res;

select ename, sal, cal_bonus(7788) from emp where empno = 7788;