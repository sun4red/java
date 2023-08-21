-- 과제

select * from emp;
select * from dept;

-- 1,직급 매니저인 사원 이름 부서명 출력

select ename, dname, job  from emp, dept where dept.deptno = emp.deptno and job = 'MANAGER';

-- 2. 매니저가 킹인 사원들의 이름과 직급

select ename, job, mgr from emp where mgr
= (select empno from emp where ename = 'KING');

-- 3. SCOTT과 동일한 근무지에서 근무하는 사원의 이름
select ename, deptno, loc from emp inner join dept using(deptno) where loc
= (select loc from dept where deptno
= (select deptno from emp where ename = 'SCOTT'));

select ename from emp where deptno
= (select deptno from dept where loc
= (select loc from dept where deptno
= (select deptno from emp where ename = 'SCOTT')));