-- �⺻���� ({a,b} or {a,b,c})
select t2.publisher, sum(t1.saleprice)
  from orders t1, book t2
  where t1.bookid = t2.bookid
  group by t2.publisher; -- 1
  
select t2.publisher,t1.custid, sum(t1.saleprice)
  from orders t1, book t2
  where t1.bookid = t2.bookid
  group by t2.publisher, t1.custid
  order by publisher,t1.custid; -- 1  

-- ������ �׷� �Լ�
-- rollup ({a,b} {a} @) or ({a,b,c} {a,b} {a} @ / * null�� �ϳ��� ������ ���)
select t2.custid,t1.publisher, sum(t2.saleprice)
  from book t1, orders t2
  where t1.bookid = t2.bookid(+)
  group by rollup(t2.custid,t1.publisher); --N+1    
  
select *
  from book b, orders o
  where b.bookid = o.bookid(+);
  
-- cube ({a,b} {a} {b} @] or {a,b,c} {a,b} {a,c} {b,c} {a} {b} {c} @)  
select t2.publisher,t1.custid, sum(t1.saleprice)
  from orders t1, book t2
  where t1.bookid = t2.bookid
  group by cube(t2.publisher, t1.custid); --2^n
  
-- grouping sets ({a} or {b}) // ()���ȣ�� @  
select t2.publisher,t1.custid, sum(t1.saleprice)
  from orders t1, book t2
  where t1.bookid = t2.bookid
  group by grouping sets(t2.publisher, t1.custid , ()); -- n  
  
-- [�м��Լ� / ����Ʈ ����� �߰������� �м��ؼ� �� ����]
-- ntile(�׷� ��) over( partition by �߰� �׷���� order by���ı���)
select t1.*,
        ntile(3) over( partition by t1.publisher order by price desc) "��Ŷ"
  from book t1;

select t2.name, sum(t1.saleprice),
        case ntile(3) over(order by sum(t1.saleprice) desc) when 1 then '�ְ�����'
                                                            when 2 then '�����'
                                                            when 3 then '��Ÿ'
        end as ���
  from orders t1, customer t2
  where t1.custid = t2.custid
  group by t2.name;
  
-- ��ŷ�Լ� (1,2,3,3,5)  
select t2.name,t3.publisher, sum(t1.saleprice),
        rank() over( order by sum(t1.saleprice) desc) "�Ǹź�����"
  from orders t1, customer t2, book t3
  where t1.custid = t2.custid
    and t1.bookid = t3.bookid
  group by t3.publisher,t2.name;  
  
-- ��ŷ�Լ� (1,2,3,3,4)
select t2.name,t3.publisher, sum(t1.saleprice),
        dense_rank() over( order by sum(t1.saleprice) desc) "�Ǹź�����"
  from orders t1, customer t2, book t3
  where t1.custid = t2.custid
    and t1.bookid = t3.bookid
  group by t3.publisher,t2.name;   

select *
  from (
    select row_number() over( order by sum(t1.saleprice) desc) "���ȣ",
            t2.name,t3.publisher, sum(t1.saleprice),
            rank() over ( partition by publisher order by sum(t1.saleprice) desc) ���1,
            dense_rank() over ( order by sum(t1.saleprice) desc) ���2
      from orders t1, customer t2, book t3
      where t1.custid = t2.custid
        and t1.bookid = t3.bookid
      group by t3.publisher,t2.name
      order by t3.publisher,���1 )
   where ���1 in (1,2) ;   
   
select t1.p,t2.name, t1.r1,t1.saleprice
  from (
    select  b.publisher p,o.custid,o.saleprice, 
            rank() over(partition by b.publisher order by sum(saleprice) desc) r1
      from orders o, book b
      where o.bookid = b.bookid
      group by b.publisher,o.custid, o.saleprice) t1,
      customer t2
  where t1.custid = t2.custid
    and r1 in (1,2)
  order by t1.p, t1.r1;
  
select * from orders;
  