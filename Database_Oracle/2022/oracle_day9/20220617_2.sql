-- insert 로그 기록 트리거
create or replace trigger afterInsertBook
  after insert on book for each row
declare
  average number;
begin
  insert into book_log
    values(:new.bookid, :new.bookname,:new.publisher, :new.price);
  dbms_output.put_line('삽입 튜플을 Book_log 테이블에 백업');  
end;

