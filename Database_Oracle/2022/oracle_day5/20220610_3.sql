-- 3장 연습문제

-- (3-1) 박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객의 이름
select distinct c.name
  from customer c , orders o , book b
  where c.custid = o.custid and b.bookid = o.bookid
    and b.publisher in(select publisher from book where bookid 
                        in(select bookid from orders where custid  
                            =(select custid from customer where name = '박지성')))
    and c.name <> '박지성';
    
-- (3-2) 두 개 이상의 서로 다른 출판사에서 도서를 구매한 고객의 이름
select t4.name
  from customer t4
  where (select count(distinct t3.publisher)
        from orders t1, customer t2, book t3
        where t1.custid = t2.custid
        and t1.bookid = t3.bookid
        and t2.name = t4.name) >= 2;

-- (3-3) 전체 고객의 30%이상이 구매한 도서
select b.bookname
  from book b
  where (select count(bookid)
          from orders o
          where b.bookid = o.bookid ) > (select count(*)*0.3
                                         from customer);
                                         
select b.bookname, count(b.bookid)
  from orders o , book b
  where o.bookid = b.bookid
  group by b.bookid, b.bookname
  having count(b.bookid) >= (select count(*)*0.3
                            from customer);
                            
-- (4.5) bookcompany 테이블 생성, name컬럼은 기본키
create table bookcompany (
  name varchar2(20),
  address varchar2(20),
  begin date
--  constraint bookcompany_name_pk primary key (name)
);
alter table bookcompany add constraint bookcompany_name_pk primary key (name);
desc bookcompany;
select * from user_constraints where table_name = 'BOOKCOMPANY';

-- (4.6) bookcompany 컬럼 추가
alter table bookcompany add webaddress varchar2(30);

-- (4.7) bookcompany 레코드 삽입
insert into bookcompany values ('한빛아카데미','서울시 마포구','19930101','http://hanbit.co.kr');
select * from bookcompany;
commit;

-- (6) select 예제 -group by
select 동아리, count(과제 수)
  from 과제
  where 학생수 > = 10
  group by 동아리;

-- (7) select 예제 -group by
select 출판사, count(*)
  from 도서
  where 발행년도 > 2000
  group by 출판사
  having count(*) >= 10;
  
-- (8) select 예제 -집합연산
create table R (
  a char(1),
  b char(1),
  c char(1)
);
alter table r modify c char(2);

create table S (
  a char(1),
  d char(1),
  e char(1)
);  

insert into r values('1','a','10');
insert into r values('1','a','11');
insert into r values('1','a','25');
insert into r values('2','b','22');
insert into r values('3','b','21');
insert into r values('4','c','17');

insert into s values('1','p','x');
insert into s values('1','p','y');
insert into s values('2','q','y');
insert into s values('4','r','w');
insert into s values('6','s','z');

commit;
select * from r;
select * from s;

select distinct a from r
union all -- 합집합(중복포함)
select a from s;

select distinct a from r
union --합집함(중복제거)
select a from s;

-- (9) 
select 
  from 부서.부서명, count(*)
  where 직원.소속부서번호 = 부서.부서번호
    and 직원.급여 > 40000
  group by 부서.부서명;
  
  
  

