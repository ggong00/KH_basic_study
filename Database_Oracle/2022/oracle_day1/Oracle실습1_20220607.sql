/* BOOK 모든컬럼 */
SELECT * FROM ORDERS;

/* BOOK 특정컬림1 */
SELECT BOOKNAME FROM BOOK;

/* BOOK 특정컬럼2 */
SELECT BOOKNAME,PRICE FROM BOOK;

/* CUSTOMER 모든컬럼 */
SELECT * FROM CUSTOMER;

/* ORDERS 모든컬럼 */
SELECT * FROM ORDERS;

/* BOOK 도서 이름에 특정 패턴의 문자를 포함한 레코드 검색 */
SELECT * FROM BOOK WHERE BOOKNAME LIKE '%축구%';
SELECT * FROM BOOK WHERE BOOKNAME LIKE '%역사';
SELECT * FROM BOOK WHERE BOOKNAME LIKE '골프%';

/* BOOK 특정출판사에 해당하는 레코드 검색 */
SELECT * FROM BOOK WHERE PUBLISHER = '굿스포츠';

/* BOOK 도서 가격이 얼마 이상, 이하 등 조건 검색 */
SELECT * FROM BOOK WHERE PRICE = 7000;
SELECT * FROM BOOK WHERE PRICE > 7000;
SELECT * FROM BOOK WHERE PRICE < 7000;
SELECT * FROM BOOK WHERE PRICE != 7000;

/* BOOK 도서 가격 범위 조회 */
SELECT * FROM BOOK WHERE PRICE >= 7000 AND PRICE <= 10000;
SELECT * FROM BOOK WHERE PRICE BETWEEN 7000 AND 10000;
SELECT * FROM BOOK WHERE PRICE = 7000 OR PRICE = 8000;
SELECT * FROM BOOK WHERE NOT(PRICE = 7000 OR PRICE = 8000);
SELECT * FROM BOOK WHERE PRICE != 7000 AND PRICE != 8000;

/* SUM 함수를 사용하여 특정 컬럼의 값 계산 */
SELECT SUM(PRICE) FROM BOOK;
SELECT SUM(PRICE) FROM BOOK WHERE PUBLISHER = '굿스포츠';

/* AS , 띄어쓰기를 이용한 별칭 */
SELECT NAME "이 름", PHONE AS "전화번호" 
FROM CUSTOMER 
WHERE NAME = '김연아';

/* SELECT 컬럼명 위치에 따른 결과값 */    
SELECT BOOKNAME, PRICE FROM BOOK;
SELECT PRICE , BOOKNAME FROM BOOK;

/* SELECT 실습  */
SELECT BOOKID, BOOKNAME, PUBLISHER, PRICE 
  FROM BOOK;
    
SELECT *    
  FROM BOOK;
    
SELECT DISTINCT(PUBLISHER)FRDISTINCT 
  FROM BOOK;

SELECT COUNT(DISTINCT(PUBLISHER))
  FROM BOOK;
    
SELECT * 
  FROM BOOK;

SELECT * 
  FROM BOOK 
  WHERE PUBLISHER NOT IN ('굿스포츠','대한미디어');

SELECT NAME  
  FROM CUSTOMER
  WHERE PHONE IS NULL;
    
SELECT *
  FROM BOOK
  WHERE PRICE < 20000;
    
SELECT *
  FROM BOOK
  WHERE PRICE BETWEEN 10000 AND 20000;

SELECT *
  FROM BOOK
  WHERE PRICE >= 10000 AND PRICE <= 20000;
  
SELECT * 
  FROM BOOK
  WHERE BOOKNAME LIKE '_구%';
  
SELECT * 
  FROM BOOK
  WHERE BOOKNAME LIKE '골프' || ' 바이블';
  
SELECT *
  from book
  where bookname like '_____억';

select *
  from book
  where bookname like '__의%';
  
select *
  from book
  where BOOKNAME like '%축구%' and price >= 20000;

select *
  from book
  where PUBLISHER = '굿스포츠' or PUBLISHER = '대한미디어';
  
SELECT *
  FROM BOOK
  ORDER BY BOOKNAME;
  
SELECT *
  FROM BOOK
  ORDER BY PRICE DESC;

SELECT *
  FROM BOOK
  ORDER BY PRICE DESC, BOOKNAME ASC;
  
SELECT SUM(saleprice) "총매출"
  FROM orders;
  
SELECT SUM(saleprice) 
  FROM orders;
  
select SUM(saleprice) "총매출"
  FROM orders
  where CUSTID = 2;
  
SELECT SUM(saleprice) AS Total,
       AVG(saleprice) AS Average,
       MIN(saleprice) AS Minimum,
       MAX(saleprice) AS Maximum
  FROM Orders;       
  
SELECT COUNT(*)
  FROM ORDERS
  WHERE CUSTID = 1;
  
select * from orders;
  
select custid, count(*) 도서수량, sum(saleprice) 총액
  from orders 
  where saleprice > 10000 --속성(컬럼) 필터링
  group by custid --group by에 나열한 속성만 집계함수와 같이 select절에 사용가능
  having count(*) >= 2  --집계함수로 필터링
  order by custid desc; --정렬은 마지마
    
select custid , count(*) 도서수량 , sum(saleprice) 총액
  from orders
  where saleprice >= 8000
  group by custid
  having count(*) >= 2;
  
  
  
  
