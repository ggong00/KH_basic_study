create table book_log(
  bookid_l    number,
  bookname_l  varchar2(20),
  publisher_l varchar2(20),
  price_l     number
);

insert into book values(22,'스포츠 과학 4','이상미디어',25000);

select * from book;
select * from book_log;
rollback;

select custid, orderid, saleprice,fnc_interest(saleprice) interest
  from orders;
  
set serveroutput ON;  
exec interest2;
exec interest;
exec exec9_2;
exec exec9_3;

