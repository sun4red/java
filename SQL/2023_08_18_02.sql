--2023_08_18_02

-- 그룹함수
-- : 하나 이상의 데이터를 그룹으로 묶어서 연산을 수행하고 하나의 결과로 처리해주는 함수


select sum(sal) as "부서별 급여 합" from emp group by deptno;

select * from emp;

select nvl(to_char(mgr),'X'), count(mgr) as "부하직원" from emp group by mgr order by mgr asc;

-- 그룹함수들 끼리는 같이 사용할 수 있다.
-- 그룹함수와 일반컬럼은 같이 사용할 수 없다.


select decode(deptno, '10', '회계', '20', '연구', '30', '영업') as "부서", to_char(round(avg(sal),0), 'l9,999') as "부서별 평균 급여" from emp group by deptno;
select avg(comm) as "평균 커미션 금액" from emp where deptno=30;

-- max() : 최대값을 구해주는 함수

select decode(deptno, '10', '회계', '20', '연구', '30', '영업') as "부서", to_char(max(sal), 'l9,999') as "부서별 최고 급여", to_char(round(avg(sal),0), 'l9,999') as "부서별 평균 급여" from emp group by deptno;
select max(comm) from emp;

select max(hiredate) from emp;

select max(ename) from emp;

select min (sal) from emp where deptno = 10;
select min (sal) from emp where deptno = 20;
select min (sal) from emp where deptno = 30;

select min (hiredate) from emp;
select deptno, min (hiredate) from emp group by deptno;


--count (): 총 데이터 갯수 

select count(distinct(deptno)) as "부서 수" from emp;
select count(mgr) from emp; -- null값은 counting 하지 않는다.
select count(comm) from emp;


select deptno , count(empno) from emp group by deptno; -- empno 컬럼은 기본키 제약조건이 설정
-- 보통 primary 키로 설정된 값을 count에 많이 사용

select count(deptno) from dept;

select count(*) from emp;


-------------------------------------------------------

select count(distinct(job)) as "잡의 갯수" from emp;


select count(job)*count(job)*max(sal)*min(sal)+round(avg(sal)) from emp;


select count(comm) from emp where deptno = 30 ;

-- group by  : 특정 컬럼을 기준으로 테이블에 존재하는 데이터를 그룹으로 구분하여 출력
-- 그룹함수와 일반컬럼은 같이 사용할 수 없지만, 예외적으로 group by절에 사용되는
-- 컬럼은 그룹함수와 같이 사용할 수 있다.


select 
    decode(deptno, '10', '회계', '20', '연구', '30', '영업') as "부서",
    count(ename) as "사원수",
    count(comm) as "커미션수령인원" 
        from emp 
            group by deptno 
                order by deptno asc;




