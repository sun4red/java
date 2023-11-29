--2023_08_21

-- having 조건절
-- group by절이 사용되는 경우에 데이터 제한을 가하기 위해
-- where 조건절 대신에 having조건 절을 사용해야한다.

-- 각부서별 평균 금액이 2000 이상인 부서만 출력

select deptno, round(avg(sal)) as "급여 평균" from emp group by deptno having avg(sal)>=2000;

select deptno, max(sal) from emp group by deptno having max(sal) >= 2900 order by deptno asc;

-- 조인 (join)
-- 2개 이상의 테이블을 결합해서 정보를 구해오는 것.

-- scott 사원이 소속된 부서명 출력
-- 1) 사원테이블에서 scott 사원의 부서번호를 구한다
select deptno from emp where ename = 'SCOTT' ;
select dname from dept where deptno = '20';

-- Cross Join
select * from dept, emp;        -- 4 * 14 = 56개의 데이터 검색
select * from emp, dept;        -- 14 * 4 = 56개의 데이터 검색


-- 1. 등가조인 (Equi Join)
-- 두개의 테이블에 동일한 컬럼을 기준으로 조인 하는 것.

select * from emp, dept where emp.deptno = dept.deptno;

-- JOIN사용 
select ename, dname, dept.deptno from dept, emp where dept.deptno = emp.deptno and ename = 'SCOTT';

-- 공통컬럼은 테이블.공통컬럼명 형식으로 출력해야한다.
-- 공통컬럼이 아닌 컬럼들은 앞에 테이블명을 생략할 수 있다.


-- 테이블에 별칭 부여하기

-- 1) 테이블에 대한 별칭이 부여된 다음부터는 테이블명을 사용할 수 없다.
--      별칭명만 사용해야 한다.
-- 2) 별칭명은 대,소문자를 구분하지 않는다.
-- 3) 공통컬럼(deptno)은 별칭명.공통컬럼명 형식으로 사용해야한다.
-- 4) 공통컬럼이 아닌 컬럼들은 앞에 별칭명을 생략할 수 있다.

select e.deptno , e.ename, d.dname from dept d, emp e where d.deptno = e.deptno and e.ename = 'SCOTT';

-- 오류 발생 select dept.deptno, e.ename, d.dname from dept d, emp e where..;


-- 2. 비등가 조인 (Non-Equi Join)
-- 두개의 테이블에 동일한 컬럼없이 다른 조건을 사용하여 조인하는것

-- 사원 테이블에 있는 각 사원들의 급여가 몇 등급인지를 출력하는 sql문 작성
-- emp(sal) - salgrade(grade)

select sal from emp;
select * from salgrade;

select ename, sal, grade from emp, salgrade where sal >= losal and sal <= hisal;
select ename, sal, grade from emp, salgrade where sal between losal and hisal;

-- SelfJoin
-- 한개의 테이블 내에서 컬럼과 컬럼 사이의 관계를 이용해서 조인하는 것
-- 사원테이블의 각 사원들의 사완명과 매니저(직속상사) 를 출력

select employee.ename || '의 상사는 ' || manager.ename
from emp employee, emp manager where employee.mgr = manager.empno;

-- 4. 외부조인 (Outer Join)
-- 조인조건을 만족하지 않는 데이터를 출력해주는 조인
-- 1) 테이블을 조인할 때 어느 한쪽의 테이블에는 데이터가 존재하지만,
--      다른테이블에 데이터가 존재하지 않는 경우에, 그 데이터가 출력되지않는 문제를 해결하기 위해서
--      사용되는 조인 방법
-- 2) 정보가 부족한 곳에 (+)를 추가한다.

-- 외부조인을 이용하여 킹사원도 출력

select employee.ename as "사원명", manager.ename as "직속 상사"
from emp employee, emp manager where employee.mgr = manager.empno(+);

-- 부서테이블과 사원테이블 Equi Join을 하면 40번 부서가 출력되지않음

select ename, dept.deptno, dname from emp, dept 
where emp.deptno(+) = dept.deptno order by dept.deptno asc;
-- emp테이블에는 10,20,30 부서번호만 있기 때문에 부족한 emp쪽에 (+)표시


-- ANSI JOIN    ANSI 미국 표준 협회에서 만듬
-- ANSI Cross Join

select * from emp cross join dept;

-- ANSI Inner Join
-- 등가조인과 같은 의미를 가지고있는 조인방법

select * from emp inner join dept on emp.deptno = dept.deptno;
-- scott 사원이 소속된 부서명을 출력하는....

select ename, dname from dept inner join emp on dept.deptno = emp.deptno where ename = 'SCOTT';
select ename, dname from dept inner join emp using (deptno) where ename = 'SCOTT';

-- using(공통컬럼) 

-- ANSI Natural Join
-- 두 테이블의 공통컬럼이 같다는 의미를 가지고 있다.
select * from emp natural join dept;



-- ANSI Outer Join
-- 형식 : select * from table1 [left | right | full ] outer join table2;
-- left, right, full 중 하나 사용

create  table dept01 (deptno number(2), dname varchar2(14) );
insert into dept01 values (10, 'ACCOUNTING');
insert into dept01 values (20, 'RESEARCH');
select * from dept01;

create table dept02 (deptno number(2) , dname varchar2(14) );
insert into dept02 values(10, 'ACCOUNTING');
insert into dept02 values(20, 'SALES');
select * from dept02;

-- left outer join
select * from dept01 left outer join dept02 using(deptno);

-- right
select * from dept01 right outer join dept02 using(deptno);

select * from dept01 full outer join dept02 using(deptno);