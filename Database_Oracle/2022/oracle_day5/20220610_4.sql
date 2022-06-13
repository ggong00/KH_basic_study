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
insert into customer values (9,'박영회', '박영회');

insert into reservation values (3,2,3,15,'20200901');
insert into reservation values (3,1,4,16,'20200901');
insert into reservation values (1,1,9,48,'20200901');
commit;

select theater_name, location 
  from theater;
  
select *
  from theater
  where location like '잠실';

select name
  from customer
  where address like '잠실'
  order by name;
  
select *
  from cinema
  where price <= 8000;
  
select c.* 
  from theater t, reservation r, customer c 
  where t.theater_no = r.theater_no 
    and r.cust_no = c.cust_no
    and t.location = c.address;
                
select count(*)
  from theater;
  
select avg(price)
  from cinema;
  
select count(*)
  from customer c, reservation r
  where c.cust_no = r.cust_no
    and r.screening_date = '20200901';
    
select c.movie_title
  from theater t , cinema c
  where t.theater_no = c.theater_no
    and t.theater_name = '대한';
    
select *
  from theater t, customer c , reservation r
  where t.theater_no = r.theater_no
    and r.cust_no = c.cust_no
    and t.theater_name = '대한';
    
select sum(c.price)
  from theater t , reservation r, cinema c
  where t.theater_no = r.theater_no
    and r.cinema_no = c.cinema_no
    and t.theater_name = '대한';
    
select t.theater_no, count(c.cinema_no)
  from theater t , cinema c
  where t.theater_no = c.theater_no(+)
  group by t.theater_no;
  
select *
  from cinema
  where theater_no in (select theater_no from theater
                      where theater_name = '대한');
  
select t.theater_no, count(r.cust_no)
  from theater t, reservation r
  where t.theater_no = r.theater_no(+)
    and r.screening_date = '20200901'
  group by t.theater_no , r.screening_date;
  
  select t.theater_name , nvl(t2.co,0)
    from theater t , (SELECT theater_no, count(theater_no) co
                      FROM reservation 
                      WHERE screening_date = '20200901'
                      GROUP By theater_no) t2
  where t.theater_no = t2.theater_no(+);
                           
update cinema set price = price * 1.1;                       

