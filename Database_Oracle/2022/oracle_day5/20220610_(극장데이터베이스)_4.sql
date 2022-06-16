drop table reservation;
drop table cinema;
drop table customer;
drop table theater;

--극장
create table theater (
  theater_no    number,
  theater_name  varchar2(60),
  location      varchar2(30), 
  constraint theater_theater_no_pk
    primary key (theater_no) 
);
alter table theater modify theater_name 
  constraint theater_theater_name_nn not null;
--상연관
create table cinema (
  theater_no  number,
  cinema_no   number(2),
  movie_title varchar2(30),
  price       number,
  seats       number,
  constraint cinema_theater$cinema_no_pk
    primary key(theater_no,cinema_no),
  constraint cinema_theater_no_fk
    foreign key (theater_no) references theater(theater_no),
  constraint cinema_price_ck check(price <= 20000),
  constraint cinema_cinema_no_ck check(cinema_no between 1 and 10)
);
alter table cinema modify movie_title 
  constraint cinema_movie_title_nn not null;
  
--고객
create table customer (
  cust_no   number,
  name      varchar2(12),
  address   varchar2(90),
  constraint customer_cust_no primary key (cust_no)
);
alter table customer modify name 
  constraint customer_name_nn not null;  
  
--예약
create table reservation (
  theater_no      number,
  cinema_no       number,
  cust_no         number,
  seat_no         number,
  screening_date  date,
  constraint reservation_theater$cinema$cust_no_pk
    primary key (theater_no,cinema_no,cust_no),
  constraint reservation_theater$cinema_no_fk
    foreign key (theater_no,cinema_no) references cinema(theater_no,cinema_no),
  constraint reservation_cust_no_fk
    foreign key (cust_no) references customer(cust_no)
);

insert into theater values (1,'롯데','잠실');
insert into theater values (2,'메가','강남');
insert into theater values (3,'대한','잠실');

insert into cinema values (1,1,'어려운 영화', 15000, 48);
insert into cinema values (3,1,'멋진 영화', 7500, 120);
insert into cinema values (3,2,'재밌는 영화', 8000, 110);

insert into customer values (3,'홍길동', '강남');
insert into customer values (4,'김철수', '잠실');
insert into customer values (9,'박영회', '강남');

insert into reservation values (3,2,3,15,'20200901');
insert into reservation values (3,1,4,16,'20200901');
insert into reservation values (1,1,9,48,'20200901');
insert into reservation values (3,2,9,20,'20200901');

commit;

-- 모든 극장의 이름과 위치를 보이시오
select theater_name, location 
  from theater;

-- 잠실에 있는 극장을 보이시오
select *
  from theater
  where location like '%잠실%';

-- 잠실에 사는고객의 이름을 오름차순으로 보이시오
select name
  from customer
  where address like '%잠실%'
  order by name;
  
-- 가격이 8000원 이하인 영화를 보이시오
select *
  from cinema
  where price <= 8000;
  
-- 극장 위치와 고객의 주소가 같은 고객을 보이시오
select c.* 
  from theater t, reservation r, customer c 
  where t.theater_no = r.theater_no 
    and r.cust_no = c.cust_no
    and t.location = c.address;
    
select name
  from customer t1
  where address in  (select distinct location
                    from theater t2);
    
-- 극장의 수는 몇 개인가?
select count(*)
  from theater;
  
-- 상영되는 영화의 평균 가격은 얼마인가?
select avg(price)
  from cinema;
  
-- 2020년9월1일에 영화를 관람한 고객의 수는 얼마인가?
select count(*)
  from reservation r
  where r.screening_date = '20200901';
  
-- 대한극장에서 상영된 영화제목을 보이시오
select c.movie_title
  from theater t , cinema c
  where t.theater_no = c.theater_no
    and t.theater_name = '대한';
    
select t3.movie_title
  from cinema t3
  where (t3.theater_no, t3.cinema_no) in (select t1.theater_no,t1.cinema_no
                                           from reservation t1
                                          where t1.theater_no = (select theater_no
                                                                  from theater t2
                                                                  where t2.theater_name = '대한'));
    
-- 대한극장에서 영화를 본 고객의 이름을 보이시오    
select c.name
  from theater t, customer c , reservation r
  where t.theater_no = r.theater_no
    and r.cust_no = c.cust_no
    and t.theater_name = '대한';
      
-- 대한극장의 전체 수입을 보이시오
select sum(c.price)
  from reservation r,theater t, cinema c
  where r.theater_no = t.theater_no
    and r.cinema_no = c.cinema_no
    and r.theater_no = c.theater_no
    and t.theater_name = '대한';
    
-- 극장별 상영관 수를 보이시오
select t.theater_name, count(c.cinema_no)
  from theater t , cinema c
  where t.theater_no = c.theater_no(+)
  group by t.theater_name;
  
-- 잠실에 있는 극장의 상영관을 보이시오
select *
  from cinema
  where theater_no in (select theater_no from theater
                      where location = '잠실');
  
-- 2020년9월1일의 극장별 평균 고객 수를 보이시오
select t.theater_name, count(r.cust_no)
  from theater t, reservation r
  where t.theater_no = r.theater_no(+)
    and r.screening_date = '20200901'
    or  r.cinema_no is null
  group by t.theater_name;
   
-- 2020년9월1일에 가장 많은 고객이 관람한 영화를 보이시오
select *
  from cinema c3
  where (c3.cinema_no, c3.theater_no) in (select c.cinema_no,c.theater_no
                                          from cinema c , reservation r
                                          where c.theater_no = r.theater_no 
                                            and c.cinema_no = r.cinema_no
                                          group by c.cinema_no, c.theater_no
                                          having count(*) = (select max(count(cinema_no))
                                                            from reservation
                                                            where screening_date = '20200901'
                                                            group by theater_no, cinema_no));

select c1.*, cnt 관객수
  from cinema c1 , (select c.cinema_no,c.theater_no, count(*) cnt
                    from cinema c , reservation r
                    where c.theater_no = r.theater_no 
                    and c.cinema_no = r.cinema_no
                    group by c.cinema_no, c.theater_no
                    having count(*) = (select max(count(cinema_no))
                                       from reservation
                                       where screening_date = '20200901'
                                       group by theater_no, cinema_no)) c2
  where c1.cinema_no = c2.cinema_no
    and c1.theater_no = c2.theater_no;

--영화의 가겨을 10퍼 인상하시오
update cinema set price = price * 1.1;                       

