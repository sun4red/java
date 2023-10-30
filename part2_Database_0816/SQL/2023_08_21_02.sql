--2023_08_21_02

select dname from dept where deptno =
(select deptno from emp where ename = 'SCOTT');

select dname from dept, emp where dept.deptno = emp.deptno and ename = 'SCOTT';
select dname from dept inner join emp on dept.deptno = emp.deptno where ename = 'SCOTT';
select dname from dept natural join emp where ename = 'SCOTT';


-- 1. 단일행 서브쿼리
-- 1) 서브쿼리의 검색결과가 1개만 반환되는 쿼리
-- 2) 메인쿼리의 where 조건절에서 비교 연산자만 사용할 수 있다.
--      ( = . > . >= . < . <= , != )

 select ename, hiredate from emp where hiredate 
 = (select max(hiredate) from emp);
 
 select ename, sal from emp where sal
 = (select max(sal)from emp);
 
 select *from emp;
 
 -- 직속상사 킹
 select ename, sal from emp where mgr
 = (select empno from emp where ename = 'KING');
 
 
 -- 2. 다중행 서브쿼리
 -- 1) 서브쿼리에서 반환되는 검색 결과가 2개 이상인 서브쿼리
 -- 2) 메인쿼리의 WHERE 조건절에서 다중행 연산자 사용 (in, all, any ...)를 사용해야한다.
 
-- <in 연산자>
-- 서브쿼리의 검색 결과 중에서 하나라도 일치되면 참이된다.

select * from emp;
-- 급여 3000이상 받는 사원이 소속된 부서와 동일한 부서에서 근무하는 사원들의 정보
select ename, deptno, sal from emp where deptno in
(select distinct deptno from emp where sal >= 3000);

-- <all 연산자>
-- 메인쿼리의 비교조건이 서브쿼리의 검색 결과와 모든 값이 일치되면 참이된다.

-- 30번 부서에 소속된 사원 중에서 급여를 가장 많이 받는 사원보다 더많은 급여를 받는 사원의 이름과 급여출력

-- 단일행 서브쿼리
select deptno, ename, sal from emp where sal >
(select max(sal) from emp where deptno = '30') order by deptno asc;

-- 다중행 서브쿼리
select deptno, ename, sal from emp where sal > all
(select sal from emp where deptno= '30');

-- 둘다 써도 되면 단일행으로 쉽게 가는 편이 낫다.

-- <any 연산자>
-- 메인쿼리의 비교 조건이 서브쿼리의 검색 결과와 하나 이상 일치되면 참이된다.

-- 부서번호가 30인 사원들의 급여중에서 가장 낮은 급여 보다 더 높은 급여를 받는 사원명
select ename, sal, deptno from emp where sal > any
(select sal from emp where deptno = '30') order by deptno asc;


-- DDL (Data Definition Language) : 데이터 정의어
-- create : 테이블 생성
-- alter : 테이블 구조 변경
-- rename : 테이블 이름 변경
-- drop : 테이블 삭제
-- truncate : 데이터 삭제

-- 테이블 목록
select * from tab;
select * from user_tables;

--1. create
-- 데이터베이스 생성, 테이블 생성

-- 형식 : create table 테이블명 (컬럼명1, 데이터타입1,  컬럼명2, 데이터타입2, ....)


--  오라클의 데이터 타입
-- 1) 숫자 데이터
--      number(n) : 정수 n자리까지 저장
--      number(n1,n2) : 전체 자리수, n2 : 소숫점 이하에 할당된 자리수

-- 2) 문자 데이터
-- char() : 고정길이 문자형, 최대 2000byte 까지 저장 가능
-- varchar2() : 가변길이 문자형, 최대 4000byte 까지 저장 가능
-- long : 2GB 까지 저장 가능, long형으로 설정된 컬럼은 검색기능을 지원하지 않는다.

-- 3) 날짜데이터
-- date : 연/월/일 정보 저장
-- timestamp : 연/월/일 시:분:초 정보 저장