--newbook ���̺� ����
create table newbook (
  bookid      number,
  bookname    varchar2(20),
  publisher   varchar2(20),
  price       number
);

--�÷� �߰�
alter table newbook add isbn varchar2(13);

--�÷� ����
alter table newbook modify isbn number;

--�÷� ����
alter table newbook drop column isbn;

--�÷� not null �������� �߰�
alter table newbook modify bookid number not null; 

--�÷� not null �������� �߰�(�̸����)
alter table newbook modify bookid constraint newbook_bookid_nn not null;

--�÷� �⺻Ű �������� �߰�
alter table newbook add primary key(bookid);

--�÷� �⺻Ű �������� �߰�(�̸����)
alter table newbook add constraint newbook_bookid_pk primary key(bookid);

--���̺� ����
drop table newbook;

select * from user_constraints where table_name = 'NEWBOOK';
desc newbook;
