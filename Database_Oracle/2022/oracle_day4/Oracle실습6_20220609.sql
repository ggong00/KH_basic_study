SELECT CUSTOMER.* 
  FROM CUSTOMER,ORDERS;

SELECT ORDERS.*
  FROM CUSTOMER, ORDERS;
  
SELECT ORDERS.*,CUSTOMER.*
  FROM CUSTOMER, ORDERS;
  
SELECT CUSTOMER.NAME, ORDERS.ORDERDATE
  FROM CUSTOMER, ORDERS;
  
SELECT T1.NAME , T2.ORDERDATE
  FROM CUSTOMER T1, ORDERS T2; 

select distinct c.name
  from customer c , orders o
  where c.custid = o.custid;
  
--�ֹ��̷��� 2�� �̻��� ������ ���̽ÿ�
select c.name ���� , count(*) �ֹ��Ǽ�
  from customer c , orders o
  where c.custid = o.custid
  group by name
  having count(*) >= 2
  order by count(*) desc;
  
--���� ������� �����ϰ� ����� �������� �����Ͻÿ�
select c.name ���� , sum(o.saleprice) �����
  from customer c , orders o
  where c.custid = o.custid
  group by c.name
  order by ����� desc;

--���� ������� 3������ �ʰ��ϴ� ���� ���� ����� �������� �����Ͻÿ�
select c.name ���� , sum(o.saleprice) �����
  from customer c , orders o
  where c.custid = o.custid
  group by c.name
  having sum(o.saleprice) > 30000
  order by ����� desc;
  
-- ������ ������ ����, ������, �ֹ����ڸ� �ֹ����ڸ� �ֽż����� ���̽ÿ�
select c.name ����, b.bookname ������, o.orderdate �ֹ�����
  from customer c, orders o, book b
  where c.custid = o.custid 
    and o.bookid = b.bookid
  order by �ֹ����� desc;
  
--�����̷��� ���� ����ȸ (left outer join)
select *
  from customer c , orders o
  where c.custid = o.custid(+)
    and o.orderid is null; 

--�����̷��� ���� ����ȸ (right outer join)
select *
  from  customer c, orders o 
  where o.custid(+) = c.custid
    and o.orderid is null; 
    
-- ���� �̸��� ���� �ֹ��� ������ �̸��� ���Ͻÿ�
select c.name �̸�, b.bookname ������
  from customer c , orders o, book b
  where c.custid = o.custid
    and o.bookid = b.bookid;
    
--������ 2������ ������ �ֹ��� ���� �̸��� ������ �̸��� ���Ͻÿ�
select c.name �̸� ,b.bookname ������
  from customer c, orders o, book b
  where c.custid = o.custid 
    and o.bookid = b.bookid
    and b.price >= 20000;
    
-- ������ �������� ���� ���� �����Ͽ� ���� �̸��� ���� �ֹ��� ������ �ǸŰ����� ���Ͻÿ�
select c.name �̸�, o.saleprice ����
  from customer c, orders o
  where c.custid = o.custid(+);
  
--oracle join sql
select *
  from customer c , orders o
  where c.custid = o.custid;

--oracle join sql
select *
  from customer c , orders o
  where c.custid = o.custid(+)
    and c.name = '������';
--ansi join sql
select *
  from customer c inner join orders o 
    on c.custid = o.custid
  where c.name = '������';

--ansi left join sql
select *
  from customer c left outer join orders o 
    on c.custid = o.custid;

--���� ��� ������ �̸��� ���̽ÿ�
select bookname
  from book
  where price = (select max(price)
                  from book);
                  
--������ ������ ���� �ִ� ���� �̸��� �˻��Ͻÿ�
select name
  from customer
  where custid in(select custid
          from orders);

--���ѹ̵��� ������ ������ ������ ���� �̸��� ���̽ÿ�
select  name
  from  customer
  where custid in(select  custid
                  from    orders
                  where   bookid in(select bookid
                                    from   book
                                    where  publisher = '���ѹ̵��'));

--���ǻ纰�� ���ǻ��� ��� �������ݺ��� ��� ������ ���Ͻÿ�
select bookname
  from book b1
  where price > (select avg(price)
                  from book b2
                  where b1.publisher = b2.publisher);
                  
--������ �ֹ����� ���� ���� �̸� (������)
select name
  from customer
minus
select name
  from customer
  where custid in(select custid
                  from orders);
 
--�ֹ��� �ִ� ���� �̸��� �ּҸ� ���̽ÿ� (exists)
select c.name, c.address
  from customer c
  where exists(select 1
                from orders o
                where c.custid = o.custid);
                                        
--�������� ������ ������ ���ǻ� ��
select count(distinct b.publisher) "�������� ������ ������ ���ǻ� ��"
  from customer c, orders o, book b
  where c.custid = o.custid 
    and o.bookid = b.bookid
    and c.name = '������';]
    
--ANSI)
select count(distinct b.publisher) "�������� ������ ������ ���ǻ� ��"
  from customer c inner join orders o 
                  on c.custid = o.custid
                  inner join book b
                  on o.bookid = b.bookid
  where c.name = '������';]
    
select count(distinct publisher) "�������� ������ ������ ���ǻ� ��"
  from book
  where bookid in(select bookid
                  from orders
                  where custid in(select custid
                                  from customer
                                  where name = '������'));
    
--�������� ������ ������ �̸�. ����. ������ �ǸŰ����� ����
select b.bookname �̸�, b.price ����, b.price - o.saleprice "����-�ǸŰ�"  
  from customer c, orders o, book b
  where c.custid = o.custid
    and o.bookid = b.bookid
    and c.name = '������';    

--�������� �������� ���� ������ �̸�
select bookname
  from book
  where bookid not in(select bookid
                      from orders
                      where custid in(select custid
                                      from customer
                                      where name = '������'));
                                      
select bookname
  from book
  where bookid not in (select t1.bookid
                      from orders t1, customer t2
                      where t1.custid = t2.custid
                      and t2.name = '������');

select bookname
  from book t3
  where not exists (select *
                     from orders t1, customer t2
                     where t1.custid = t2.custid
                      and t1.bookid = t3.bookid
                      and t2.name = '������');
                      
select bookname
  from book
minus
select t3.bookname
  from orders t1, customer t2, book t3
  where t1.custid = t2.custid
    and t1.bookid = t3.bookid
    and t2.name = '������';

select distinct b.bookname
  from book b, orders o, customer c
  where b.bookid = o.bookid(+)
    and o.custid = c.custid(+)    
    and (c.name != '������' or c.name is null);

--�ֹ����� ���� ���� �̸�(�μ����� ���)
select name
  from customer
  where custid not in (select custid
                      from orders);
                      
--�ֹ� �ݾ��� �Ѿװ� �ֹ��� ��� �ݾ�
select sum(saleprice) , avg(saleprice) 
  from orders;
  
--���� �̸��� ���� ���ž�
select c.name, sum(o.saleprice)
  from customer c, orders o
  where c.custid = o.custid
  group by c.name;
  
--���� �̸��� ���� ������ ���� ���
select c.name, b.bookname 
  from customer c, orders o, book b
  where c.custid = o.custid
    and o.bookid = b.bookid;
    
--������ ���ݰ� �ǸŰ����� ���̰� ���� ���� �ֹ�
select o.*
  from orders o, book b
  where o.bookid = b.bookid
    and b.price - o.saleprice = (select max(b.price - o.saleprice)
                                 from orders o , book b
                                  where o.bookid = b.bookid);

--������ �Ǹž� ��պ��� �ڽ��� ���ž� ����� �� ���� ���� �̸�
select name, avg(saleprice)
  from customer c, orders o
  where c.custid = o.custid
  group by name
  having avg(saleprice) > ( select avg(saleprice)
                            from orders);
                                        