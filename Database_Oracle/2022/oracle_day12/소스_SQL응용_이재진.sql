-- 1
set serveroutput on;

create or replace procedure test_1
as
  cursor c1 is select name, address, nvl(phone,'연락처없음') ph
                from customer
                where address like '%대한민국%';  
begin
  for val in c1 loop
    dbms_output.put_line('이름 : ' || rpad(val.name,10) ||
                          ' 주소 : ' || rpad(val.address,20) ||
                          ' 연락처 : ' || rpad(val.ph,20));
  end loop;
  
  exception when others then 
   dbms_output.put_line('예외발생 : ' || sqlerrm(sqlcode));  
                            
end;

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
   dbms_output.put_line('예외발생 : ' || sqlerrm(sqlcode));  
end;

select * from book;
exec test_2(11,'데이터베이스','대한미디어',25000);
exec test_2(12,'데이터베이스','대한미디어',30000);

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
    lv_grade := '우수';  
  else 
    lv_grade := '일반';

  end if;
  
  return lv_grade;
  
  exception when others then 
    dbms_output.put_line('예외발생 : ' || sqlerrm(sqlcode));    
end;

var test_v varchar2(20)
exec :test_v := test_3(1);
print test_v

-- 4
select name 이름 ,test_3(custid) 등급
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
    dbms_output.put_line('고객번호 : ' || lv_cusomers(idx).custid || 
                         ' 이름 : ' || lv_cusomers(idx).name ||
                         ' 주문횟수 : ' || lv_cusomers(idx).count ||
                         ' 총 주문합계 : ' || lv_cusomers(idx).sum_price);
  end loop;
  
  exception when others then 
    dbms_output.put_line('예외발생 : ' || sqlerrm(sqlcode));   
end;

exec test_5;

-- 6
create table orders_log (
  no            number,
  l_user        varchar2(40),
  l_orderid     number(2),
  l_newcustid   number(2),
  l_oldcustid   number(2),
  l_newbookid      number(2),
  l_oldbookid      number(2),
  l_newsaleprice   number(8),
  l_oldsaleprice   number(8),
  l_neworderdate   date,
  l_oldorderdate   date,
  event_type    varchar2(40),
  udate         date
);

drop table orders_log;

create sequence orders_log_no_seq
  start with 1
  minvalue 1
  maxvalue 99999
  nocycle
  nocache;   
   
create or replace trigger test_6
after update or delete or insert on orders 
for each row
begin
  if updating then
    insert into orders_log 
      values(orders_log_no_seq.nextval,user,:new.orderid,:new.custid,
              :old.custid,:new.bookid,:old.bookid,
              :new.saleprice,:old.saleprice,:new.orderdate,
              :old.orderdate,'update',sysdate);
              
  elsif inserting then
    insert into orders_log 
      values(orders_log_no_seq.nextval,user,:new.orderid,:new.custid,
              :old.custid,:new.bookid,:old.bookid,
              :new.saleprice,:old.saleprice,:new.orderdate,
              :old.orderdate,'insert',sysdate); 
          
  elsif deleting then 
    insert into orders_log 
      values(orders_log_no_seq.nextval,user,:old.orderid,:new.custid,
              :old.custid,:new.bookid,:old.bookid,
              :new.saleprice,:old.saleprice,:new.orderdate,
              :old.orderdate,'delete',sysdate);
  end if;
end;

update orders set saleprice = 30000
  where orderid in(3,5);
  
delete orders 
  where orderid in (1);
  
insert into orders values(12,1,1,3000,'20220606');

select * from orders;
  
select * from orders_log;

rollback;

-- 7
select t1.publisher 출판사, t2.name 고객명, t1.sum 주문합계
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
select b.publisher 출판사 , nvl(sum(o.saleprice),0) 총판매금액,
  rank() over(order by nvl(sum(o.saleprice),0) desc) 판매순위
  from book b, orders o
  where b.bookid = o.bookid(+)
  group by b.publisher
  order by nvl(sum(o.saleprice),0) desc; 
          
