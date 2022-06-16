/* ���ν��� ���� (in) */
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

/* �׽�Ʈ */
exec InsertBook(13,'����������','������м���',25000);

select count(*) from book;
select * from book;
delete from book where bookid > 10;
desc book;
commit;

/* ���ν��� ���� 2 */
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

/* �׽�Ʈ */
exec bookinsertorupdate(15,'������ ��ſ�','������м���',25000);
select * from book;

exec bookinsertorupdate(15,'������ ��ſ�','������м���',20000);
select * from book;
