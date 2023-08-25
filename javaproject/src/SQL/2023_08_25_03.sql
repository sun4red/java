2023-08-25_03

create user user01 identified by tiger;

grant create session to user01;
grant create table to user01;



--with admin option
-- grant 명령으로 권한을 부여 받을 때 with admin option을 붙여서 권한이 부여되면
-- 권한을 부여받은 계정은 자기가 부여 받은 권한을 제 3의 계정에게 재부여할수있다.


-- 1. 새로운 계정

create user user02 identified by tiger;
grant create session to user02 with admin option;


create user user03 identified by tiger;


