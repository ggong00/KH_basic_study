-- [인덱스]

-- 인덱스 생성
create index ix_Book on book(bookname desc);
create index ix_Book2 on book(publisher,price);

-- 인덱스 재생성
alter index ix_Book2 rebuild;

-- 인덱스 삭제
drop index ix_Book;
drop index ix_Book2;

-- 테스트
select *
  from book
  where publisher = '출판사2500'
    and price >= 2000;
    
select bookname
  from book
  where bookname like '데이터베이스%1%';
    
alter table book modify bookid number(4);

declare
begin
  for i in 11..9999 loop
    insert into book values (i,'데이터베이스' || i, '출판사' || i, i);
  end loop;
end; 

select count(*)
  from book;  
  
select *
  from book;
  
-- 연습문제

-- (16-1)
select name 
  from customer
  where custid = 5;
  
-- (16-3)
create index ix_name on customer(name);

-- (16-5)
drop index ix_name;


