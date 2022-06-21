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
    dbms_output.put_line('[���̸�] : ' || lt_orders_info(idx).name ||          
                         ' [���� ���� ��] : ' || lt_orders_info(idx).cnt ||
                         ' [���� �Ѿ�] : ' || lt_orders_info(idx).sum);
  end loop;

--  for val in c1 loop
--    dbms_output.put_line('[���̸�] : ' || val.name ||          
--                         ' [���� ���� ��] : ' || val.cnt ||
--                         ' [���� �Ѿ�] : ' || val.sum);
--  end loop;
  
  exception when others then
    dbms_output.put_line('���ܹ߻�');
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
      dbms_output.put_line('�� �̸� : ' || val.name);
    else
      dbms_output.put_line('�� �̸� : ' || val.name || ' �ֹ� �Ѿ� : ' || val.sum);
    end if;  
  end loop;
  exception when others then
    dbms_output.put_line('���ܹ߻�');
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
    lv_grade := '���';
  else
    lv_grade := '����';
  end if;  
  return lv_grade;
  
  exception when others then
    dbms_output.put_line('����');
end;

select name �̸�,grade(sum(saleprice)) ���
  from customer c, orders o
  where c.custid = o.custid
  group by c.custid,name;
  
-- (11-3)
-- Ŀ�� Ȱ��
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
    dbms_output.put_line('����');
end;

exec exam_11_3;

-- table Ȱ��
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


 

