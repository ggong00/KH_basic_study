-- newbook 테이블 생성 (기본)
create table NewBook (
  bookid    number,
  bookname  varchar2(20),
  publisher varchar2(20),
  price     number
);

-- newbook 테이블 생성(제약조건)
create table NewBook (
  bookid    number,  -- PRIMARY KEY,
  bookname  varchar2(20),
  publisher varchar2(20),
  price     number default (1000) check(price >= 1000),
  PRIMARY KEY(bookid)
);

-- newcustomer 테이블 생성
create table newcustomer (
  custid    number,
  name      varchar2(40),
  address   varchar2(40),
  phone     varchar2(30)
);

-- neworders 테이블 생성
create table neworders (
  orderid   number,
  custid    number,
  bookid    number,
  saleprice number,
  orderdate date
--  constraint neworders_ordersid_pk PRIMARY KEY(orderid),
--  constraint neworders_custid_fk foreign key(custid) references newcustomer(custid)
);

-- 기본키
alter table neworders add constraint neworders_orderid_pk primary key (orderid);
alter table newcustomer add constraint newcustomer_custid_pk PRIMARY KEY (custid);
alter table newbook add constraint newbook_bookid_pk primary key (bookid);

-- not null 제약조건
alter table neworders modify custid constraint neworders_custid_nn not null; 
alter table neworders modify bookid constraint neworders_bookid_nn not null;

-- 외래키
alter table neworders add constraint neworders_custid_fk foreign key(custid) 
  references newcustomer(custid) on delete set null;
alter table neworders add constraint neworders_bookid_fk foreign key(bookid) 
  references newbook(bookid);

-- 제약조건 삭제
alter table neworders drop constraint neworders_custid_fk;
alter table neworders drop constraint neworders_custid_nn;

-- 제약조건 조회  
select * from user_constraints where table_name = 'NEWORDERS';
  
-- 테이블 생성 후 제약조건 추가 
alter table newbook add Constraint newbook_bookid_pk primary key (bookid);
alter table newbook add Constraint newbook_price_ch check(price>1000);

-- 테이블 생성 후 default 지정 (oracle에서 default는 제약이 아니다) 
alter table newbook modify price default 1000;

-- 테스트 (제약조건)
desc newbook;
insert into newbook values (1,'데이터베이스','한빛',-30000);
insert into newbook values (2,'데이터베이스','한빛',30000);
select * from newbook;
INSERT INTO newbook VALUES (null,null,null,null);
insert into newbook (bookid, bookname, publisher)values (3,'자바','정보');

-- 테이블 삭제
drop table newbook;
drop table newcustomer;
drop table neworders;

select * from newcustomer;
select * from newbook;
select * from neworders;

--테스트 2 (참조무결성)
insert into newcustomer values (1,'홍길동' , '울산 남구', '010-1111-1111');
insert into newbook values (1,'데이터베이스' , '한빛', 30000);
insert into neworders values (1,1,1,15000,'20220101');
desc neworders;
commit;

delete from newcustomer where custid = 1;
