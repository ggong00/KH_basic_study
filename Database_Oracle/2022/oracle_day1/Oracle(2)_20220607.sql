/* BOOK ����÷� */
SELECT * FROM ORDERS;

/* BOOK Ư���ø�1 */
SELECT BOOKNAME FROM BOOK;

/* BOOK Ư���÷�2 */
SELECT BOOKNAME,PRICE FROM BOOK;

/* CUSTOMER ����÷� */
SELECT * FROM CUSTOMER;

/* ORDERS ����÷� */
SELECT * FROM ORDERS;

/* BOOK ���� �̸��� Ư�� ������ ���ڸ� ������ ���ڵ� �˻� */
SELECT * FROM BOOK WHERE BOOKNAME LIKE '%�౸%';
SELECT * FROM BOOK WHERE BOOKNAME LIKE '%����';
SELECT * FROM BOOK WHERE BOOKNAME LIKE '����%';

/* BOOK Ư�����ǻ翡 �ش��ϴ� ���ڵ� �˻� */
SELECT * FROM BOOK WHERE PUBLISHER = '�½�����';

/* BOOK ���� ������ �� �̻�, ���� �� ���� �˻� */
SELECT * FROM BOOK WHERE PRICE = 7000;
SELECT * FROM BOOK WHERE PRICE > 7000;
SELECT * FROM BOOK WHERE PRICE < 7000;
SELECT * FROM BOOK WHERE PRICE != 7000;

/* BOOK ���� ���� ���� ��ȸ */
SELECT * FROM BOOK WHERE PRICE >= 7000 AND PRICE <= 10000;
SELECT * FROM BOOK WHERE PRICE BETWEEN 7000 AND 10000;
SELECT * FROM BOOK WHERE PRICE = 7000 OR PRICE = 8000;
SELECT * FROM BOOK WHERE NOT(PRICE = 7000 OR PRICE = 8000);
SELECT * FROM BOOK WHERE PRICE != 7000 AND PRICE != 8000;

/* SUM �Լ��� ����Ͽ� Ư�� �÷��� �� ��� */
SELECT SUM(PRICE) FROM BOOK;
SELECT SUM(PRICE) FROM BOOK WHERE PUBLISHER = '�½�����';

/* AS , ���⸦ �̿��� ��Ī */
SELECT NAME "�� ��", PHONE AS "��ȭ��ȣ" 
FROM CUSTOMER 
WHERE NAME = '�迬��';

/* SELECT �÷��� ��ġ�� ���� ����� */    
SELECT BOOKNAME, PRICE FROM BOOK;
SELECT PRICE , BOOKNAME FROM BOOK;

/* SELECT �ǽ�  */
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
  WHERE PUBLISHER NOT IN ('�½�����','���ѹ̵��');

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
  WHERE BOOKNAME LIKE '_��%';
  
SELECT * 
  FROM BOOK
  WHERE BOOKNAME LIKE '����' || ' ���̺�';
  
SELECT *
  from book
  where bookname like '_____��';

select *
  from book
  where bookname like '__��%';
  
select *
  from book
  where BOOKNAME like '%�౸%' and price >= 20000;

select *
  from book
  where PUBLISHER = '�½�����' or PUBLISHER = '���ѹ̵��';
  
SELECT *
  FROM BOOK
  ORDER BY BOOKNAME;
  
SELECT *
  FROM BOOK
  ORDER BY PRICE DESC;

SELECT *
  FROM BOOK
  ORDER BY PRICE DESC, BOOKNAME ASC;
  
SELECT SUM(saleprice) "�Ѹ���"
  FROM orders;
  
SELECT SUM(saleprice) 
  FROM orders;
  
select SUM(saleprice) "�Ѹ���"
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
  
select custid, count(*) ��������, sum(saleprice) �Ѿ�
  from orders 
  where saleprice > 10000 --�Ӽ�(�÷�) ���͸�
  group by custid --group by�� ������ �Ӽ��� �����Լ��� ���� select���� ��밡��
  having count(*) >= 2  --�����Լ��� ���͸�
  order by custid desc; --������ ������
    
select custid , count(*) �������� , sum(saleprice) �Ѿ�
  from orders
  where saleprice >= 8000
  group by custid
  having count(*) >= 2;
  
  
  
  