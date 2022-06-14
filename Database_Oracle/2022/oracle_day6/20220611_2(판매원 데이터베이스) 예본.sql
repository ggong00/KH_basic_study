create table salesperson (
  name    varchar2(20),
  age     number(3),
  salary  number
);
alter table salesperson add constraint salesperson_name_pk primary key (name);

create table customer (
  name          varchar2(20),
  city          number(3),
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
 