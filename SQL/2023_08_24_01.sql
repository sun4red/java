--2023-08-24










-- 1. 부모테이블 생선


drop table dept01 purge;

create table dept01(
deptno number(2) primary key,
dname varchar2(14),
loc varchar2(13));

insert into dept01 values (10, 'ACCOUNTING', 'NEW YORK');
select * from dept01;

-- 2. 자식 테이블 생성

drop table emp01 purge;

create table emp01(
empno number(4) primary key,
ename varchar2(10) not null,
job varchar2(10) unique,
deptno number(2) references dept01(deptno) );

insert into emp01 values(1111, '홍길동', '개발자' , 10 );
select * from emp01;

-- 삭제 불가
delete from dept01;
rollback;

-- 4. 자식테이블의 외래키 제약조건 비활성화
-- 부모테이블의 데이터를 삭제하기위해서 자식테이블의 외래키 제약조건을 비활성화

alter table emp01 disable constraint SYS_C007047;
alter table emp01 enable constraint SYS_C007047;

-- cascade

-- 1. cascade 옵션을 붙여 부모테이블의 제약조건을 비활성화 시키면 참조하고있는
-- 자식테이블의 외래키 제약조건도 같이 비활성화
alter table dept01 disable constraint SYS_C007043 cascade;

-- 2. cascade 옵션을 붙여서 부모테이블의 primary key를 제거하면,
-- 참조하는 자식테이블의 foregin key 제약조건도 같이 제거해 준다.
alter table dept01 drop constraint SYS_C007043 cascade;

alter table dept01 add primary key(deptno);
alter table emp01 add foreign key(deptno) references dept01(deptno);

alter table dept01 drop primary key cascade;

drop table dept01 purge;
create table dept01(
deptno number(2) primary key,
dname varchar2(14),
loc varchar2(13));

create table emp01(
empno number(4) primary key,
ename varchar2(10) not null,
job varchar2(10) unique,
deptno number(2) references dept01(deptno) on delete cascade);
-- 부모테이블의 데이터가 삭제되면 자식 테이블의 데이터도 삭제가됨


-- 뷰 VIEW 기본테이블을 이용해서 만들어진 가상 테이블
-- 실습을 위한 기본테이블 생성 dept_copy, emp_copy
-- 2개의 기본 테이블 생성

create table dept_copy as select * from dept;
create table emp_copy as select * from emp;

select * from tab;
select * from dept_copy;
select * from emp_copy;

create view emp_view30
as
select empno, ename, deptno from emp_copy
where deptno = 30;

select * from emp_view30;

-- 뷰에 insert로 데이터 입력 했을 경우에, 기본 테이블에도 입력되는지
insert into emp_view30 values(1111,'길동','30');

-- 된다.

-- 단순뷰 / 복합뷰

-- 단순뷰 
create view emp_view20 as select empno, ename, deptno, mgr from emp_copy
where deptno = 20;

select * from emp_view20;

-- 복합뷰
create view complex_view as select empno, ename, dept_copy.deptno, dname
from emp_copy, dept_copy
where emp_copy.deptno = dept_copy.deptno;

select * from complex_view;

create view sal_view as select dname, max(sal) as max, min(sal) as min
from emp_copy, dept_copy
where emp_copy.deptno = dept_copy.deptno
group by dname;

select * from sal_view;

-- 뷰 생성 옵션

-- 1. or replace 옵션
-- 기존에 뷰가 존재하지 않으면 뷰를 생성하고, 만일에 동일한 이름을 가진 뷰가 존재하면
-- 뷰의 내용을 수정하도록 만들어주는 옵션

-- 1) or replace 옵션 없디 동일한 뷰 생성 시 오류 발생

create view emp_view30
as
select empno, ename, deptno, sal, comm from emp_copy
where deptno = 30;

-- 2) or replace 옵션을 붙여서 동일한 뷰를 생성
create or replace view emp_view30
as
select empno, ename, deptno, sal, comm from emp_copy
where deptno = 30;

select * from emp_view30;

-- 2. with check option
-- where 조건 절에 사용된 값을 수정하지 못하도록 만들어주는 옵션

-- 1) with check option 사용하지 않은 경우
-- 2) with check option 사용한 경우

create or replace view emp_view30
as select empno, ename, deptno, sal, comm 
from emp_copy where deptno=30;

create or replace with check opt view emp_view30
as select empno, ename, deptno, sal, comm 
from emp_copy where deptno=30;


-- 급여 30, 부서번호 30번에서 20

update emp_view30 set deptno = 20 where sal >== 1200

drop table emp_copy purge;
create table emp_copy as select from emp;

create or replace view emp_view30
as select empno, ename, deptno, sal, comm from emp_copy where deptno = 30
with check option;

-- 3. with read only 
-- 읽기전용의 뷰를 만들어주는 옵션
-- 뷰를 통해서 기본테이블의 내용을 수정하지 못하도록 만들어주는 역할

create or replace view view_read30
as select empno, ename, sal, comm, deptno from emp_copy
where deptno=30 with read only;

select * from view_read30;
select * from user_views;

-- 생성된 뷰 수정

update view_read30
set sal = 3000;

-- rownum 컬럼
-- 1. 데이터의 검색 순서를 가지고있는 논리적인 컬럼이다.
-- 2. rownum 값은 1번부터 시작된다.
-- 3. rownum 값은 order by 절로 정렬하더라도 값이 바뀌지 않는다.
-- 4. rownum 값을 변경하기 위해서는 테이블을 변경해야한다.


select rownum, rowid, deptno, dname, loc from dept;
-- 직접 만들지 않았으나 자동생성된 번호

select rownum, ename, sal from emp;
select rownum, ename, sal from emp where ename = 'WARD';

select rownum, ename, sal from emp order by sal desc;
-- order by 절로도 값은 바뀌지 않음

-- 입사일 빠른 5명 기릿

select ename, hiredate from emp order by hiredate asc;

-- 2) 뷰생성

create or replace view hire_view
as select empno,ename,hiredate from emp order by hiredate asc;

--3) 출력
select rownum, ename, hiredate from hire_view;

-- 완성
select rownum, ename, hiredate from hire_view where rownum <=5 ;

-- 4) 인라인뷰 = 서브쿼리로 만들어진 뷰

select rownum, ename, hiredate from (
select empno, ename, hiredate from emp order by hiredate asc)
where rownum <= 5 ;


select rownum, empno, ename from(
select empno, ename from emp order by empno asc)
where rownum <=5 ;

-----------------------------------------------------------
select rownum, empno, sal from(
select empno, sal from emp order by sal desc)
where rownum <= 5 ;





