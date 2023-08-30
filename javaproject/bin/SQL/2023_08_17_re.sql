-- 2023_08_17 과제

-- 1) 사원테이블 에서 입사일을 4자리 연도로 출력

select * from emp;

select empno, ename, job, mgr, to_char(hiredate,'yyyy/mm/dd') as hiredate_ren, sal, comm, deptno from emp;

-- 2) 사원테이블에서 MGR컬럼의 값이 null인 데이터의 MGR의 값을 CEO로 출력하는 SQL문을 작성

select empno, ename, to_char('CEO') as "CEO" from emp where mgr is null;
-- ?

select empno, ename, nvl(to_char(mgr),'CEO') as MGR_ren  from emp;