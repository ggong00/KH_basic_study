-- 1
select name 이름, address 주소, phone 연락처
  from customer;
  
-- 2
select *
  from  customer
  where address like '대한민국%';
  
-- 3
select name 이름
  from customer
  where phone is null;
  
-- 4
select count(distinct publisher) "출판사의 총 개수"
  from book;
  
-- 5
select *
  from book
  where bookname like '%골프%';
  
-- 6
select count(orderid) 주문건수, avg(saleprice) 평균판매액, max(saleprice) 최대판매액,
        min(saleprice) 최소판매액, sum(saleprice) "총 판매액"
  from orders;

-- 7
select publisher 출판사, count(*) 도서건수
  from book
  group by publisher
  order by count(*) desc;
  
-- 8
select publisher 출판사, count(*) 도서건수, max(price) 최고가격,
        min(price) 최저가격, sum(price) "도서가격의 합"
  from book
  group by publisher
  order by publisher;
  
-- 9
select max(price) - min(price) "가장 비싼 도서와 싼 도서의 가격차이"
  from book;
  
-- 10 *
select custid 고객번호, count(*) 구매건수
  from orders
  group by custid
  having count(*) >= 2
  order by 구매건수 desc;

-- 11
select orderid 주문번호
  from orders
  where orderdate not between '20200704' and '20200707';

-- 12
select orderdate 주문일자, sum(saleprice) 매출액
  from orders
  group by orderdate
  order by 매출액 desc;
  
-- 13 *
select orderdate 주문일자
  from orders
  where orderdate > '20200702'
  group by orderdate
  having sum(saleprice) > 20000
  order by orderdate desc;

-- 14
select publisher 출판사
  from book 
  group by publisher
  having count(*) >= 2;
  
--15
-- 1) 원인 : 기본키값은 not null 
insert into book (bookname, publisher, price)
  values ('데이터베이스', '한빛', 30000);
-- 2) 해결 : 기본키값을 추가
insert into book (bookid, bookname, publisher, price)
  values ('11','데이터베이스', '한빛', 30000);

commit;
select * from book;

-- 16
update book set publisher = '대한출판사' 
  where publisher = '대한미디어';

commit;  
select * from book;

-- 17
update book set price = price*1.1
  where publisher = '굿스포츠';

commit;
select * from book;

-- 18
update customer set address = '대한민국 울산'
  where name = '추신수';

commit;
select * from customer;

-- 19
delete customer 
  where phone is null;
  
commit;  
select * from customer; 
 
-- 20
--1) 원인 : '박지성'의 name을 가지는 레코드의 기본키가
--   orders 테이블에 참조되고있어 무결성 제약조건에 위배가 된다.
delete customer 
  where name = '박지성';
  
  
