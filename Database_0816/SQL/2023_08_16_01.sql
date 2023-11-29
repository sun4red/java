--2023_08_16

select * from tab;


select * from salgrade;

describe dept;
desc dept;

select * from mem02;

select * from customer where name = '선홍킴';


select * from dept;

-- sql문은 대소문자를 구문하지 않는다.


desc emp;

select * from emp;

select * from emp where empno >= 7600;

select * from emp where job = 'MANAGER';

-- 오라클의 데이터 타입
-- 1. 숫자데이터
-- number(n) : number(2) 정수 2자리까지 저장
-- number(n1, n2) : n1 - 전체 자리수, n2 - 소수점에 할당된 자리수

-- 2. 문자데이터
-- char() : 고정 길이 문자형, 최대 2000byte 까지 저장 가능함
-- varchar2() : 가변길이문자형, 최대 4000byte까지 저장 가능함
-- long : 2gb까지 저장 가능, 검색기능 지원하지않는다, 너무 큼

-- 3. 날짜데이터
-- date : 연/월/일 정보 저장
-- timestamp : 연/월/일 시:분:초;

select *  from dept;

select sal + comm from emp;
select sal *100 from emp;

-- null
-- 1. 정해지지 않은 값을 의미
-- 2. null 값은 산술 연산을 할 수 없다.
-- 3. null 값의 예
-- emp


select ename, job, sal, comm, sal*12, sal*12+nvl(comm,0) from emp;

-- NVL(컬럼, 변환될 값) : NULL값을 다른값(0)으로 변환해주는 역할

-- 별칭 부여 : as "별칭명"

select ename, sal*12+nvl(comm,0) as "Annsal" from emp;

select ename, sal*12+nvl(comm,0) Annsa from emp;    -- as, "" 생략 가능

select ename || '의 연봉  ' || sal from emp;
-- 연결되서 한개의 컬럼으로 출력


-- distinct 중복 행 제거, 1번만 출력

select distinct deptno from emp;

select distinct job from emp;

-- emp 테이블에서 중복을 제거한 job의개수

select count(job) from emp;


select count(distinct job) from emp;

== 비교연산자 ( = , > , >- , <, <=, !=, ^=, <>)
-- where 조건 절

-- 1. 숫자 데이터 검색
-- 2. 문자 데이터 검색
-- 3. 날짜 데이터 검색


select * from emp where sal >= 3000;

select * from emp where ename = 'FORD';
-- 문자 데이터 검색 시 '' 붙여줘야 한다.

select empno, ename, sal from emp where ename = 'SCOTT';

select * from emp where hiredate >= '82/01/01';
-- 날짜데이터 검색, 데이터 좌 우에 '' 입력
-- 날짜데이터 비교 시 비교연산자 사용

select * from emp where hiredate >= '1982/01/01' order by hiredate asc;


