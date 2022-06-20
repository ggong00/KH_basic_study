-- cursor 예제 1
declare
  ls_book book%rowtype;
  cursor c1 is select *
                from book;
begin
  DBMS_OUTPUT.PUT_LINE(rpad('도서번호',10) || rpad('도서명',20) || rpad('출판사',10) || rpad('가격',10));

  open c1;
  loop
    fetch c1 into ls_book;
    exit when c1%notfound;
    DBMS_OUTPUT.PUT_LINE(rpad(ls_book.bookid,10) ||
                          rpad(ls_book.bookname,20) ||
                          rpad(ls_book.publisher,10) ||
                          lpad(ls_book.price,10));
  end loop;
  
end;

--  cursor 예제 2 (for문 활용)
declare
  ls_book book%rowtype;
  cursor c1 is select *
                from book;
begin
  DBMS_OUTPUT.PUT_LINE(rpad('도서번호',10) || rpad('도서명',20) || rpad('출판사',10) || rpad('가격',10));
  
  for ls_book in c1
  loop
    DBMS_OUTPUT.PUT_LINE(rpad(ls_book.bookid,10) ||
                          rpad(ls_book.bookname,20) ||
                          rpad(ls_book.publisher,10) ||
                          lpad(ls_book.price,10));
  end loop;
  
end;