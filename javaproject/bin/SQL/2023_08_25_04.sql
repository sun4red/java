--2023-08-25-04




-- ��ü ����
-- ����Ŭ�� ��ü : ���̺�, ��, ������, �ε���, ���Ǿ�, ���ν���, Ʈ����

-- 1. ���� ������ user01 �������� scott���� ������ emp ���̺� ��ü�� ����
--      select ��ü ������ �ο��غ���


conn scott/tiger
grant select on emp to user01;

user01 �������� ���� �� emp���̺� ��ü�� ���� select�� ����

conn user01/tiger
select * from emp;
-- ��ȸ�� �Ҷ��� ���̺��� ������ ����� ǥ��!


select * from dept;

revoke select on emp from user01;


--with grant option
--user02 �������� scottt ���� ������ emp���̺� ��ü�� ���ؼ� select ��ü ������ �ο��Ҷ�
--with grant option�� �ٿ��� ������ �ο��Ǹ�, user02������ �ڱⰡ �ο����� ������
--��3�� ����(user01)���� ��ο��� ���ִ�

grant select on emp to user01 with grant option;

