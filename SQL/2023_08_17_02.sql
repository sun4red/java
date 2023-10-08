--2023_08_17_02

select 10+20 from dept;

select 10+20 from emp;

-- 테이블 안에있는 데이터 개수만큼 출력한다.


select 10+20 from dual;
--  갑자기 어디서왔냐 dual 테이블은, sys 계정의 소유이다.
-- dual 테이블은 sys 계정 소유의 테이블이고, 공개동의어로 성정되어있다.
-- dual 테이블은 공개가 되어있기 때문에 누구나 사용할 수 있다.
-- dual 테이블은 데이터가 1개밖에 없기 때문에 연산 결과를 한번만 출력하게된다.

select 10+20 from sys.dual;
-- 원래는 소유자 계정명을 적어야하지만 동의어로 되어있기 때문에 입력해도 상관없다.

desc dual;
-- 더미~ 바챠2

select * from dual ;

select * from tab;
-- tab 도 sys 소유의 ... 공개동의어다.
select * from sys.tab;

select round(avg(sal),0) as "평균" from emp group by deptno;

-- avs() : 절대값을 구해주는 함수
-- 함수명은 대소문자를 구분하지 않는다.
-- 


select -10, abs(-10), ABS(-10) from dual;

select log(2,4) from dual;

select floor(34.5534424) from dual;

select round (34.45646546546545) from dual;

select round(2362536.3355,-2) from dual;

select trunc(45295, -2), trunc ( 456.123465,3) from dual;
-- 자리수 버림


select mod(mod(150,19),7) from dual;


-- 사원 테이블에서 사원번호가 홀수인 사원들을 출력하는 SQL문

select empno, ename from emp where mod(empno,2)=1 order by empno asc;

---------------------------------------------------
-- 문자처리함수
 select 'WWD', lower('WWD') from dual;
 
 select * from emp where job = 'manager';
select * from emp where job = upper('manager');

select initcap('go home') from dual;

select length('char len') from dual;

select lengthb('문자열') from dual;
select length('문자열') from dual;

-- 영문 1글자 : 1Byte, 한글 1글자 : 3Byte (배포판에 따라 2Byte인 경우가 있음)


 select substr('집에가고싶다집에가고싶다', 4,6) from dual;
 -- 첫 글자 시작위치가 1번이다.
 -- 형식 : substr(대상문자열,시작위치,추출할 문자개수)
 -- 시작위치를 (-)를 입력하면 뒤에서부터 시작 (방향성)
 select substr('집에가고싶다집에가고싶다', -3,2) from dual;
 
 
-- 사원 테이블에서 입사일을 년, 월일을 추출하는 SQL문 작성

select ename as "이름", substr(hiredate,1,2)as"년" ,substr(hiredate,4,2) as"월", substr(hiredate,7,2)as"일" from emp
order by hiredate asc;

--사원 테이블에서 87년도에 입사한 사원을 검색하는 SQL문 작성

select * from emp where substr(hiredate,1,2) = 87;

--사원테이블에서 사원명이 E로 끝나는 사원을 검색

select * from emp where ename like '%E';
select * from emp where substr(ename,-1,1) = 'E';