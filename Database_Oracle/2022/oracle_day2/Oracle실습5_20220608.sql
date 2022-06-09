-- part3 연습문제

-- (1.1) 도서번호가 1인 도서의 이름
select bookname
    from book
    where bookid = 1;

-- (1.2) 가격이 20000원 이상인 도서의 이름
select bookname
    from book
    where price >= 20000;
    
-- (1.3) 박지성의 총 구매액
select sum(o.saleprice)
    from customer c, orders o
    where c.custid = o.custid 
        and c.name = '박지성';

-- (1.4) 박지성이 구매한 도서의 수
select count(*)
    from customer c, orders o
    where c.custid = o.custid
        and c.name like '박지성';

-- (1.5) 박지성이 구매한 도서의 출판사 수
select count(distinct b.publisher)
    from customer c, orders o, book b
    where c.custid = o.custid 
        and o.bookid = b.bookid
        and c.name = '박지성';

-- (1.6) 박지성이 구매한 도서의 이름, 가격, 정가와 판매가격의 차이
select b.bookname, b.price, abs(b.price - o.saleprice)
    from customer c, orders o, book b
    where c.custid = o.custid and o.bookid = b.bookid
        and c.name = '박지성';

-- (1.7) 박지성이 구매하지 않은 도서의 이름
select bookname
    from book
    where bookname not in (select bookname from book b, customer c, orders o 
                            where b.bookid = o.bookid and o.custid = c.custid
                            and c.name = '박지성');
                            
-- (2.1) 마당서점 도서의 총 수
select count(*)
    from book;
    
-- (2.2) 마당서점에 도서를 출고하는 출판사의 총 수
select count(distinct publisher)
    from book;

-- (2.3) 모든 고객의 이름, 주소
select name, address
    from customer;
    
-- (2.6) 성이 김 씨인 고객의 이름과 주소
select name, address
    from customer
    where name like '김%';

-- (2.8) 주문하지 않은 고객의 이름
select name
    from customer
    where custid not in (select distinct custid from orders);

-- (2.9) 주문 금액의 총액과 주문의 평균 금액
select sum(saleprice), avg(saleprice)
    from orders;
    
-- (2.10) 고객의 이름과 고객별 구매액    
select c.name, sum(o.saleprice) 
    from customer c, orders o
    where c.custid = o.custid
    group by c.name;

-- (2.11) 고객의 이름과 고객이 구매한 도서 목록
select c.name, b.bookname
    from customer c, book b, orders o
    where c.custid = o.custid and b.bookid = o.bookid;
        
-- (2.12) 도서의 가격과 판매가격의 차이가 가장 많은 주문
select o.*
    from orders o, book b
    where o.bookid = b.bookid and abs(o.saleprice - b.price) = 
                                    (select max(abs(o2.saleprice - b2.price))
                                    from orders o2,book b2 
                                    where o2.bookid = b2.bookid);
    
-- (2.13) 도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름
select c.name, avg(o.saleprice)
    from customer c, orders o
    where c.custid = o.custid
    group by c.name    
    having avg(o.saleprice) > (select avg(price) from book);
    
-- (3.1) 박지성이 구매한 도서의 출판사/와 같은 출판사에서/ 도서를 구매한 고객의 이름/    
select c.name 
    from customer c, orders o, book b 
    where c.custid = o.custid and o.bookid = b.bookid
        and c.name != '박지성' and b.publisher in (select publisher from customer c2, orders o2, book b2
                                                  where c2.custid = o2.custid and o2.bookid = b2.bookid
                                                    and c2.name = '박지성'); 
                                                    
-- (3.2) 두 개 이상의 서로 다른 출판사에서 도서를 구매한 고객의 이름                                                     
select name
  from customer
  where name in(select c.name
  from book b , customer c, orders o
  where b.bookid = o.bookid and c.custid = o.custid
  group by c.name having count(distinct b.publisher) >=2);

-- (3.3) 전체 고객의 30% 이상이 구매한 도서
select *
  from book
  where bookname in (select b.bookname
                      from orders o , book b
                      where o.bookid = b.bookid
                      group by b.bookname
                      having count(*) >= (select count(*)*0.3
                                           from customer));

-- (5) exists을 사용하고 결과 값 확인하기
select *
  from customer c1
  where not exists (select * from orders c2
                    where c1.custid = c2.custid);



    















