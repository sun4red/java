--2023-08-25-04




-- 객체 권한
-- 오라클의 객체 : 테이블, 뷰, 시퀀스, 인덱스, 동의어, 프로시저, 트리거

-- 1. 새로 생성된 user01 계정에게 scott계정 소유의 emp 테이블 객체에 대한
--      select 객체 권한을 부여해보자


conn scott/tiger
grant select on emp to user01;

user01 계정으로 접속 후 emp테이블 객체에 대해 select를 실행

conn user01/tiger
select * from emp;
-- 조회를 할때는 테이블의 소유자 명까지 표기!


select * from dept;

revoke select on emp from user01;


--with grant option
--user02 계정에게 scottt 계정 소유의 emp테이블 객체에 대해서 select 객체 권한을 부여할때
--with grant option을 붙여서 권한이 부여되면, user02계정은 자기가 부여받은 권한을
--제3의 계정(user01)에게 재부여할 수있다

grant select on emp to user01 with grant option;

