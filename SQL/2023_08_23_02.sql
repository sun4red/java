--2023-08-23


-- 무결성 제약조건
-- 테이블에 부적절한 데이터가 입력되는 것을 막기 위해서 테이블을 생성할 때
-- 각 컬럼에 대해서 정의하는 여러가지 규칙
-- not null, unique, primary key, foregin key, check, default

-- 1. not null
-- null 값을 허용하지 않는다.

drop table emp02 purge;

create table emp02(
empno NUMBER(4) not null,
ename varchar2(12)not null,
job varchar2(12),
deptno number(2) );

select * from emp02;
desc emp02;

-- 제약조건에 위배되지 않는 데이터 입력
insert into emp02 values(1111,'홍길동', '매니저',30);

-- 제약조건 (NOT NULL)에 위배되는 값
insert into emp02 values(null,'김','매니',30);
insert into emp02(job, deptno) values ('입력불가',30);


-- 2. unique 제약조건
-- 유일한 값만 입력할 수 있다.
-- 중복된 값을 입력할 수 없다.
-- null 값은 입력될 수 있다.

drop table emp03 purge;

create table emp03 (
empno number(4) unique,
ename varchar(12) not null,
job varchar2(12),
deptno number(2) );

select * from emp03;

-- 정상적인 데이터

insert into emp03 values ( 1111, '홍길동' , '개발자' , 10);

-- 위배되는 데이터

insert into emp03 values (1111, '입력안됨', '배고파', 20);

insert into emp03 values (null, '홍','개발자',20);

-- 3. primary key (기본키) 제약조건
-- primary key = not null + unique
-- 반드시 중복되지 않는 값을 저장해야한다


select * from emp;


drop table emp05 purge;

create table emp05 (
empno number (4) primary key,   -- 반드시 중복되지 않은 값을 입력
ename varchar2(12) not null,       -- 반드시 값을 입력
job varchar2(12),
deptno number(2) );

select  * from emp05;

insert into emp05 values(1111,'홍길동', '개발자',20);
insert into emp05 values(1111,'홍길동', '개발자',20); -- unuque 제약조건 위배
insert into emp05 values(null,'홍길동', '개발자',20);    -- not null 제약조건 위배


-- 제약조건 이름(constraint name)을 설정해서 테이블 생성
drop table emp04 purge;
create table emp04(
empno number(4) constraint emp04_empno_uk unique,
ename varchar2(10) constraint emp04_ename_nn not null,
job varchar2(10),
deptno number(2) );

select * from emp04;
desc emp04;

-- 4. foregin key (외래키) 제약조건
-- dept (부모테이블) - deptno(pk) : 부모키 : 10, 20, 30, 40
-- emp (자식테이블) - deptno(fk): 외래키 : 10, 20, 30

-- 1) 사원테이블 (EMP)deptno 컬럼이 foreign key 제약조건이 설정되어 있다.
-- 2) foreign key 제약조건이 가지고 있는 의미는 부모테이블(DEPT)의 부모키(DEPTNO)의 값만 참조
-- 3) 부모키가 되기 위한 조건은 primary key나 unique 제약조건으로 설정되어있어야한다.

-- 사원테이블(EMP)에 새로운 신입사원을 등록
select * from emp;
insert into emp ( empno, deptno) values(1111, 50);

drop table emp06 purge;

create table emp06 (
empno number(4) primary key,
ename varchar2(10) not null,
job varchar2(10),
deptno number(2) references dept(deptno) ) ;

select * from emp06;
desc emp06;
insert into emp06 values(1111,'홍길동','개발자',10);
insert into emp06 values(1122,'홍길동','개발자',20);
insert into emp06 values(1123,'홍길동','개발자',30);
insert into emp06 values(1134,'홍길동','개발자',40);
insert into emp06 values(1135,'홍길동','개발자',50);
insert into emp06 values(1136,'홍길동','개발자',60);

-- 5. check 제약조건
-- 데이터가 입력될 때 특정 조건을 만족하는 데이터만 입력되도록 만들어주는 제약조건


-- 급여 500 ~  5000 
-- 성별 M or F

create table emp07(
empno number(4) primary key,
ename varchar2(10) not null,
sal number(7,2) check(sal between 500 and 5000),
gender varchar2(1) check(gender in ('M','F')) );

select * from emp07;
insert into emp07 values(1111, '길도옹', 2000,'M');
insert into emp07 values(1112, '홍길동',30000,'M');
insert into emp07 values(1211, '킬동', 1500,'X');

-- 6. DEFAULT 제약조건
-- 제약조건이 설정된 컬러메 값이 입력되지 않으면, default로 설정된 값이 자동 입력

drop table dept01 purge;
create table dept01(
deptno number(2) primary key,
dename varchar2(12),
loc varchar(13) default 'SEOUL');


drop  table emp02 purge;

create table emp02(
empno number(4),
ename varchar2(15) not null,
job varchar2(10),
deptno number(4),
primary key(empno),
unique(job),
foreign key(deptno) references dept(deptno) );

-- 제약조건을 설정할 때 테이블 레벨 방식만 가능한 경우
-- 1. 기본키를 복합키로 사용하는 경우 (기본키 제약조건을 2개 이상 생성하는 것)
-- 2. alter table 명령으로 제약조건을 추가하는 경우

-- 1. 2개 이상의 컬럼을 기본키로 설정
drop table member01 purge;

-- 1) 컬럼 레벨 방식으로 2개의 컬럼을 primary key로 설정

create table member01(
id varchar2(20) primary key,
passwd varchar2(20) primary key);   -- 안된다.

-- 2) 테이블 레벨 방식
 create table member01(
 id varchar2(20),
 passwd varchar2(20),
 primary key(id, passwd) );
 
 select * from member01;

-- 2. alter table 명령으로 제약조건을 추가하는 경우
drop table emp01 purge;

-- 제약조건 X
create table emp01(         -- primary
empno number(4),           -- not null
ename varchar2(15),
job varchar2(10),
deptno number(2) );

alter table emp01 add primary key(empno);
alter table emp01 modify ename not null;
alter table emp01 add unique(job);
alter table emp01 add foreign key(deptno) references dept;

select * from emp01;


alter table emp01 drop constraint SYS_C007039;
alter table emp01 drop primary key;

alter table emp01 drop constraint SYS_C007040;


