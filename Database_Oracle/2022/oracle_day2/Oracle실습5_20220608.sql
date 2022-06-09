-- part3 ��������

-- (1.1) ������ȣ�� 1�� ������ �̸�
select bookname
    from book
    where bookid = 1;

-- (1.2) ������ 20000�� �̻��� ������ �̸�
select bookname
    from book
    where price >= 20000;
    
-- (1.3) �������� �� ���ž�
select sum(o.saleprice)
    from customer c, orders o
    where c.custid = o.custid 
        and c.name = '������';

-- (1.4) �������� ������ ������ ��
select count(*)
    from customer c, orders o
    where c.custid = o.custid
        and c.name like '������';

-- (1.5) �������� ������ ������ ���ǻ� ��
select count(distinct b.publisher)
    from customer c, orders o, book b
    where c.custid = o.custid 
        and o.bookid = b.bookid
        and c.name = '������';

-- (1.6) �������� ������ ������ �̸�, ����, ������ �ǸŰ����� ����
select b.bookname, b.price, abs(b.price - o.saleprice)
    from customer c, orders o, book b
    where c.custid = o.custid and o.bookid = b.bookid
        and c.name = '������';

-- (1.7) �������� �������� ���� ������ �̸�
select bookname
    from book
    where bookname not in (select bookname from book b, customer c, orders o 
                            where b.bookid = o.bookid and o.custid = c.custid
                            and c.name = '������');
                            
-- (2.1) ���缭�� ������ �� ��
select count(*)
    from book;
    
-- (2.2) ���缭���� ������ ����ϴ� ���ǻ��� �� ��
select count(distinct publisher)
    from book;

-- (2.3) ��� ���� �̸�, �ּ�
select name, address
    from customer;
    
-- (2.6) ���� �� ���� ���� �̸��� �ּ�
select name, address
    from customer
    where name like '��%';

-- (2.8) �ֹ����� ���� ���� �̸�
select name
    from customer
    where custid not in (select distinct custid from orders);

-- (2.9) �ֹ� �ݾ��� �Ѿװ� �ֹ��� ��� �ݾ�
select sum(saleprice), avg(saleprice)
    from orders;
    
-- (2.10) ���� �̸��� ���� ���ž�    
select c.name, sum(o.saleprice) 
    from customer c, orders o
    where c.custid = o.custid
    group by c.name;

-- (2.11) ���� �̸��� ���� ������ ���� ���
select c.name, b.bookname
    from customer c, book b, orders o
    where c.custid = o.custid and b.bookid = o.bookid;
        
-- (2.12) ������ ���ݰ� �ǸŰ����� ���̰� ���� ���� �ֹ�
select o.*
    from orders o, book b
    where o.bookid = b.bookid and abs(o.saleprice - b.price) = 
                                    (select max(abs(o2.saleprice - b2.price))
                                    from orders o2,book b2 
                                    where o2.bookid = b2.bookid);
    
-- (2.13) ������ �Ǹž� ��պ��� �ڽ��� ���ž� ����� �� ���� ���� �̸�
select c.name, avg(o.saleprice)
    from customer c, orders o
    where c.custid = o.custid
    group by c.name    
    having avg(o.saleprice) > (select avg(price) from book);
    
-- (3.1) �������� ������ ������ ���ǻ�/�� ���� ���ǻ翡��/ ������ ������ ���� �̸�/    
select c.name 
    from customer c, orders o, book b 
    where c.custid = o.custid and o.bookid = b.bookid
        and c.name != '������' and b.publisher in (select publisher from customer c2, orders o2, book b2
                                                  where c2.custid = o2.custid and o2.bookid = b2.bookid
                                                    and c2.name = '������'); 
                                                    
-- (3.2) �� �� �̻��� ���� �ٸ� ���ǻ翡�� ������ ������ ���� �̸�                                                     
select name
  from customer
  where name in(select c.name
  from book b , customer c, orders o
  where b.bookid = o.bookid and c.custid = o.custid
  group by c.name having count(distinct b.publisher) >=2);

-- (3.3) ��ü ���� 30% �̻��� ������ ����
select *
  from book
  where bookname in (select b.bookname
                      from orders o , book b
                      where o.bookid = b.bookid
                      group by b.bookname
                      having count(*) >= (select count(*)*0.3
                                           from customer));

-- (5) exists�� ����ϰ� ��� �� Ȯ���ϱ�
select *
  from customer c1
  where not exists (select * from orders c2
                    where c1.custid = c2.custid);



    















