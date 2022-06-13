-- newbook ���̺� ���� (�⺻)
create table NewBook (
  bookid    number,
  bookname  varchar2(20),
  publisher varchar2(20),
  price     number
);

-- newbook ���̺� ����(��������)
create table NewBook (
  bookid    number,  -- PRIMARY KEY,
  bookname  varchar2(20),
  publisher varchar2(20),
  price     number default (1000) check(price >= 1000),
  PRIMARY KEY(bookid)
);

-- newcustomer ���̺� ����
create table newcustomer (
  custid    number,
  name      varchar2(40),
  address   varchar2(40),
  phone     varchar2(30)
);

-- neworders ���̺� ����
create table neworders (
  orderid   number,
  custid    number,
  bookid    number,
  saleprice number,
  orderdate date
--  constraint neworders_ordersid_pk PRIMARY KEY(orderid),
--  constraint neworders_custid_fk foreign key(custid) references newcustomer(custid)
);

-- �⺻Ű
alter table neworders add constraint neworders_orderid_pk primary key (orderid);
alter table newcustomer add constraint newcustomer_custid_pk PRIMARY KEY (custid);
alter table newbook add constraint newbook_bookid_pk primary key (bookid);

-- not null ��������
alter table neworders modify custid constraint neworders_custid_nn not null; 
alter table neworders modify bookid constraint neworders_bookid_nn not null;

-- �ܷ�Ű
alter table neworders add constraint neworders_custid_fk foreign key(custid) 
  references newcustomer(custid) on delete set null;
alter table neworders add constraint neworders_bookid_fk foreign key(bookid) 
  references newbook(bookid);

-- �������� ����
alter table neworders drop constraint neworders_custid_fk;
alter table neworders drop constraint neworders_custid_nn;

-- �������� ��ȸ  
select * from user_constraints where table_name = 'NEWORDERS';
  
-- ���̺� ���� �� �������� �߰� 
alter table newbook add Constraint newbook_bookid_pk primary key (bookid);
alter table newbook add Constraint newbook_price_ch check(price>1000);

-- ���̺� ���� �� default ���� (oracle���� default�� ������ �ƴϴ�) 
alter table newbook modify price default 1000;

-- �׽�Ʈ (��������)
desc newbook;
insert into newbook values (1,'�����ͺ��̽�','�Ѻ�',-30000);
insert into newbook values (2,'�����ͺ��̽�','�Ѻ�',30000);
select * from newbook;
INSERT INTO newbook VALUES (null,null,null,null);
insert into newbook (bookid, bookname, publisher)values (3,'�ڹ�','����');

-- ���̺� ����
drop table newbook;
drop table newcustomer;
drop table neworders;

select * from newcustomer;
select * from newbook;
select * from neworders;

--�׽�Ʈ 2 (�������Ἲ)
insert into newcustomer values (1,'ȫ�浿' , '��� ����', '010-1111-1111');
insert into newbook values (1,'�����ͺ��̽�' , '�Ѻ�', 30000);
insert into neworders values (1,1,1,15000,'20220101');
desc neworders;
commit;

delete from newcustomer where custid = 1;
