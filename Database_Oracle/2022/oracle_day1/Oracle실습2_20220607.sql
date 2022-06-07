select * from book;

insert into book (bookid, bookname, publisher, price) 
      values (11, '스포츠 의학', '한솔의학서적', 90000);
  
ROLLBACK; --임시저장을 취소
commit; --데이터베이스에 최종반영
 
insert into book (bookid, bookname, publisher)
      values (14, '스포츠 의학', '한솔의학서적');
      
insert into book(bookid, bookname, price, publisher)
      select bookid, bookname, price, publisher
      from Imported_Book;
      
rollback;

/* insert into 컬럼리스트 생략 가능 - 모든 컬럼에 값을 대입할때 */
insert into book 
      values (15, '데이터베이스', '한빛미디어', 30000);
      
update customer 
  set address = '대한민국 부산'
  where custid = 5;
  
select * from customer;

commit;

delete from customer; -- 참조 무결성 제약조건 위배

delete from customer  -- custid = 5 레코드는 참조되지 않음
    where custid = 5;
    
commit;

ROLLBACK;

