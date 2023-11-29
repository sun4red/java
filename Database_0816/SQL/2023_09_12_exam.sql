-- 2번 문제
-- 1~10 사이의 정수 중에서 짝수의 합 구하기

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

-- 3번 문제
-- 사원정보 삭제 프로시저

create or replace procedure del_empno(vempno in emp.empno%TYPE)
is
begin
    delete from emp where empno = vempno;
end;

execute del_empno('1111');


select * from emp01;


-- 4번 문제
-- 사원명을 매개변수로 전달해서 급여정보 출력

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

-- 5번 문제
-- 사원번호를 매개변수로 받아 사원명, 급여, 부서번호 구하기

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
    