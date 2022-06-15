-- rownum �ǽ�
select * 
  from book;
  
select *  
  from book
  where rownum <=5;
  
select *  
  from book
  where rownum <= 5
  order by price;
  
select *  
  from (select * from book order by price)
  where rownum <= 5;
  
select *
  from (select * from book where rownum <= 5)
  order by price;
  
select *
  from (select * from book where rownum <= 5 order by price);
        
-- �μ����� �ǽ�        
select od.* , rownum || '��' "���� ���Ǹż���"
  from (   select od.custid ����ȣ,
                  (select substr(cs.name,1,1) || '**'
                    from customer cs
                    where od.custid = cs.custid) ���̸�,
                  to_char(round(sum(od.saleprice),-4),'999,999') || '��' ���ž�
            from orders od
            group by od.custid
            having sum(od.saleprice) > (select avg(saleprice)
                                        from orders)
            order by sum(od.saleprice) desc) od
  where rownum <= 2
  order by rownum desc;
  
-- �÷��߰�  
alter table orders add bookname varchar2(40);

-- ������ ������ ����
update orders o
  set bookname = (select bookname
                  from book b
                  where o.bookid = b.bookid);
                                    
select * from orders;

-- �÷�����
alter table orders drop column bookname;

-- �ζ��� ��
select c.name, sum(saleprice)
  from orders o , (select *
                    from customer
                    where custid <= 2) c
  where o.custid = c.custid
  group by c.name;                    
  
-- �μ����� �ǽ�
select od.custid, sum(saleprice), (select name
                                  from customer cs
                                  where od.custid = cs.custid)
  from orders od
  group by od.custid;
  
select cs.name, s
  from (select custid,round(avg(saleprice),0) s
        from orders
        group by custid) od , customer cs
  where od.custid = cs.custid;

select sum(saleprice) 
  from orders od
  where exists (select 1
                from customer cs
                where od.custid = cs.custid and cs.custid <= 3);
                
-- �� �ǽ�

-- ����
create view vw_book as 
select *
  from book
  where bookname like '%�౸%';
  
-- �׽�Ʈ  
select publisher, count(*)
  from vw_book
  group by publisher;

-- ����  
create view vw_sales_info as
select t1.orderid, t1.saleprice, t1.orderdate,
       t2.custid, t2.name, t2.address, t2.phone,
       t3.bookid, t3.bookname, t3.publisher, t3.price
  from orders t1, customer t2, book t3
  where t1.custid = t2.custid
    and t1.bookid = t3.bookid;
  
-- �׽�Ʈ    
select name ����, sum(saleprice) ���Ǹž�
  from vw_sales_info
  group by name
  order by sum(saleprice) desc;
  
select publisher ���ǻ�, sum(saleprice) ���Ǹž�
  from vw_sales_info
  group by publisher
  order by sum(saleprice) desc;

-- ����
create view vw_customer as
select *
  from customer
  where address like '%���ѹα�%';
  
-- ����  
create or replace view vw_customer as
select custid ����ȣ ,name ����,address �ּ�
  from customer
  where address like '%����%';
  
select *
  from vw_customer;

-- ����       
drop view vw_customer;

-- �������� (4��)

-- (8-1)
create view vw_highorders as
select b.bookid ������ȣ, b.bookname �����̸�, c.name ���̸�,
       b.publisher ���ǻ�, o.saleprice �ǸŰ���
  from customer c, orders o, book b
  where o.custid = c.custid
    and o.bookid = b.bookid
    and o.saleprice >= 20000;
    
-- (8-2)
select ������ȣ, ���̸�
  from vw_highorders;
  
-- (8-3)
create or replace view vw_highorders as
select b.bookid ������ȣ, b.bookname �����̸�, c.name ���̸�,
       b.publisher ���ǻ�
  from customer c, orders o, book b
  where o.custid = c.custid
    and o.bookid = b.bookid
    and o.saleprice >= 20000;
    
-- �� �̸� ����    
rename vw_highorders to vw_highorders2;

