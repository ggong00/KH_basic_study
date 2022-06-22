-- 1
create or replace procedure test_1
as
  cursor c1 is select name, address, nvl(phone,'����ó����') ph
                from customer
                where address like '%���ѹα�%';  
begin
  for val in c1 loop
    dbms_output.put_line('�̸� : ' || rpad(val.name,10) ||
                          ' �ּ� : ' || rpad(val.address,20) ||
                          ' ����ó : ' || rpad(val.ph,20));
  end loop;
  
  exception when others then 
   dbms_output.put_line('���ܹ߻� : ' || sqlerrm(sqlcode));  
                            
end;

set serveroutput on;
exec test_1;

-- 2
create or replace procedure test_2 (
  p_bookid    book.bookid%type,
  p_bookname  book.bookname%type,
  p_publisher book.publisher%type,
  p_price     book.price%type
)
as
  lv_bookcount   number;
begin
  select count(*)
    into lv_bookcount
    from book
    where publisher = p_publisher and bookname = p_bookname;
  
  if lv_bookcount = 0 then
    insert into book values(p_bookid,p_bookname,p_publisher,p_price);
  else 
    update book set price = p_price 
      where bookname = p_bookname and publisher = p_publisher;
  end if;
  
  exception when others then 
   dbms_output.put_line('���ܹ߻� : ' || sqlerrm(sqlcode));  
end;

select * from book;
exec test_2(11,'�����ͺ��̽�','���ѹ̵��',25000);
exec test_2(12,'�����ͺ��̽�','���ѹ̵��',30000);

-- 3
create or replace function test_3 (
  p_custid   customer.custid%type
) return varchar2
as
  lv_grade      varchar2(12);
  lv_sumprice   number;
begin
  select nvl(sum(saleprice),0)
    into lv_sumprice
    from customer c, orders o
    where c.custid = o.custid(+)
      and c.custid = p_custid; 

  if lv_sumprice >= 30000 then
    lv_grade := '���';  
  else 
    lv_grade := '�Ϲ�';

  end if;
  
  return lv_grade;
  
  exception when others then 
    dbms_output.put_line('���ܹ߻� : ' || sqlerrm(sqlcode));    
end;

var test_v varchar2(20)
exec :test_v := test_3(1);
print test_v

-- 4
select name �̸� ,test_3(custid) ���
  from customer;

-- 5
create or replace procedure test_5
as
  type customer_record is record(
    custid    customer.custid%type,
    name      customer.name%type,
    count     number,
    sum_price number
  );
  type customers_table is table of customer_record
    index by binary_integer;
  lv_cusomers   customers_table;  
begin
  select c.custid,c.name,count(o.custid),nvl(sum(saleprice),0)
    bulk collect into lv_cusomers
    from customer c, orders o
    where c.custid = o.custid(+)
    group by c.custid,c.name;

  for idx in 1..lv_cusomers.count loop
    dbms_output.put_line('����ȣ : ' || lv_cusomers(idx).custid || 
                         ' �̸� : ' || lv_cusomers(idx).name ||
                         ' �ֹ�Ƚ�� : ' || lv_cusomers(idx).count ||
                         ' �� �ֹ��հ� : ' || lv_cusomers(idx).sum_price);
  end loop;
  
  exception when others then 
    dbms_output.put_line('���ܹ߻� : ' || sqlerrm(sqlcode));   
end;

exec test_5;

-- 6
create table orders_log (
  no            number,
  l_user        varchar2(40),
  l_orderid     number(2),
  l_custid      number(2),
  l_bookid      number(2),
  l_saleprice   number(8),
  l_orderdate   date,
  event_type    varchar2(40),
  udate         date
);

create sequence orders_log_no_seq
  start with 1
  minvalue 1
  maxvalue 99999
  nocycle
  nocache;
   
create or replace trigger test_6
after update or delete on orders 
for each row
begin
  if updating then
    insert into orders_log 
      values(orders_log_no_seq.nextval,user,:old.orderid,:old.custid,:old.bookid,
              :old.saleprice,:old.orderdate,'���� ��',sysdate);
              
    insert into orders_log 
      values(orders_log_no_seq.nextval,user,:new.orderid,:new.custid,:new.bookid,
              :new.saleprice,:new.orderdate,'���� ��',sysdate);
              
  elsif deleting then
    insert into orders_log 
      values(orders_log_no_seq.nextval,user,:old.orderid,:old.custid,:old.bookid,
              :old.saleprice,:old.orderdate,'���� ��',sysdate);
  end if;
end;

update orders set saleprice = saleprice * 1.1;
  
delete orders 
  where orderid in (2,4);
  
select * from orders_log;

-- 7
select t1.publisher ���ǻ�, t2.name ����, t1.sum �ֹ��հ�
  from (
          select b.publisher, c.custid, sum(o.saleprice) sum
            from orders o, customer c, book b
            where o.custid = c.custid
              and o.bookid = b.bookid
            group by rollup(b.publisher, c.custid)) t1,
            customer t2
  where t1.custid = t2.custid(+)
  order by t1.publisher,t1.custid;          

-- 8
select b.publisher ���ǻ� , nvl(sum(o.saleprice),0) ���Ǹűݾ�,
  rank() over(order by nvl(sum(o.saleprice),0) desc) �Ǹż���
  from book b, orders o
  where b.bookid = o.bookid(+)
  group by b.publisher
  order by nvl(sum(o.saleprice),0) desc; 
          