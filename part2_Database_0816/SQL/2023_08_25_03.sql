2023-08-25_03

create user user01 identified by tiger;

grant create session to user01;
grant create table to user01;



--with admin option
-- grant ������� ������ �ο� ���� �� with admin option�� �ٿ��� ������ �ο��Ǹ�
-- ������ �ο����� ������ �ڱⰡ �ο� ���� ������ �� 3�� �������� ��ο��Ҽ��ִ�.


-- 1. ���ο� ����

create user user02 identified by tiger;
grant create session to user02 with admin option;


create user user03 identified by tiger;


