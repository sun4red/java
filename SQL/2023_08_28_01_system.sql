--2023-08-28
--롤~
-- ROLE 여러가지 권한을 묶어놓은것
-- ex) connect role(8가지), resource role(20여개의 권한), dba role(130여개의 권한)


create user user04 identified by tiger;

select * from dba_users;

-- user04 에게 시스템 권한 role 부여, connect, resource

grant connect, resource to user04;
revoke connect, resource from user04;

select * from user04.test0828;

insert into user04.test0828 values('선홍',20);


-- 사용자 정의 롤 만들기

create role mrole;
grant create session, create table, create view to mrole;

create user user05 identified by tiger;
grant mrole to user05;


----------------------------
--사용자 정의 롤 생성
-- 롤에 객체권한을 부여

create role mrole02;
conn scott/tiger -- 객체권한은 객체 소유자가 권한을 부여해야함
grant select on scott.emp to mrole02;
grant mrole02 to user05;


----------------------------
-- 디폴트 롤을 생성해서 여러 사용자에게 롤을 부여
-- 디폴트 롤 = 시스템 권한 + 객체권한

-- 1. .디폴트 롤 생성

conn system/oracle
create role def_role;
grant create session, create table to def_role;

conn scott/tiger

-- 생성된 롤 (def+role)에 객체 권한을 추가
conn scott/tiger
grant select on scott.emp to def_role;
grant update on scott.emp to def_role;
grant delete on scott.emp to def_role;

create user usera1 identified by tiger;
create user usera2 identified by tiger;
create user usera3 identified by tiger;

-- def_role 생성된 계정에 부여
--이건 또 시스템 계정에서 해야함
conn system/oracle
grant def_role to usera1;
grant def_role to usera2;
grant def_role to usera3;
revoke def_role from usera2;

-- usera1 접속 후 확인

--롤회수~~~
-- 형식 : revoke 롤 이름 from 사용자명

revoke mrole, mrole02 from user05;

-- 롤 삭제
drop role mrole;
drop role mrole02;

----------------------------------------------
-- 동의어 (synonym) : 같은 의미를 가진 단어.
-- 1. 비공개 동의어
--   : 객체에 대한 접근 권한을 부여받은 사용자가 정의하는 동의어로써
--     동의어를 만든 사용자만 사용할 수 있다.

-- 2. 공개동의어
--    : DBA권한 소유자만 생성이 가능하며, 누구나 사용할 수 있다.
-- ex)
-- sys.tab -> tab
-- sys.seq -> seq
-- sys.dual -> dual

-- 비공개 동의어 예
-- 만들기!
-- 비공개동의어는 사용이 필요한 유저가 만드는 것, 만든 유저만 사용할 수 있다.

create table systbl(ename varchar2(20));

insert into systbl values('선홍');
insert into systbl values('선선');
insert into systbl values('홍홍');

select * from systbl;

grant select on systbl to scott;
grant create synonym to scott;

-- 공개동의어

create public synonym stbl for systbl;
select * from dba_synonyms;
drop public synonym stbl;


