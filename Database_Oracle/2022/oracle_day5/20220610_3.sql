-- 3�� ��������

-- (3-1) �������� ������ ������ ���ǻ�� ���� ���ǻ翡�� ������ ������ ���� �̸�
select distinct c.name
  from customer c , orders o , book b
  where c.custid = o.custid and b.bookid = o.bookid
    and b.publisher in(select publisher from book where bookid 
                        in(select bookid from orders where custid  
                            =(select custid from customer where name = '������')))
    and c.name <> '������';
    
-- (3-2) �� �� �̻��� ���� �ٸ� ���ǻ翡�� ������ ������ ���� �̸�
select t4.name
  from customer t4
  where (select count(distinct t3.publisher)
        from orders t1, customer t2, book t3
        where t1.custid = t2.custid
        and t1.bookid = t3.bookid
        and t2.name = t4.name) >= 2;

-- (3-3) ��ü ���� 30%�̻��� ������ ����
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
                            
-- (4.5) bookcompany ���̺� ����, name�÷��� �⺻Ű
create table bookcompany (
  name varchar2(20),
  address varchar2(20),
  begin date
--  constraint bookcompany_name_pk primary key (name)
);
alter table bookcompany add constraint bookcompany_name_pk primary key (name);
desc bookcompany;
select * from user_constraints where table_name = 'BOOKCOMPANY';

-- (4.6) bookcompany �÷� �߰�
alter table bookcompany add webaddress varchar2(30);

-- (4.7) bookcompany ���ڵ� ����
insert into bookcompany values ('�Ѻ���ī����','����� ������','19930101','http://hanbit.co.kr');
select * from bookcompany;
commit;

-- (6) select ���� -group by
select ���Ƹ�, count(���� ��)
  from ����
  where �л��� > = 10
  group by ���Ƹ�;

-- (7) select ���� -group by
select ���ǻ�, count(*)
  from ����
  where ����⵵ > 2000
  group by ���ǻ�
  having count(*) >= 10;
  
-- (8) select ���� -���տ���
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
union all -- ������(�ߺ�����)
select a from s;

select distinct a from r
union --������(�ߺ�����)
select a from s;

-- (9) 
select 
  from �μ�.�μ���, count(*)
  where ����.�ҼӺμ���ȣ = �μ�.�μ���ȣ
    and ����.�޿� > 40000
  group by �μ�.�μ���;
  
  
  

