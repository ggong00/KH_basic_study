-- (1-1) ������ȣ�� 1�� ������ �̸�
select bookid ������ȣ, bookname "������ �̸�" 
  from book
  where bookid = 1;
  
-- (1-2) ������ 20000�� �̻��� ������ �̸�
select bookname "������ �̸�", price
  from book
  where price >= 20000;
  
-- (1-3 ex1) �������� �� �ݾ� (�������� ��ȣ�� 1�� ����)
select custid ������, sum(saleprice) "�� ���ž�"
  from orders
  where custid = 1
  group by custid;
-- (1-3 ex2) �������� �� �ݾ�
select c.name �̸�, sum(saleprice) �ѱ��ž�
  from orders o inner join customer c on o.custid = c.custid
  where c.name = '������'
  group by c.name;  
  
-- (1-4 ex1) �������� ������ ������ �� (�������� ��ȣ�� 1�� ����)
select custid ������, count(*) "������ ��" 
  from orders
  where custid = 1
  group by custid;
-- (1-4 ex2) �������� ������ ������ ��  
select c.name �̸�, count(*) "���� ��"
  from orders o inner join customer c on o.custid = c.custid
  where c.name = '������'
  group by c.name;  
  
-- (2-1) ������ ������ �� ����
select count(*) "������ �� ����"
  from book;

-- (2-2) ���缭���� ������ ����ϴ� ���ǻ��� �� ����
select count(distinct publisher) "���ǻ��� �� ����"
  from book;
  
-- (2-3) ��� ���� �̸�, �ּ�
select c.name ���̸�, c.address �ּ�
  from customer c;
  
-- (2-4) 2020�� 7�� 4 ~ 7�� ���̿� �ֹ� ���� ������ �ֹ���ȣ
select orderid �ֹ���ȣ, orderdate �ֹ���¥
  from orders
  where orderdate between '2020-07-04' and '2020-07-07';
  
-- (2-5) 2020�� 7�� 4 ~ 7�� ���̿� �ֹ� ���� ������ ������ ������ �ֹ���ȣ
select orderid �ֹ���ȣ, orderdate �ֹ���¥
  from orders
  where orderdate not between '20200704' and '20200707';
  
-- (2-6) ���� '��' ���� ���� �̸��� �ּ�
select name �̸� , address �ּ�
  from customer
  where name like '��%';
  
-- (2-7) ���� '��' ���̰� �̸��� '��'�� ������ ���� �̸��� �ּ�
select name �̸� , address �ּ�
  from customer
  where name like '��%��';
  
-- (2-8 ex1) �ֹ����� ���� ���� �̸�
select name
  from customer
  where custid not in (select custid from orders);
-- (2-8 ex2)  
select c.name
  from customer c
  where not exists (select * from orders o where c.custid = o.custid);  
  
select * from customer;    
-- (2-9) �ֹ� �ݾ��� �Ѿװ� �ֹ��� ��� �ݾ�
select sum(saleprice) "�ֹ� �ݾ��� �Ѿ�" , avg(saleprice) "�ֹ��� ��� �ݾ�"
  from orders;
  
-- (2-10) ���� �̸��� ���� ���ž�
select c.name, sum(o.saleprice), count(*)
  from customer c left outer join orders o on c.custid = o.custid
  group by c.name;
  
-- (2-11) ���� �̸��� ���� ������ ���� ���
select c.name , b.bookname 
  from customer c left join orders o
                    on c.custid = o.custid
                  left join book b
                    on o.bookid = b.bookid;
                         
-- 2-12 ������ ���ݰ� �ǸŰ����� ���̰� ���� ���� �ֹ�
                                        
--(1) insert ����
select * from book;
desc book;
-- ���� : �⺻Ű not null
insert into book (bookname, publisher, price)
  values ('������ ����', '���ѹ̵��', 10000);
-- �ذ��� : �⺻Ű�� ���� �־��ش�.
insert into book (bookid, bookname, publisher, price)
  values (11 , '������ ����', '���ѹ̵��', 10000);
  
--(2) delete ����
delete from book
  where publisher = '�Ｚ��';
     
select * from book;  

--(3) delete ���� 2
select * from book;
--���� (���ڵ尡 �ٸ� ���̺� �����ǰ� ����)
delete from book where publisher = '�̻�̵��';
--�ذ��� (�����ǰ��ִ� ���ڵ� ����)
delete from orders where bookid in(7,8);
  
select * from orders;   
    
--(4) update ����
update book set publisher = '�������ǻ�'
  where publisher = '���ѹ̵��';
  
select * from book;  

rollback;
commit;

select * from book;