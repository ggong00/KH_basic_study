-- cursor ���� 1
declare
  ls_book book%rowtype;
  cursor c1 is select *
                from book;
begin
  DBMS_OUTPUT.PUT_LINE(rpad('������ȣ',10) || rpad('������',20) || rpad('���ǻ�',10) || rpad('����',10));

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

--  cursor ���� 2 (for�� Ȱ��)
declare
  ls_book book%rowtype;
  cursor c1 is select *
                from book;
begin
  DBMS_OUTPUT.PUT_LINE(rpad('������ȣ',10) || rpad('������',20) || rpad('���ǻ�',10) || rpad('����',10));
  
  for ls_book in c1
  loop
    DBMS_OUTPUT.PUT_LINE(rpad(ls_book.bookid,10) ||
                          rpad(ls_book.bookname,20) ||
                          rpad(ls_book.publisher,10) ||
                          lpad(ls_book.price,10));
  end loop;
  
end;