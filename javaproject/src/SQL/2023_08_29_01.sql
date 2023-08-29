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
    
-- 사원테이블에서 SCOTT 사원의 연봉을 구하는 PL/SQL문

set serveroutput on
declare                                -- %rowtype : emp테이블의 8개 컬럼의 자료형을 모두 참조한다.
    vemp emp%rowtype;           -- 레퍼런스 변수
    annsal number(7,2);          -- 스칼라 변수
begin
    select * into vemp from emp where ename = 'SCOTT';

    if vemp.comm is null then
        vemp.comm := 0;
    end if;

    annsal := vemp.sal * 12 + vemp.comm;
--    annsal := vemp.sal * 12 + nvl(vemp.comm,0);

    dbms_output.put_line('사번 / 이름 / 연봉');
    dbms_output.put_line(vemp.empno || '/' || vemp.ename || '/' || annsal);

end;

-- 사원 테이블에서 SCOTT 사원의 연봉을 구하는 PL/SQL문 작성
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
    
    dbms_output.put_line('사번 /  이름 / 연봉');
    dbms_output.put_line(vemp.empno || '/' || vemp.ename || '/' || annsal);
    
end;

-- 3. if ~ then ~ elsif ~ else ~ end if
-- scott 사원의 부서번호를 이용해서 부서명을 구하는 PL/SQL 문 작성

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

    dbms_output.put_line('사번 / 이름 / 부서명');
    dbms_output.put_line(vemp.empno || '/' || vemp.ename || '/' || vdname);

end;

-------------------------------------------------
-- 반복문
-- 1. basic loop문
-- loop
--      반복실행될 문장;
--      조건식 exit;
-- end loop;

-- basic loop문으로 1~5 까지 출력하는
set serveroutput on

declare

    n number := 1;          -- n 변수의 초기값 설정

begin

    loop
    
        dbms_output.put_line(n);
        n := n+1;
    
        if n > 5 then 
            exit;
        end if;
        
    end loop;


end;

-- 1부터 10까지 합을 구하는 프로그램

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
-- for 변수 in [reverse] 작은값..큰값 loop (자동으로 1씩만 증가한다고)
-- 반복실행될 문장;
-- end loop;


set serveroutput on

begin

    for n in 1..5 loop              -- 자동으로 1씩 증가
    
        dbms_output.put_line(n);

    end loop;
end;


set serveroutput on

begin

    for n in  reverse 1..5 loop              -- 자동으로 1씩 감소
    
        dbms_output.put_line(n);

    end loop;
end;

-- for loop문을 이용해서 부서테이블(dept)의 모든 정보를 출력 PL/SQL문 작성

set serveroutput on

declare
    vdept dept%rowtype;

begin
    dbms_output.put_line('부서번호 / 부서명 / 지역명');
    
    for cnt in 1..4 loop
        select * into vdept from dept where deptno = 10 * cnt;
        
        dbms_output.put_line(vdept.deptno || '/' || vdept.dname || '/' || vdept.loc);
        
    end loop;

end;

-- while loop문
-- while 조건식 loop
--      실행될 문장;
--  end loop;

-- while loop 문으로 1부터 5까지 출력

set serveroutput on

declare

    n number := 1;
    
begin

    while n <= 5 loop
        dbms_output.put_line(n);
        n := n+1;
    end loop;
    
end;

-- while loop문으로 별(*)을 삼각형 모형으로 출력

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