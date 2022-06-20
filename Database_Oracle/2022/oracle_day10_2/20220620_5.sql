-- ���ν��� ���� 3 (����ü(class) ���� / �� ��ȸ)
set serveroutput on;

accept p_bookname prompt '��ȸ�ϰ����ϴ� �������� �Է��ϼ���';

declare
--  ����� ���ڵ� Ÿ�� ����
--  type rec_book  is record (
--    bookid    book.bookid%type,
--    bookname  book.bookname%type,
--    publisher book.publisher%type,
--    price     book.price%type
--  ); 
--  ls_book rec_book;
    ls_book book%rowtype;
  
begin
  select *
    into ls_book
    from book
    where bookname = '&p_bookname';

      DBMS_OUTPUT.put_line('������ȣ : ' || ls_book.bookid);
      DBMS_OUTPUT.put_line('������ : ' || ls_book.bookname);
      DBMS_OUTPUT.put_line('���ǻ� : ' || ls_book.publisher);
      DBMS_OUTPUT.put_line('���� : ' || ls_book.price);
      
  exception
    when no_data_found then
      dbms_output.put_line('ã�����ϴ� ������ �����ϴ�');
    when too_many_rows then
      dbms_output.put_line('2�� �̻��� ������ �߰ߵ˴ϴ�.');
    when others then
      dbms_output.put_line('��Ÿ ���ܰ� �߻��߽��ϴ�');
end;

select * from book;