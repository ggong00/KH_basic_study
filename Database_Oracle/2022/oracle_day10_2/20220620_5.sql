-- 프로시저 예제 3 (구조체(class) 생성 / 행 조회)
set serveroutput on;

accept p_bookname prompt '조회하고자하는 도서명을 입력하세요';

declare
--  사용자 레코드 타입 정의
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

      DBMS_OUTPUT.put_line('도서번호 : ' || ls_book.bookid);
      DBMS_OUTPUT.put_line('도서명 : ' || ls_book.bookname);
      DBMS_OUTPUT.put_line('출판사 : ' || ls_book.publisher);
      DBMS_OUTPUT.put_line('가격 : ' || ls_book.price);
      
  exception
    when no_data_found then
      dbms_output.put_line('찾고자하는 정보가 없습니다');
    when too_many_rows then
      dbms_output.put_line('2개 이상의 도서가 발견됩니다.');
    when others then
      dbms_output.put_line('기타 예외가 발생했습니다');
end;

select * from book;