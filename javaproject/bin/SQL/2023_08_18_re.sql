--2023_08_18_re

-- 1)

select ename, hiredate from emp where hiredate = (select max(hiredate) from emp);


-- 2_

select ename, sal from emp where sal = (select max(sal) from emp);