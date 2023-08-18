--2023_08_18_01

-- instr 문자열 내 특정 문자 위치 구하는 함수


select instr('jeepgagoshpda', 'g') from dual;
select instr('jeepgagoshipda', 'p', 5, 1) from dual;
-- instr(대상, 찾을문자, 시작위치, 몇번째 발견)

select instr ('Welcome to oracle','o',6,2) from dual;

-- 사원테이블에서 사원명의 3번째 자리가 R로 되어있는 사원을 검색

select * from emp where ename like '__R%';

select * from emp where instr(ename,'R',3,1) =3;

select * from emp where substr(ename,3,1)= 'R';




select rpad('oracle' ,  20 ,  '#' ) from dual;
-- 20글자까지 모자란 자리를 특정 기호를 채워준다.

select ltrim (' oracle ') from dual;
-- 왼쪽 공백 삭제
select rtrim (' oracle ') from dual;
-- 오른쪽 공백 삭제
select trim (' oracle ') from dual;
-- 좌우 공백 삭제
select trim ('       o r a c l e           ') from dual;


select trim ('a' from 'aaaaaoracleAAAAAaaaaA') from dual;
-- 좌 우의 특정 문자 제거



select to_char(sysdate, 'yyyy"년"mm"월"dd"일"') from dual;

-- 사원 테이블에서 각 사원들의 현재까지 근무한 일수
select ename as "사원명", to_char(hiredate, 'yyyy"년"mm"월"dd"일"') as "입사일",
trunc(sysdate-hiredate) as 근속일수 from emp order by hiredate asc;

select ename as "사원명", to_char(hiredate, 'yyyy"년"mm"월"dd"일"') as "입사일", 
trunc(months_between(sysdate, hiredate)) as "근속월수" from emp order by hiredate asc;
-- 앞의 날짜가 뒤의 날짜로부터 경과된 월 수

select add_months(sysdate,3) from dual;
-- 앞의 날짜에 경과된 개월 수

select add_months('23/07/11', 6) from dual;

-- next_day : 해당 요일의 가장 가까운 날짜를 구해주는 함수 
-- 형식 : next_day(date,요일)

-- 오늘을 기준으로 가장 가까운 토요일

select next_day(sysdate, '토요일') from dual;
select last_day(sysdate) from dual;

select ename, hiredate, last_day(hiredate) from emp order by hiredate asc;

select ename, hiredate, to_char(last_day(hiredate), 'yy"년"mm"월 말일 : "dd"일"') from emp order by hiredate asc;

select to_char(hiredate, 'yy"년" mm"월"')as "년 월", to_char(hiredate,'yy')*to_char(hiredate,'mm') as "년*월" from emp;

--1. to_char():날짜형, 숫자형 데이터를 문자형으로 변환해주는 형변환
-- 1) 날짜형 데이터를 문자형으로 변환
-- 형식 : to_char(날짜 데이터, '출력형식')

select to_char(sysdate, 'yy"년 "mm"월 "dd"일 ★" am hh24"시 "mi"분 "ss"초 "day')as "현재 시간" from dual;



select to_char(hiredate, 'yyyy"년 "mm"월 "dd"일 "hh24"시 "mi"분 "ss"초 "dy')as "연,월,시,분,초,요일" from emp;

select to_char(sysdate, 'yy^mm^dd day')from dual;

-- 2) 숫자형 데이터를 문자형으로 변환

select ename, to_char(sal,'L9,999.0')as "천단위" from emp;

-- 형식 : to_char(숫자데이터, '구분기호')

select to_char(12300000000,'999,999,999,999') from dual;

select ename as "사원명", to_char(sal, '$990,000.00') as "월급($)", to_char(sal*1330,'l990,000,000.00')as "월급(\)" from emp;
-- \ 통화 기호는 운영체제의 영향을 받는다.


-- to_date() 문자를 날짜로!
-- to_date('문자데이터', '날짜포멧')

select trunc(sysdate-to_date('2023/01/01')) from dual;

select to_char(sysdate+trunc(sysdate-to_date('2023/01/01')), 'mm/yy') from dual;

select trunc(to_date('2023/12/25')-sysdate+1) from dual;

select to_date('2024/01/19')-to_date('2023/07/11') as "교육기간" from dual;

select to_char(to_number('20,000','90,000') - to_number('32,050','90,000'),'000,000') from dual;


select ename,empno,  to_char(sal*12+nvl(comm,0),'L999,999') as "연봉" from emp;


-- decode 함수, switch case 함수랑 비슷
-- 형식 : decode(컬럼명, 값1, 결과1 처리, 값2, 결과2...)


select * from emp;

select decode(job, 'CLERK', '점원', 'SALESMAN', '영업직', 'MANAGER' , '매니저') from emp;


select * from dept;

select ename, decode(deptno, '10', 'ACCOUNTING', '20', 'RESEARCH' , '30' , 'SALES', '40' , 'OPERATIONS') as dname from emp order by deptno asc;


-- case 함수, if 구문과유사
-- 형식 : case when 조건1 then 결과  when 조건2 then 결과 1
--         whel 조건2 then 결과2
--       else 결과 3
-      end

select ename, depno, case select ename, decode(deptno, '10', 'ACCOUNTING', '20', 'RESEARCH' , '30' , 'SALES', '40' , 'OPERATIONS') from emp order by deptno asc;



 
select ename, deptno, case 
when deptno=10 then 'ACCOUNTING'
when deptno=20 then 'RESEARCH'
when deptno=30 then 'SALES'
when deptno=40 then 'OPERATIONS'
end as dname from emp;