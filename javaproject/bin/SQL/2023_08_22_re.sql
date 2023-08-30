--2023_08_22 과제

select * from emp;


-- 1. SMITH와 동일한 직급을 가진 사원의 이름, 직급 출력

select ename, job from emp where job = (select job from emp where ename = 'SMITH');

-- 2. 직급 SALESMAN인 사원들의 최대급여보다 많이받는 사원들의 이름, 급여 출력하되 
--      부서번호 20번 제외 (all연산자 이용)

select ename, sal from emp
where deptno != '20' 
and sal > all  (select sal from emp where job = 'SALESMAN');


-- 3. 직급 SALESMAN인 사원이 받는 급여들의 최소 급여보다 많이 받는 사원들의 이름과 급여 출력, 
--      부서번호 20번 제외

select ename, sal from emp
where sal > any(select sal from emp where job = 'SALESMAN')
and deptno !=20;