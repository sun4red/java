--2023-08-29

-- 저장프로시저

drop table emp01 purge;

create table emp01 as select * from emp;
select * from emp01;

-- 매개변수가 없는 프로시져
create or replace procedure del_all
is
begin
    delete from emp01;
end;



-- 2. 프로시저 목록 확인
select * from user_source;

-- 3. 프로시저 실행
exec del_all;
execute del_all;

-- 4. 프로시저 실행 확인

rollback;

insert into emp01 select * from emp;
--------------------------------------------------
-- 매개변수가 있는 프로시저
-- in : 매개변수로 값을 받는 역할




create or replace procedure del_ename(vename in emp01.ename%type)
is
begin
    delete from emp01 where ename = vename;
end;

-- 프로시저 실행

execute del_ename('SCOTT');
execute del_ename('KING');
execute del_ename('SMITH');

---------------------------------------------------------------

-- 매개변수의 MODE가 in, out 으로 되어있는 프로시저
-- in : 매개변수로 값을 받는 역할
-- out : 매개변수로 값을 돌려주는 역할

-- 프로시저 매개변수에 사원번호를 전달해서, 그 사원의 사원명, 급여, 직책을 구하는 프로시저
-- 프로시저생성

create or replace procedure sal_empno(
    vempno in emp.empno%type,                               -- 사원번호 전달
    vname out emp.ename%type,                              -- 사원명 저장해서 돌려줌
    vsal out emp.sal%type,                                      -- 급여
    vjob out emp.job%type)                                       -- 직책
    
is

begin

    select ename, sal, job into vname, vsal, vjob from emp
            where empno = vempno;

end;


-- 2. 프로시저 목록 확인

select * from user_source;
    
    
-- 바인드 변수를 미리 만들어줘야함

-- 3. 바인드 변수 : 프로시저를 실행할 때 결과를 돌려받는 변수
variable var_ename varchar2(12);
variable var_sal number;
variable var_job varchar2(10);

-- 4. 프로시저 실행

execute sal_empno(7788, :var_ename, :var_sal, :var_job);
execute sal_empno(7839, :var_ename, :var_sal, :var_job);

-- 5. 바인드 변수로 돌려받은 값 출력
print var_ename;
print var_sal;
print var_job;


-- 자바프로그램으로 실행
-- 매개변수가 없는 프로시저
-- 1. 프로시저 생성
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

execute sel_customer('선홍킴', :var_email, :var_tel);

print var_email;
print var_tel;

-------------------------------------------------
-- 저장 함수 
-- 저장 프로시저와 유사한 기능을 수행하지만, 실행결과를 돌려주는 역할을 한다.

-- 사원 테이블에서 특정 사원의 급여를 200% 인상한 결과를 돌려주는 저장 함수 생성

create or replace function cal_bonus(vempno in emp.empno%type)
    return number       -- 돌려줄 값의 자료형
is
    vsal number(7,2);           -- 로컬 변수
begin
    select sal into vsal from emp where empno = vempno;
    return vsal * 2;
end;
-- 저장함수 목록 확인
select * from user_source;

variable var_res number;

execute :var_res := cal_bonus(7788);
print var_res;

select ename, sal, cal_bonus(7788) from emp where empno = 7788;