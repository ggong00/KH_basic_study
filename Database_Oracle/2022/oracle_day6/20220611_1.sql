-- [���� �Լ�]

-- ����
select abs(-78) , abs(78)
  from dual;
  
-- �ݿø� 
select round(4.875,1)
  from dual;
  
-- ��� �ݿø�  
select custid, round(avg(saleprice),-3)
  from orders
  group by custid;
  
select custid, round(sum(saleprice)/count(*),-3)
  from orders
  group by custid;
  
-- [���� �ռ�]  

-- replace(���ڿ� ��ȯ)
select bookid, replace(bookname,'�߱�','��') bookname, publisher, price
  from book;
  
-- length(���� �� ��ȯ) lengthb(����Ʈ �� ��ȯ)  
select bookname ����, length(bookname) ���ڼ�, lengthb(bookname) ����Ʈ��
  from book;
  
-- substr(���깮�� ��ȯ)  
select substr(name,1,1) �� , count(*) �ο�
  from customer
  group by substr(name,1,1);
    
-- [��¥ �Լ�]

-- �ý��ۻ� �ð�����
select sysdate
  from dual;
  
-- date ��ȯ  
select to_date('20220613','yyyy-mm-dd')
  from dual;
  
-- ���� (�� =1 , ��=2 ...)  
select to_char(to_date('20220614','yyyy-mm-dd'),'d')
  from dual;

select to_char(to_date('20220614','yyyy-mm-dd'),'dy')
  from dual;
  
select to_char(to_date('20220614','yyyy-mm-dd'),'day')
  from dual;  
  
--��¥(�ޱ���)  
select to_char(to_date('20220614','yyyy-mm-dd'),'dd')
  from dual;  
  
--��¥(�����)  
select to_char(to_date('20220614','yyyy-mm-dd'),'ddd')
  from dual;  
  
--�ð�(12�ð� ����)
select to_char(to_date('2022-06-14 02:01:10','yyyy-mm-dd-hh24-mi-ss'),'hh')
  from dual;
  
select to_char(sysdate,'hh')
  from dual;
  
--�ð�(24�ð�����)  
select to_char(sysdate,'hh24')
  from dual;  
  
--��  
select to_char(sysdate,'mi')
  from dual;  
  
--��  
select to_char(sysdate,'mm')
  from dual;  
  
select to_char(sysdate,'mon')
  from dual;  
  
select to_char(sysdate,'month')
  from dual;  
  
--��
select to_char(sysdate,'ss')
  from dual;
  
--�⵵  
select to_char(sysdate,'yyyy')
  from dual;  
  
--�⵵ �ڸ� ��  
select to_char(sysdate,'y')
  from dual;  
  
--Ȱ�� ����  
select to_char(orderdate,'yyyy') ��,
       to_char(orderdate,'mon') ��,
       to_char(orderdate,'d') ��,
       to_char(orderdate,'hh') �ð�,
       to_char(orderdate,'mi') ��,
       to_char(orderdate,'ss') ��       
  from orders;
  
select *
  from orders;

select to_char(orderdate,'yyyy-mm-dd'), count(*)
  from orders
  group by to_char(orderdate,'yyyy-mm-dd');
  
select to_char(orderdate,'yyyy') ��,
       to_char(orderdate,'mm') ��,
       to_char(orderdate,'dd') ��,
       count(*)
  from orders
  group by  to_char(orderdate,'yyyy'),
            to_char(orderdate,'mm'),
            to_char(orderdate,'dd');
      
select orderid, orderdate, add_months(orderdate,2) + 3
  from orders;
    
select orderid, to_char(orderdate,'yyyy-mm-dd dy'), custid, bookid
  from orders
  where orderdate = to_date('20200707', 'yyyymmdd');
  
select sysdate, to_char(sysdate,'yyyy/mm/dd dy hh24:mi:ss')
  from dual;

-- null Ư¡  
insert into book (bookid,bookname,publisher) values(11,'�����ͺ��̽�','�Ѻ�');

-- �����Լ��� *�� ������ ��� ���ڵ� Ư�� �÷��� ������ null�� �����Ѵ�.
select count(price)
  from book;
  
select sum(price)/count(price)
  from book;
  
select (select count(*)
        from book
        where price >= 10000)
        +
       (select count(*)
        from book
        where price < 10000) 
  from dual;        
  
update book
  set price = price +1000;
  
select * from book;  
  
select count(price)
  from book
  where price > 50000;
  
select name, address, nvl(phone,'����ó ����'),nvl2(phone , '����ó����','����ó����')
  from customer;
  
-- rownum
select rownum,name,address,phone
  from customer
  where rownum <= 3;  
  
--���� ������ ���������� ����2�� �ุ ���̽ÿ�.(�� ���ȣ�� ���������� ǥ���Ͻÿ�)
select rownum ���ȣ ,b.*
  from (select book.* 
        from book 
        order by price desc) b
  where rownum <= 2;