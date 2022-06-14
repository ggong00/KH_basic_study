-- [숫자 함수]

-- 절댓값
select abs(-78) , abs(78)
  from dual;
  
-- 반올림 
select round(4.875,1)
  from dual;
  
-- 평균 반올림  
select custid, round(avg(saleprice),-3)
  from orders
  group by custid;
  
select custid, round(sum(saleprice)/count(*),-3)
  from orders
  group by custid;
  
-- [문자 합수]  

-- replace(문자열 변환)
select bookid, replace(bookname,'야구','농구') bookname, publisher, price
  from book;
  
-- length(글자 수 반환) lengthb(바이트 수 반환)  
select bookname 제목, length(bookname) 글자수, lengthb(bookname) 바이트수
  from book;
  
-- substr(서브문자 반환)  
select substr(name,1,1) 성 , count(*) 인원
  from customer
  group by substr(name,1,1);
    
-- [날짜 함수]

-- 시스템상 시간정보
select sysdate
  from dual;
  
-- date 반환  
select to_date('20220613','yyyy-mm-dd')
  from dual;
  
-- 요일 (일 =1 , 월=2 ...)  
select to_char(to_date('20220614','yyyy-mm-dd'),'d')
  from dual;

select to_char(to_date('20220614','yyyy-mm-dd'),'dy')
  from dual;
  
select to_char(to_date('20220614','yyyy-mm-dd'),'day')
  from dual;  
  
--날짜(달기준)  
select to_char(to_date('20220614','yyyy-mm-dd'),'dd')
  from dual;  
  
--날짜(년기준)  
select to_char(to_date('20220614','yyyy-mm-dd'),'ddd')
  from dual;  
  
--시간(12시간 기준)
select to_char(to_date('2022-06-14 02:01:10','yyyy-mm-dd-hh24-mi-ss'),'hh')
  from dual;
  
select to_char(sysdate,'hh')
  from dual;
  
--시간(24시간기준)  
select to_char(sysdate,'hh24')
  from dual;  
  
--분  
select to_char(sysdate,'mi')
  from dual;  
  
--월  
select to_char(sysdate,'mm')
  from dual;  
  
select to_char(sysdate,'mon')
  from dual;  
  
select to_char(sysdate,'month')
  from dual;  
  
--초
select to_char(sysdate,'ss')
  from dual;
  
--년도  
select to_char(sysdate,'yyyy')
  from dual;  
  
--년도 자리 수  
select to_char(sysdate,'y')
  from dual;  
  
--활용 예제  
select to_char(orderdate,'yyyy') 년,
       to_char(orderdate,'mon') 월,
       to_char(orderdate,'d') 일,
       to_char(orderdate,'hh') 시간,
       to_char(orderdate,'mi') 분,
       to_char(orderdate,'ss') 초       
  from orders;
  
select *
  from orders;

select to_char(orderdate,'yyyy-mm-dd'), count(*)
  from orders
  group by to_char(orderdate,'yyyy-mm-dd');
  
select to_char(orderdate,'yyyy') 년,
       to_char(orderdate,'mm') 월,
       to_char(orderdate,'dd') 일,
       count(*)
  from orders
  group by  to_char(orderdate,'yyyy'),
            to_char(orderdate,'mm'),
            to_char(orderdate,'dd');
      
select orderid, orderdate, add_months(orderdate,2) + 3
  from orders;
    
select orderid, to_char(orderdate,'yyyy-mm-dd dy'), custid, bookid
  from orders
  where orderdate = to_date('20200707', 'yyyymmdd');
  
select sysdate, to_char(sysdate,'yyyy/mm/dd dy hh24:mi:ss')
  from dual;

-- null 특징  
insert into book (bookid,bookname,publisher) values(11,'데이터베이스','한빛');

-- 집계함수에 *을 넣으면 모든 레코드 특정 컬럼을 넣으면 null을 제외한다.
select count(price)
  from book;
  
select sum(price)/count(price)
  from book;
  
select (select count(*)
        from book
        where price >= 10000)
        +
       (select count(*)
        from book
        where price < 10000) 
  from dual;        
  
update book
  set price = price +1000;
  
select * from book;  
  
select count(price)
  from book
  where price > 50000;
  
select name, address, nvl(phone,'연락처 없음'),nvl2(phone , '연락처있음','연락처없음')
  from customer;
  
-- rownum
select rownum,name,address,phone
  from customer
  where rownum <= 3;  
  
--도서 가격이 높은순으로 상위2개 행만 보이시오.(단 행번호를 순차적으로 표기하시오)
select rownum 행번호 ,b.*
  from (select book.* 
        from book 
        order by price desc) b
  where rownum <= 2;