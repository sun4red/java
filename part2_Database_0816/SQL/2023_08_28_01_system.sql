--2023-08-28
--��~
-- ROLE �������� ������ ���������
-- ex) connect role(8����), resource role(20������ ����), dba role(130������ ����)


create user user04 identified by tiger;

select * from dba_users;

-- user04 ���� �ý��� ���� role �ο�, connect, resource

grant connect, resource to user04;
revoke connect, resource from user04;

select * from user04.test0828;

insert into user04.test0828 values('��ȫ',20);


-- ����� ���� �� �����

create role mrole;
grant create session, create table, create view to mrole;

create user user05 identified by tiger;
grant mrole to user05;


----------------------------
--����� ���� �� ����
-- �ѿ� ��ü������ �ο�

create role mrole02;
conn scott/tiger -- ��ü������ ��ü �����ڰ� ������ �ο��ؾ���
grant select on scott.emp to mrole02;
grant mrole02 to user05;


----------------------------
-- ����Ʈ ���� �����ؼ� ���� ����ڿ��� ���� �ο�
-- ����Ʈ �� = �ý��� ���� + ��ü����

-- 1. .����Ʈ �� ����

conn system/oracle
create role def_role;
grant create session, create table to def_role;

conn scott/tiger

-- ������ �� (def+role)�� ��ü ������ �߰�
conn scott/tiger
grant select on scott.emp to def_role;
grant update on scott.emp to def_role;
grant delete on scott.emp to def_role;

create user usera1 identified by tiger;
create user usera2 identified by tiger;
create user usera3 identified by tiger;

-- def_role ������ ������ �ο�
--�̰� �� �ý��� �������� �ؾ���
conn system/oracle
grant def_role to usera1;
grant def_role to usera2;
grant def_role to usera3;
revoke def_role from usera2;

-- usera1 ���� �� Ȯ��

--��ȸ��~~~
-- ���� : revoke �� �̸� from ����ڸ�

revoke mrole, mrole02 from user05;

-- �� ����
drop role mrole;
drop role mrole02;

----------------------------------------------
-- ���Ǿ� (synonym) : ���� �ǹ̸� ���� �ܾ�.
-- 1. ����� ���Ǿ�
--   : ��ü�� ���� ���� ������ �ο����� ����ڰ� �����ϴ� ���Ǿ�ν�
--     ���Ǿ ���� ����ڸ� ����� �� �ִ�.

-- 2. �������Ǿ�
--    : DBA���� �����ڸ� ������ �����ϸ�, ������ ����� �� �ִ�.
-- ex)
-- sys.tab -> tab
-- sys.seq -> seq
-- sys.dual -> dual

-- ����� ���Ǿ� ��
-- �����!
-- ��������Ǿ�� ����� �ʿ��� ������ ����� ��, ���� ������ ����� �� �ִ�.

create table systbl(ename varchar2(20));

insert into systbl values('��ȫ');
insert into systbl values('����');
insert into systbl values('ȫȫ');

select * from systbl;

grant select on systbl to scott;
grant create synonym to scott;

-- �������Ǿ�

create public synonym stbl for systbl;
select * from dba_synonyms;
drop public synonym stbl;


