--2023_08_17_01

select * from tab;

-- 1. and 연산자

select * from emp where deptno = 10 and job = 'MANAGER';


-- 2. or 연산자 : 두 조건식 중에서 한가지만 만족해도 검색

select * from emp where deptno =10 or job = 'MANAGER';

-- 3. not 연산자

select * from emp where not deptno = 10;


-- 급여 2000~3000

select * from emp where sal>= 2000 and sal<=3000 ;

select * from emp where sal between 2000 and 3000;
-- where 컬럼명, between 작은값 and 큰값

-- 커미션 300 / 500 / 1400

select * from emp where comm = 300 or comm = 500 or comm = 1400;

-- 사원번호

select * from emp where empno = 7521 or empno =  7654 or empno =  7844;
select * from emp where empno in(7521,7654,7844);



-- 급여 2000미만 3000 초과

select * from emp where sal<2000 or sal >3000;
select * from emp where sal not between 2000 and 3000;


select * from emp where hiredate between '87/01/01' and '87/12/31';

-- in 연산자 : or 연산자를 대신해서 표현할 때 사용된다.
-- 형식 : where 컬럼명 in (데이터1, 데이터2 ....)

select * from emp where comm != 300 and comm! = 500 and comm!=1400;
select * from emp where comm not in(300,500,1400);

select * from emp where hiredate like '87/%/%';
select * from emp where ename like 'F%';

--like 연산자 와 와일드 카드 : 검색기능을 구현할 때 사용함
-- 형식 : where 컬럼명 like pattern(와일드 카드 이용)

-- 와일드 카드
-- 1. % : 문자가 없거나 하나 이상의 문자에 어떤 값이 와도 상관이 없음
-- 2. _ : 하나의 문자에 어떤 값이 와도 상관이 없다.

select * from emp where ename like 'F___';

select * from emp where ename like '%S';

-- 사원명 N으로 끝나는

select * from emp where ename like '%N';

select * from emp where ename like '%A%' order by ename asc;


select empno, ename, job from emp where ename like '_A%' order by empno asc;

select * from emp where ename not like '%A%';



select ename, sal*10 as "?" from emp;
select ename, sal*12+nvl(comm,0) as "Annsal" from emp;

select * from emp where mgr is null;
select * from emp where comm is not null;


select * from emp order by sal asc;

select * from emp order by sal;
-- 기본 정렬 방식 : 오름차순

select * from emp order by sal desc;

-- 날짜데이터로 정렬

select * from emp order by hiredate desc;
select * from emp order by hiredate asc;

== null  값 정렬

select ename, comm from emp order by comm asc;
select ename, comm from emp order by comm desc;
select ename, comm from emp where comm is null order by ename asc;

select ename, sal*sal*sal*sal*sal*sal*sal*sal*sal*sal*sal*sal*sal*sal*sal*sal*sal*sal*sal*sal*sal
*sal*sal*sal*sal*sal*sal*sal*sal*sal*sal*sal*sal*sal*1.71798691 as "ma" from emp;

-- 세개의 컬럼 그리고 두번의 정렬

-- 한번 정렬 했을 때 동일 한 결과가 나오는 경우 한번 더 정렬
-- 두번째 정렬 조건은 한번 정렬 헀을 때 동일한 결과가 나온 데이터만 두번째 정렬 조건의 적용을 받는다.
-- 댓글 게시판을 만드는 경우에 주로 사용한다.

-- 2번 정렬 문제

-- 사원 테이블을 입사 기준으로 어쩌고 할때 사원명내림차순까지

select * from emp order by hiredate asc, ename desc;


-- 사원 테이블에서 급여를 기준으로 내림차순으로 정렬을 한다. 이때 동일한 급여를 받는 사원들은
-- 오름차순으로 정렬해서 출력하는 SQL문 작성

select * from emp order by sal desc, ename asc;

-- 사원 테이블에서 부서 번호를 기준으로 오름차순 정렬하고, 
-- 동일한 부서에 소속된 경우는 입사일을 기준으로 내림차순으로 정렬해서 출력

select * from emp order by deptno asc, hiredate desc;

select deptno as "부서 번호", sum (sal) as "합계", avg(sal) as "평균" from emp group by deptno order by deptno asc;















