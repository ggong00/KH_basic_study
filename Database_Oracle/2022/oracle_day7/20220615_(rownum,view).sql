-- rownum 실습
select * 
  from book;
  
select *  
  from book
  where rownum <=5;
  
select *  
  from book
  where rownum <= 5
  order by price;
  
select *  
  from (select * from book order by price)
  where rownum <= 5;
  
select *
  from (select * from book where rownum <= 5)
  order by price;
  
select *
  from (select * from book where rownum <= 5 order by price);
        
-- 부속질의 실습        
select od.* , rownum || '위' "고객별 총판매순위"
  from (   select od.custid 고객번호,
                  (select substr(cs.name,1,1) || '**'
                    from customer cs
                    where od.custid = cs.custid) 고객이름,
                  to_char(round(sum(od.saleprice),-4),'999,999') || '원' 구매액
            from orders od
            group by od.custid
            having sum(od.saleprice) > (select avg(saleprice)
                                        from orders)
            order by sum(od.saleprice) desc) od
  where rownum <= 2
  order by rownum desc;
  
-- 컬럼추가  
alter table orders add bookname varchar2(40);

-- 연관된 데이터 삽입
update orders o
  set bookname = (select bookname
                  from book b
                  where o.bookid = b.bookid);
                                    
select * from orders;

-- 컬럼삭제
alter table orders drop column bookname;

-- 인라인 뷰
select c.name, sum(saleprice)
  from orders o , (select *
                    from customer
                    where custid <= 2) c
  where o.custid = c.custid
  group by c.name;                    
  
-- 부속질의 실습
select od.custid, sum(saleprice), (select name
                                  from customer cs
                                  where od.custid = cs.custid)
  from orders od
  group by od.custid;
  
select cs.name, s
  from (select custid,round(avg(saleprice),0) s
        from orders
        group by custid) od , customer cs
  where od.custid = cs.custid;

select sum(saleprice) 
  from orders od
  where exists (select 1
                from customer cs
                where od.custid = cs.custid and cs.custid <= 3);
                
-- 뷰 실습

-- 생성
create view vw_book as 
select *
  from book
  where bookname like '%축구%';
  
-- 테스트  
select publisher, count(*)
  from vw_book
  group by publisher;

-- 생성  
create view vw_sales_info as
select t1.orderid, t1.saleprice, t1.orderdate,
       t2.custid, t2.name, t2.address, t2.phone,
       t3.bookid, t3.bookname, t3.publisher, t3.price
  from orders t1, customer t2, book t3
  where t1.custid = t2.custid
    and t1.bookid = t3.bookid;
  
-- 테스트    
select name 고객명, sum(saleprice) 총판매액
  from vw_sales_info
  group by name
  order by sum(saleprice) desc;
  
select publisher 출판사, sum(saleprice) 총판매액
  from vw_sales_info
  group by publisher
  order by sum(saleprice) desc;

-- 생성
create view vw_customer as
select *
  from customer
  where address like '%대한민국%';
  
-- 수정  
create or replace view vw_customer as
select custid 고객번호 ,name 고객명,address 주소
  from customer
  where address like '%영국%';
  
select *
  from vw_customer;

-- 삭제       
drop view vw_customer;

-- 연습문제 (4장)

-- (8-1)
create view vw_highorders as
select b.bookid 도서번호, b.bookname 도서이름, c.name 고객이름,
       b.publisher 출판사, o.saleprice 판매가격
  from customer c, orders o, book b
  where o.custid = c.custid
    and o.bookid = b.bookid
    and o.saleprice >= 20000;
    
-- (8-2)
select 도서번호, 고객이름
  from vw_highorders;
  
-- (8-3)
create or replace view vw_highorders as
select b.bookid 도서번호, b.bookname 도서이름, c.name 고객이름,
       b.publisher 출판사
  from customer c, orders o, book b
  where o.custid = c.custid
    and o.bookid = b.bookid
    and o.saleprice >= 20000;
    
-- 뷰 이름 변경    
rename vw_highorders to vw_highorders2;

