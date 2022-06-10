SELECT CUSTOMER.* 
  FROM CUSTOMER,ORDERS;

SELECT ORDERS.*
  FROM CUSTOMER, ORDERS;
  
SELECT ORDERS.*,CUSTOMER.*
  FROM CUSTOMER, ORDERS;
  
SELECT CUSTOMER.NAME, ORDERS.ORDERDATE
  FROM CUSTOMER, ORDERS;
  
SELECT T1.NAME , T2.ORDERDATE
  FROM CUSTOMER T1, ORDERS T2; 

select distinct c.name
  from customer c , orders o
  where c.custid = o.custid;
  
--주문이력이 2건 이상인 고객명을 보이시오
select c.name 고객명 , count(*) 주문건수
  from customer c , orders o
  where c.custid = o.custid
  group by name
  having count(*) >= 2
  order by count(*) desc;
  
--고객별 매출액을 산출하고 매출액 내림차순 정렬하시오
select c.name 고객명 , sum(o.saleprice) 매출액
  from customer c , orders o
  where c.custid = o.custid
  group by c.name
  order by 매출액 desc;

--고객별 매출액이 3만원을 초과하는 고객에 대해 매출액 내림차순 정렬하시오
select c.name 고객명 , sum(o.saleprice) 매출액
  from customer c , orders o
  where c.custid = o.custid
  group by c.name
  having sum(o.saleprice) > 30000
  order by 매출액 desc;
  
-- 도서를 구매한 고객명, 도서명, 주문일자를 주문일자를 최신순으로 보이시오
select c.name 고객명, b.bookname 도서명, o.orderdate 주문일자
  from customer c, orders o, book b
  where c.custid = o.custid 
    and o.bookid = b.bookid
  order by 주문일자 desc;
  
--구매이력이 없는 고객조회 (left outer join)
select *
  from customer c , orders o
  where c.custid = o.custid(+)
    and o.orderid is null; 

--구매이력이 없는 고객조회 (right outer join)
select *
  from  customer c, orders o 
  where o.custid(+) = c.custid
    and o.orderid is null; 
    
-- 고객의 이름과 고객이 주문한 도서의 이름을 구하시오
select c.name 이름, b.bookname 도서명
  from customer c , orders o, book b
  where c.custid = o.custid
    and o.bookid = b.bookid;
    
--가격이 2만원인 도서를 주문한 고객의 이름과 도서의 이름을 구하시오
select c.name 이름 ,b.bookname 도서명
  from customer c, orders o, book b
  where c.custid = o.custid 
    and o.bookid = b.bookid
    and b.price >= 20000;
    
-- 도서를 구매하지 않은 고객을 포함하여 고객의 이름과 고객이 주문한 도서의 판매가격을 구하시오
select c.name 이름, o.saleprice 가격
  from customer c, orders o
  where c.custid = o.custid(+);
  
--oracle join sql
select *
  from customer c , orders o
  where c.custid = o.custid;

--oracle join sql
select *
  from customer c , orders o
  where c.custid = o.custid(+)
    and c.name = '박지성';
--ansi join sql
select *
  from customer c inner join orders o 
    on c.custid = o.custid
  where c.name = '박지성';

--ansi left join sql
select *
  from customer c left outer join orders o 
    on c.custid = o.custid;

--가장 비싼 도서의 이름을 보이시오
select bookname
  from book
  where price = (select max(price)
                  from book);
                  
--도서를 구매한 적이 있는 고객의 이름을 검색하시오
select name
  from customer
  where custid in(select custid
          from orders);

--대한미디어에서 출판한 도서를 구매한 고객의 이름을 보이시오
select  name
  from  customer
  where custid in(select  custid
                  from    orders
                  where   bookid in(select bookid
                                    from   book
                                    where  publisher = '대한미디어'));

--출판사별로 출판사의 평균 도서가격보다 비싼 도서를 구하시오
select bookname
  from book b1
  where price > (select avg(price)
                  from book b2
                  where b1.publisher = b2.publisher);
                  
--도서를 주문하지 않은 고객의 이름 (차집합)
select name
  from customer
minus
select name
  from customer
  where custid in(select custid
                  from orders);
 
--주문이 있는 고객의 이름과 주소를 보이시오 (exists)
select c.name, c.address
  from customer c
  where exists(select 1
                from orders o
                where c.custid = o.custid);
                                        
--박지성이 구매한 도서의 출판사 수
select count(distinct b.publisher) "박지성이 구매한 도서의 출판사 수"
  from customer c, orders o, book b
  where c.custid = o.custid 
    and o.bookid = b.bookid
    and c.name = '박지성';]
    
--ANSI)
select count(distinct b.publisher) "박지성이 구매한 도서의 출판사 수"
  from customer c inner join orders o 
                  on c.custid = o.custid
                  inner join book b
                  on o.bookid = b.bookid
  where c.name = '박지성';]
    
select count(distinct publisher) "박지성이 구매한 도서의 출판사 수"
  from book
  where bookid in(select bookid
                  from orders
                  where custid in(select custid
                                  from customer
                                  where name = '박지성'));
    
--박지성이 구매한 도서의 이름. 가격. 정가와 판매가격의 차이
select b.bookname 이름, b.price 가격, b.price - o.saleprice "정가-판매가"  
  from customer c, orders o, book b
  where c.custid = o.custid
    and o.bookid = b.bookid
    and c.name = '박지성';    

--박지성이 구매하지 않은 도서의 이름
select bookname
  from book
  where bookid not in(select bookid
                      from orders
                      where custid in(select custid
                                      from customer
                                      where name = '박지성'));
                                      
select bookname
  from book
  where bookid not in (select t1.bookid
                      from orders t1, customer t2
                      where t1.custid = t2.custid
                      and t2.name = '박지성');

select bookname
  from book t3
  where not exists (select *
                     from orders t1, customer t2
                     where t1.custid = t2.custid
                      and t1.bookid = t3.bookid
                      and t2.name = '박지성');
                      
select bookname
  from book
minus
select t3.bookname
  from orders t1, customer t2, book t3
  where t1.custid = t2.custid
    and t1.bookid = t3.bookid
    and t2.name = '박지성';

select distinct b.bookname
  from book b, orders o, customer c
  where b.bookid = o.bookid(+)
    and o.custid = c.custid(+)    
    and (c.name != '박지성' or c.name is null);

--주문하지 않은 고객의 이름(부속질의 사용)
select name
  from customer
  where custid not in (select custid
                      from orders);
                      
--주문 금액의 총액과 주문의 평균 금액
select sum(saleprice) , avg(saleprice) 
  from orders;
  
--고객의 이름과 고객별 구매액
select c.name, sum(o.saleprice)
  from customer c, orders o
  where c.custid = o.custid
  group by c.name;
  
--고객의 이름과 고객이 구매한 도서 목록
select c.name, b.bookname 
  from customer c, orders o, book b
  where c.custid = o.custid
    and o.bookid = b.bookid;
    
--도서의 가격과 판매가격의 차이가 가장 많은 주문
select o.*
  from orders o, book b
  where o.bookid = b.bookid
    and b.price - o.saleprice = (select max(b.price - o.saleprice)
                                 from orders o , book b
                                  where o.bookid = b.bookid);

--도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름
select name, avg(saleprice)
  from customer c, orders o
  where c.custid = o.custid
  group by name
  having avg(saleprice) > ( select avg(saleprice)
                            from orders);
                                        