--2023-08-29 과제

-- 1번
-- 1)
create user woman identified by tiger;
grant create session to woman with admin option;
grant connect, resource, dba to woman;

-- 2)
create user user01 identified by tiger;
-- 3)
grant create session, create table to user01;


-- 2번

create or replace procedure job_emp(
    vename in emp.ename%type,
    vjob out emp.job%type)
is
begin
    select job into vjob from emp where ename = vename;
end;

select * from user_source;

variable var_job varchar2(20);

execute job_emp('SCOTT' , :var_job);

print var_job;
