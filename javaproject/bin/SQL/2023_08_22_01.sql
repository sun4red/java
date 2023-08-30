--2023_08_22

select * from emp;

create table emp02 as select * from emp;

select * from emp02;

-- 원하는 컬럼으로 구성된 복사본 테이블
create table emp03 as select empno, ename from emp;

select * from emp03;

-- 원하는 행으로 구성된 복사본 테이블
create table emp04 as select  * from emp where deptno = 10;
select * from emp04;

-- 테이블 구조만 복사
create table emp05 as select * from emp where 1=0;
select * from emp04;

-- alter
-- 테이블 구조 변경 (컬럼추가, 컬럼수정, 컬럼삭제)
-- 1) 컬럼 추가
alter table emp02 add(job2 varchar2(10));
desc emp02;

-- 2) 컬럼 수정
--      i) 수정할 컬럼에 데이터가 없는 경우
--          수정할 컬럼의 데이터 타입 변경 가능
--          컬럼의 크기도 변경이 가능
--      ii) 수정할 컬럼에 데이터가 있는 경우
--          컬럼의 데이터 타입을 변경할 수 없다.
--          컬럼의 크기는 늘릴수는 있지만 현재 저장된 데이터 크기보다 작은 크기로 변경 불가

alter table emp02 modify(job2 varchar2(30));
desc emp02;

-- 3) 컬럼 삭제
alter table emp02 drop column job2;
alter table emp02 drop(job2);

-- 3. rename
-- 테이블 이름 변경
-- 형식 : rename old_name to new_name;

rename emp02 to emp021;
select * from emp021;
select * from emp02;

-- 4. truncate
-- 테이블의 모든 데이터를 삭제
-- 형식 : truncate table table_name;
truncate table emp021;
select * from emp021;

-- 5. drop
-- 테이블 삭제
drop table emp021;  -- 이렇게 하면 임시테이블로 교체 (오라클 10g버전 이후)
select * from emp021;
drop table emp03 purge; --완전한 삭제
select * from emp03;
select * from tab;

-- 임시 테이블 삭제
purge recyclebin;

-- (user 로 작성하면 본인 계정의 내용 조회)
select * from user_views;
select * from user_sequences; 

select * from user_tables;
select * from user_indexes;


-- 데이터베이스 관리자(DBA)만 접근할 수 있는 객체에 대해서
select table_name from dba_tables; (DBA계정만 사용 가능)

-- 오라클 시스템의 모든 계정 정보 검색
select user_name from dba_users;