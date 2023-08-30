--2023-08-28

-- scott 계정
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
declare                                                     -- 선언부 시작
    vempno number(4);                                -- 변수 선언 : 스칼라 변수
    vename varchar2(10);
begin                                                       -- 실행부 시작
    vempno := 7788;
    vename := 'SCOTT';
    dbms_output.put_line('사번 / 이름');
    dbms_output.put_line('---------');
    dbms_output.put_line(vempno || '/' || vename);
    
end;                                                         -- 실행부 끝

-- 사번과 이름을 검색하기 : 레퍼런스 변수 
set serveroutput on
declare
    vempno emp.empno%type;
    vename emp.ename%type;
begin
    select empno, ename into vempno,vename from emp
        where ename = 'SCOTT';

    dbms_output.put_line('사번 / 이름');
    dbms_output.put_line(vempno || '/' || vename);

end;

-- 조건문 (=선택문)

-- 1. if ~ then ~ end if
-- 사원테이블 emp 에서 scott 사원의 부서번호를 검색해서, 부서명을 출력하는 PL/SQL문 작성

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
    
    dbms_output.put_line('사번 / 이름 / 부서명');
    dbms_output.put_line(vempno || '/' || vename || '/' || vdname);
end;


