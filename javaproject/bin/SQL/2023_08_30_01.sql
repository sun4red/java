--2023-08-30

-- 사원 테이블에서 사원명을 저장함수의 매개변수로 전달하여 해당 사원의 직급을 구해오는 함수
 create or replace function job_emp2(vename in emp.ename%type)
    return varchar2                -- 돌려줄 값의 자료형
is
    vjob emp.job%type;          -- 로컬변수 (사원명으로 검색한 사원의 job저장)
begin
    select job into vjob from emp where ename = vename;
    return vjob;
end;

-- 저장함수 목록

select * from user_source;

variable var_job2 varchar2(10);

execute :var_job2 := job_emp2('SCOTT');

print var_job2;

-- 순서가 안맞으면 에러?

-- 저장함수를 SQL문에 포함
select ename, job_emp2('SCOTT') from emp where ename = 'SCOTT';

-------------------------------------------------------

-- 커서
-- 2개 이상의 데이터를 처리할 때 커서를 사용 / 보통 반복문과 결합이 되어 사용

-- 부서 테이블 DEPT 의 모든 데이터를 출력하기위한 PL/SQL문 작성

set serveroutput on
create or replace procedure cursor_sample01
is
    vdept dept%rowtype;                    -- 로컬 변수
    
    cursor c1                                   -- 커서 선언
    is
    select * from dept;

begin
    dbms_output.put_line('사원번호 / 부서명 / 지역명');
    dbms_output.put_line('----------------------');
    
    open c1;                                            -- 커서열기 (첫번째 데이터를 가져온다)
    
        loop 
        
            fetch c1 into vdept.deptno, vdept.dname, vdept.loc;     -- 인출
                exit when c1%notfound;          -- 커서가 가져올 데이터가 없을 때 true값 리턴
                
                dbms_output.put_line(vdept.deptno || '/' || vdept.dname || '/' || vdept.loc);

        end loop;
    close c1;
end;

select  * from user_source;

execute cursor_sample01;


-- for loop 문으로 처리
-- 1. open ~ fetch ~ close 없이 처리할 수 있다.
-- 2. for loop문을 사용하게 되면 각 반복문마다, cursor를 열고,
--      각 행을 인출(fetch)하고 cursor를 닫는 작업을 자동으로 처리

-- 저장 프로시저 생성
create or replace procedure cursor_sample02
is
    vdept dept%rowtype;             -- 로컬변수
    
    cursor c1                            -- 커서 선언
    is
    select * from dept;

begin
    dbms_output.put_line('부서번호 / 부서명 / 지역명');
    dbms_output.put_line('----------------------');
    
    for vdept in c1 loop
    
        exit when c1%notfound;          -- 커서가 가져올 데이터가 없을 때 true 리턴
    
        dbms_output.put_line(vdept.deptno || '/' || vdept.dname || '/' || vdept.loc);
    
    end loop;
end;
    

select * from user_source;

execute cursor_sample02;

-- 사원테이블에서 부서번호를 전달하여
-- 해당 부서에 소속된 사원의 정보를 출력하는 프로시저를 커서를 이용해서 처리

create or replace procedure info_emp(vdeptno in emp.deptno%type)
is
    vemp emp%rowtype;
    cursor c1
    is
    select * from emp where deptno = vdeptno;
begin
    dbms_output.put_line('부서번호 / 사원번호 / 사원명 / 직급 / 급여');
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
