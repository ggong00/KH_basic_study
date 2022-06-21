-- (9-4)
set serveroutput on;

create or replace procedure exam_9_4 
as
  type order_info_r is record(
    name        customer.name%type,
    cnt         number,
    sum         number
  );
  type orders_info_t is table of order_info_r
    index by binary_integer;
  lt_orders_info orders_info_t;   

--  cursor c1 is select c.name name,count(o.orderid) cnt,nvl(sum(o.saleprice),0) sum
--                from customer c, orders o
--                where c.custid = o.custid(+)
--                group by c.custid,c.name;
begin
  select c.name name,count(o.orderid) cnt,nvl(sum(o.saleprice),0) sum
    bulk collect into lt_orders_info
    from customer c, orders o
    where c.custid = o.custid(+)
    group by c.custid,c.name;

  for idx in 1..lt_orders_info.count loop
    dbms_output.put_line('[고객이름] : ' || lt_orders_info(idx).name ||          
                         ' [구입 도서 수] : ' || lt_orders_info(idx).cnt ||
                         ' [구입 총액] : ' || lt_orders_info(idx).sum);
  end loop;

--  for val in c1 loop
--    dbms_output.put_line('[고객이름] : ' || val.name ||          
--                         ' [구입 도서 수] : ' || val.cnt ||
--                         ' [구입 총액] : ' || val.sum);
--  end loop;
  
  exception when others then
    dbms_output.put_line('예외발생');
end;

exec exam_9_4;



-- (9-5)
create or replace procedure exam_9_5 
as
  cursor c1 is select name, sum(saleprice) sum
                from customer c, orders o
                where c.custid = o.custid(+)
                group by c.custid,name;

begin
  for val in c1 loop
    if val.sum is null then
      dbms_output.put_line('고객 이름 : ' || val.name);
    else
      dbms_output.put_line('고객 이름 : ' || val.name || ' 주문 총액 : ' || val.sum);
    end if;  
  end loop;
  exception when others then
    dbms_output.put_line('예외발생');
end;

exec exam_9_5;

-- (10-1)
create or replace function grade (
  sum_saleprice number
) return varchar2
as
  lv_grade  varchar2(20);
begin
  if sum_saleprice >= 20000 then
    lv_grade := '우수';
  else
    lv_grade := '보통';
  end if;  
  return lv_grade;
  
  exception when others then
    dbms_output.put_line('예외');
end;

select name 이름,grade(sum(saleprice)) 등급
  from customer c, orders o
  where c.custid = o.custid
  group by c.custid,name;
  
-- (11-3)
-- 커서 활용
create or replace procedure exam_11_3
as
  cursor c1 is select b.publisher, b.bookname, b.price
                from book b
                where price > (select avg(price)
                                from book b2
                                where b.publisher = b2.publisher)
                order by b.publisher,b.bookname,b.price;
begin
  for val in c1 loop
    dbms_output.put_line(val.publisher || ' : ' || val.bookname || ' : ' || val.price);
  end loop;
  exception when others then
    dbms_output.put_line('예외');
end;

exec exam_11_3;

-- table 활용
create or replace procedure exam_11_3_2 
as
  type book_info_r is record(
    r_publisher     book.publisher%type,
    r_bookname      book.bookname%type,
    r_price         book.price%type
  );
  type books_info_t is table of book_info_r
    index by binary_integer;
  book_info   books_info_t;
begin
  select b.publisher, b.bookname, b.price
    bulk collect into book_info
    from book b
    where price > (select avg(price)
                    from book b2
                    where b.publisher = b2.publisher)
    order by b.publisher,b.bookname,b.price;
  
  for idx in 1..book_info.count loop
    dbms_output.put_line(book_info(idx).r_publisher || ' : ' ||
                          book_info(idx).r_bookname || ' : ' ||
                          book_info(idx).r_price);
  end loop;
end;

exec exam_11_3_2;


 

