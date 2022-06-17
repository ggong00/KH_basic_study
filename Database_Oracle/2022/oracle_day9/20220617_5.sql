-- 5�� (8-1)
create procedure InsertCustomer (
  newCustId   in number,
  newName     in varchar2,
  newAddress  in varchar2,
  newPhone    in varchar2
)
as
begin
  insert into customer values (newCustId,newName,newAddress,newPhone);
end;

-- (8-2)
create or replace procedure BookInsertOrUpdate (
  myBookId number,
  myBookName varchar2,
  myPublisher varchar2,
  myPrice number
)
as
  bookCount number;
begin 
  select count(*) into bookcount from book
    where bookname = myBookName;
  if bookcount > 0 then
      update book set price = myprice
        where bookname = mybookname
          and price < myprice;
  else
      insert into book (bookid,bookname,publisher,price)
        values (myBookId,myBookName,myPublisher,myPrice);
  end if;  
end;

-- (9-1)
create or replace procedure showBookNameAndPrice
as
-- case1) ��Į�� ����
--  l_bookname  varchar2(40);
--  l_price     number;
-- case2) �÷� ���� (%type)  
--  l_bookname book.bookname%type;
--  l_price book.price%type;
-- case3) ����� ����
  l_book book%rowtype;
  cursor c1 is select *
                from book
               where publisher = '�̻�̵��';
begin
  open c1;
  loop
    fetch c1 into l_book;
    exit when c1%notfound;
    dbms_output.put_line('������ : ' || l_book.bookname || '���� : ' || l_book.price);
  end loop;  
  close c1;
end;

set serveroutput on;
exec showbooknameandprice;

-- (9-2)
create or replace procedure exec9_2
as
  l_publisher       book.publisher%type;
  l_sumOfSaleprice  orders.saleprice%type;
  cursor c1 is select b.publisher, sum(o.saleprice)
                from orders o ,book b
                where o.bookid = b.bookid
                group by b.publisher
                order by sum(o.saleprice) desc;
begin
 open c1;
 loop
  fetch c1 into l_publisher, l_sumOfSaleprice;
  exit when c1%notfound; 

  dbms_output.put_line('���ǻ� : ' || l_publisher || '�Ǹ��Ѿ� : ' || l_sumOfSaleprice);
 end loop;
 close c1;
end;

-- (9-3)
create or replace procedure exec9_3 
as
  l_book book%rowtype;
  cursor c1 is select *
                from book b
                where b.price > (select avg(b2.price) from book b2
                                    where b.publisher = b2.publisher)
                order by publisher desc;
begin
  open c1;
  loop
  fetch c1 into l_book;
  exit when c1%notfound;
  dbms_output.put_line(l_book.publisher || ' ' || l_book.bookname);
  end loop;
  close c1;
end;















