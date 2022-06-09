-- 1
select name �̸�, address �ּ�, phone ����ó
  from customer;
  
-- 2
select *
  from  customer
  where address like '���ѹα�%';
  
-- 3
select name �̸�
  from customer
  where phone is null;
  
-- 4
select count(distinct publisher) "���ǻ��� �� ����"
  from book;
  
-- 5
select *
  from book
  where bookname like '%����%';
  
-- 6
select count(orderid) �ֹ��Ǽ�, avg(saleprice) ����Ǹž�, max(saleprice) �ִ��Ǹž�,
        min(saleprice) �ּ��Ǹž�, sum(saleprice) "�� �Ǹž�"
  from orders;

-- 7
select publisher ���ǻ�, count(*) �����Ǽ�
  from book
  group by publisher
  order by count(*) desc;
  
-- 8
select publisher ���ǻ�, count(*) �����Ǽ�, max(price) �ְ���,
        min(price) ��������, sum(price) "���������� ��"
  from book
  group by publisher
  order by publisher;
  
-- 9
select max(price) - min(price) "���� ��� ������ �� ������ ��������"
  from book;
  
-- 10 *
select custid ����ȣ, count(*) ���ŰǼ�
  from orders
  group by custid
  having count(*) >= 2
  order by ���ŰǼ� desc;

-- 11
select orderid �ֹ���ȣ
  from orders
  where orderdate not between '20200704' and '20200707';

-- 12
select orderdate �ֹ�����, sum(saleprice) �����
  from orders
  group by orderdate
  order by ����� desc;
  
-- 13 *
select orderdate �ֹ�����
  from orders
  where orderdate > '20200702'
  group by orderdate
  having sum(saleprice) > 20000
  order by orderdate desc;

-- 14
select publisher ���ǻ�
  from book 
  group by publisher
  having count(*) >= 2;
  
--15
-- 1) ���� : �⺻Ű���� not null 
insert into book (bookname, publisher, price)
  values ('�����ͺ��̽�', '�Ѻ�', 30000);
-- 2) �ذ� : �⺻Ű���� �߰�
insert into book (bookid, bookname, publisher, price)
  values ('11','�����ͺ��̽�', '�Ѻ�', 30000);

commit;
select * from book;

-- 16
update book set publisher = '�������ǻ�' 
  where publisher = '���ѹ̵��';

commit;  
select * from book;

-- 17
update book set price = price*1.1
  where publisher = '�½�����';

commit;
select * from book;

-- 18
update customer set address = '���ѹα� ���'
  where name = '�߽ż�';

commit;
select * from customer;

-- 19
delete customer 
  where phone is null;
  
commit;  
select * from customer; 
 
-- 20
--1) ���� : '������'�� name�� ������ ���ڵ��� �⺻Ű��
--   orders ���̺� �����ǰ��־� ���Ἲ �������ǿ� ���谡 �ȴ�.
delete customer 
  where name = '������';
  
  