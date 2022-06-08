-- (1-1) 도서번호가 1인 도서의 이름
select bookid 도서번호, bookname "도서의 이름" 
  from book
  where bookid = 1;
  
-- (1-2) 가격이 20000원 이상인 도서의 이름
select bookname "도서의 이름", price
  from book
  where price >= 20000;
  
-- (1-3 ex1) 박지성의 총 금액 (박지성의 번호는 1번 고정)
select custid 박지성, sum(saleprice) "총 구매액"
  from orders
  where custid = 1
  group by custid;
-- (1-3 ex2) 박지성의 총 금액
select c.name 이름, sum(saleprice) 총구매액
  from orders o inner join customer c on o.custid = c.custid
  where c.name = '박지성'
  group by c.name;  
  
-- (1-4 ex1) 박지성이 구매한 도서의 수 (박지성의 번호는 1번 고정)
select custid 박지성, count(*) "도서의 수" 
  from orders
  where custid = 1
  group by custid;
-- (1-4 ex2) 박지성이 구매한 도서의 수  
select c.name 이름, count(*) "구매 수"
  from orders o inner join customer c on o.custid = c.custid
  where c.name = '박지성'
  group by c.name;  
  
-- (2-1) 마상서점 도서의 총 개수
select count(*) "도서의 총 개수"
  from book;

-- (2-2) 마당서점에 도서를 출고하는 출판사의 총 개수
select count(distinct publisher) "출판사의 총 개수"
  from book;
  
-- (2-3) 모든 고객의 이름, 주소
select c.name 고객이름, c.address 주소
  from customer c;
  
-- (2-4) 2020년 7월 4 ~ 7일 사이에 주문 받은 도서의 주문번호
select orderid 주문번호, orderdate 주문날짜
  from orders
  where orderdate between '2020-07-04' and '2020-07-07';
  
-- (2-5) 2020년 7월 4 ~ 7일 사이에 주문 받은 도서를 제외한 도서의 주문번호
select orderid 주문번호, orderdate 주문날짜
  from orders
  where orderdate not between '20200704' and '20200707';
  
-- (2-6) 성이 '김' 씨인 고객의 이름과 주소
select name 이름 , address 주소
  from customer
  where name like '김%';
  
-- (2-7) 성이 '김' 씨이고 이름이 '아'로 끝나는 고객의 이름과 주소
select name 이름 , address 주소
  from customer
  where name like '김%아';
  
-- (2-8 ex1) 주문하지 않은 고객의 이름
select name
  from customer
  where custid not in (select custid from orders);
-- (2-8 ex2)  
select c.name
  from customer c
  where not exists (select * from orders o where c.custid = o.custid);  
  
select * from customer;    
-- (2-9) 주문 금액의 총액과 주문의 평균 금액
select sum(saleprice) "주문 금액의 총액" , avg(saleprice) "주문의 평균 금액"
  from orders;
  
-- (2-10) 고객의 이름과 고객별 구매액
select c.name, sum(o.saleprice), count(*)
  from customer c left outer join orders o on c.custid = o.custid
  group by c.name;
  
-- (2-11) 고객의 이름과 고객이 구매한 도서 목록
select c.name , b.bookname 
  from customer c left join orders o
                    on c.custid = o.custid
                  left join book b
                    on o.bookid = b.bookid;
                         
-- 2-12 도서의 가격과 판매가격의 차이가 가장 많은 주문
                                        
--(1) insert 예제
select * from book;
desc book;
-- 에러 : 기본키 not null
insert into book (bookname, publisher, price)
  values ('스포츠 세계', '대한미디어', 10000);
-- 해결방안 : 기본키의 값을 넣어준다.
insert into book (bookid, bookname, publisher, price)
  values (11 , '스포츠 세계', '대한미디어', 10000);
  
--(2) delete 예제
delete from book
  where publisher = '삼성당';
     
select * from book;  

--(3) delete 예제 2
select * from book;
--에러 (레코드가 다른 테이블에 참조되고 있음)
delete from book where publisher = '이상미디어';
--해결방안 (참조되고있는 레코드 삭제)
delete from orders where bookid in(7,8);
  
select * from orders;   
    
--(4) update 예제
update book set publisher = '대한출판사'
  where publisher = '대한미디어';
  
select * from book;  

rollback;
commit;

select * from book;