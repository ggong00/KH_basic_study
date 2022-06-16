/* 프로시저 예제 (in) */
create or replace procedure InsertBook(
  myBookId in number,
  myBookname in varchar2,
  myPublisher in varchar2,
  myPrice in number
)
as
begin
  insert into book (bookid,bookname,publisher,price)
    values (myBookId,myBookname,myPublisher,myPrice);
end;

/* 테스트 */
exec InsertBook(13,'스포츠과학','마당과학서점',25000);

select count(*) from book;
select * from book;
delete from book where bookid > 10;
desc book;
commit;

/* 프로시저 예제 2 */
create or replace procedure BookInsertOrUpdate(
  myBookId number,
  myBookName varchar2,
  myPublisher varchar2,
  myPrice INT
)
as
  mycount number;
begin
  select count(*) into mycount 
    from book
    where bookname like myBookName;

  if mycount != 0 then
    update book set price = myPrice
      where bookname like myBookName;
  else
    insert into book (bookid,bookname,publisher,price)
      values (myBookId,myBookName,myPublisher,myPrice);
  end if;
end;

/* 테스트 */
exec bookinsertorupdate(15,'스포츠 즐거움','마당과학서적',25000);
select * from book;

exec bookinsertorupdate(15,'스포츠 즐거움','마당과학서적',20000);
select * from book;
