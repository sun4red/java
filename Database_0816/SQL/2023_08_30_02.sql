--2023-08-30

-- 패키지 = 저장 프로시저와 저장 함수를 묶어놓은것

-- 패키지 = 패키지 헤드 + 패키지바디

-- 패키지 생성

-- 1. 패키지 헤드 생성
create or replace package exam_pack
is
    function cal_bonus(vempno in emp.empno%type)            -- 저장 함수
        return number;
    procedure cursor_sample02;
end;

-- 2. 패키지 바디 생성
create or replace package body exam_pack
is
                    -- 저장 함수 : cal_bonus
                    
    function cal_bonus(vempno in emp.empno%type)
        return number       -- 돌려줄 값의 자료형
    is
        vsal number(7,2);           -- 로컬 변수
    begin
        select sal into vsal from emp where empno = vempno;
        return vsal * 2;
    end;                    
                    
                    
                    -- 저장 프로시저 : cursor_sample02
                    
    procedure cursor_sample02
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
                    
end;

-- 3. 저장프로시저 실행 : cursor_sample02
execute exam_pack.cursor_sample02;

-- 4. 저장함수 실행 : cal_bonus()
-- 바인드 변수 생성
variable var_res number;

-- 저장 함수 실행
execute :var_res := exam_pack.cal_bonus(7788);
print var_res;

-- sql 문으로 저장함수 실행
select ename, exam_pack.cal_bonus(7788) from emp where empno = 7788;