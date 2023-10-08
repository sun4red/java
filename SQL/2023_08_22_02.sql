--2023_08_22

-- DML
-- insert into 테이블 (컬럼1, 컬럼2, ...) values (데이터1, 데이터2...)

drop table dept01 purge;

create table dept01 as select * from dept where 1=0;

select * from dept01;

insert into dept01 (deptno, dname, loc) values ('10', 'ACCOUNTING' , 'SEOUL');

insert into dept01 values('20','RESEARCH' , 'DALLAS');

insert into dept01 values(30,'영업부','미국');

-- null값 입력

insert into dept01 (deptno, dname) values (40, '중국');
-- loc컬럼 null값
insert into dept01 values (50, '기획부',null);

-- 2) 서브쿼리로 데이터 입력하기?
drop table dept02 purge;

create table dept02 as select * from dept where 1=0;
select * from dept02;

-- 서브쿼리로 데이터 입력
insert into dept02 select * from dept;
-- dept 테이블의 데이터 입력됨
insert into dept02 select * from dept02;

-- insert all 명령문으로 다중테이블에 데이터 입력

create table emp_hir as select empno, ename, hiredate from emp where 1=0;
create table emp_mgr as select empno, ename, mgr from emp where 1=0;
select * from emp_hir;
select * from emp_mgr;

insert all 
into emp_hir values(empno, ename, hiredate)
into emp_mgr values(empno, ename, mgr)
select empno, ename, hiredate, mgr from emp where deptno = 20;

-- 2. update : 데이터 수정
-- 형식 : update 테이블 set 컬럼1 = 수정할 값1, 컬럼2 = 수정할 값2...
-- where 조건절; where조건절을 사용하지않으면 모든 값이 업데이트가 된다.

drop table emp01 purge;

create table emp01 as select * from emp;
select * from emp01;

update emp01 set deptno = 30;

-- 급여인상 부럽다
update emp01 set sal = sal * 1.1;

update emp01 set hiredate = sysdate;

drop table emp02 purge;

create table emp02 as select * from emp;
select * from emp02;

-- 급여가 3000 이상인 사원만 급여를 10%인상 ...
update emp02 set sal = sal * 1.1 where sal >= 3000;

-- 1987년도 입사자만 입사일을 오늘로 수정
update emp02 set hiredate = sysdate where hiredate between '1987/01/01' and '1987/12/31';

-- scott 사원의 입사일을 오늘 날짜로 수정, 급여를 50으로 수정 커미션을 4000으로 수정

update emp02 set hiredate = sysdate,  sal = 50 , comm = 4000 where ename = 'SCOTT';

-- 서브쿼리를 이용한 데이터 수정
-- 20번 부서의 지역명(DALLAS)를 40번 부서의 지영명으로 변경 (BOSTON)

drop table dept02;
create table dept02 as select * from dept;
update dept02 set loc = (select loc from dept where deptno = '40') where deptno = '20'; 
select * from dept02;


--3. delete : 데이터 삭제
-- 형식 : delete from 테이블 where  조건절;

-- 1) 모든 데이터 삭제 : where 조건절을 사용하지 않는다.

delete from dept01;
rollback;


-- merge :구조가 같은 2개의 테이블을 하나의 테이블로 합치는 기능
-- 기존에 존재하는 행이 있으면 새로운 값으로 update,
-- 

select *from emp;

drop table emp02 purge;

create table emp02 as select * from emp where job='MANAGER';

select * from emp02;

update emp02 set job= 'TEST';

insert into emp02 values(8000, 'AHN', 'TOP', 7566,  '2023/08/22', 1200, 10, 20);

merge into emp01 using emp02 on (emp01.empno = emp02.empno)
when matched then update set emp01.ename = emp02.ename,
emp01.job = emp02.job,
emp01.mgr = emp02.mgr,
emp01.hiredate = emp02.hiredate,
emp01.sal = emp02.sal,
emp01.comm = emp02.comm,
emp01.deptno = emp02.deptno
when not matched then
insert values (emp02.empno, emp02.ename, emp02.job,emp02.mgr,emp02.hiredate,
emp02.sal,emp02.comm,emp02.deptno);

select * from emp01;






-- 트랜잭션(Transaction)
-- 1. 논리적인 작업단위
-- 2. 논리적인 작업은 DML (insert, update, delete)SQL문으로 시작
-- 3. 데이터의 일관성을 유지하면서, 데이터를 안정적으로 복구하기 위해서 사용이 된다.
-- 4. 트랜잭션은 All-or-Nothing 방식으로 처리가 된다.

-- TCL(Transaction Control Language)
-- COMMIT : Transaction을 종료
-- ROLLBACK : Transaction을 취소
-- SAVEPOINT : 복구할 시점(저장점)을 지정하는 역할

-- 실습

drop table dept01 purge;
create table dept01 as select * from dept;
select * from dept01;

-- 1. rollback : 트랜잭션 취소
delete from dept01;

rollback;

-- 2. commit : 트랜잭션 종료
-- 메모리 상에서 처리된 DML SQL문을 데이터베이스에 영구적으로 반영하게 된다.

delete from dept01 where deptno = 20 ;

commit;

















