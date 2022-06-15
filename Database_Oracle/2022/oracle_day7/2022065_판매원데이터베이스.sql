-- [판매원 데이터베이스]

create table salesperson (
  name    varchar2(20),
  age     number(3),
  salary  number
);
alter table salesperson add constraint salesperson_name_pk primary key (name);

create table customer (
  name          varchar2(20),
  city          varchar2(40),
  industrytype  varchar2(20)
);
alter table customer add constraint customer_name_pk primary key (name);

create table "order" (
  "number"        number,
  custname        varchar2(20),
  salesperson     varchar2(20),
  amount          number
);
alter table "order" add constraint order_number_pk primary key ("number");
alter table "order" add constraint order_custname_fk foreign key (custname)
  references customer(name);
alter table "order" add constraint order_salesperson_fk foreign key (salesperson)
  references salesperson(name); 
  
-- (2)
select distinct name 판매원, to_char(salary,'999,999,999') || '원' 봉급
  from salesperson;

-- (3)
select name 판매원
  from salesperson
  where age < 30;

-- (4)
select *
  from customer
  where city like '%S';
  
-- (5)
select count(distinct custname) "총 고객 수"
  from "order";  
  
-- (6) 
select salesperson 판매원, sum(amount) "주문 수"
  from "order"
  group by salesperson; 
  
-- (7)
select name 판매원, age 나이
  from salesperson
  where name in(select salesperson
                 from "order"
                 where custname in(select name
                                   from customer
                                   where city = 'LA'));
          
-- (8)  
select distinct s.name 판매원, s.age 나이
  from "order" o, customer c, salesperson s
  where o.custname = c.name
    and o.salesperson = s.name
    and c.city = 'LA';
  
-- (9)
select salesperson 판매원
  from "order"
  group by salesperson
  having count(amount) >= 2;
  
-- (10) 
update salesperson set salary = 45000
  where name = 'TOM';
  
select *
  from salesperson;
      