-- [�ε���]

-- �ε��� ����
create index ix_Book on book(bookname desc);
create index ix_Book2 on book(publisher,price);

-- �ε��� �����
alter index ix_Book2 rebuild;

-- �ε��� ����
drop index ix_Book;
drop index ix_Book2;

-- �׽�Ʈ
select *
  from book
  where publisher = '���ǻ�2500'
    and price >= 2000;
    
select bookname
  from book
  where bookname like '�����ͺ��̽�%1%';
    
alter table book modify bookid number(4);

declare
begin
  for i in 11..9999 loop
    insert into book values (i,'�����ͺ��̽�' || i, '���ǻ�' || i, i);
  end loop;
end; 

select count(*)
  from book;  
  
select *
  from book;
  
-- ��������

-- (16-1)
select name 
  from customer
  where custid = 5;
  
-- (16-3)
create index ix_name on customer(name);

-- (16-5)
drop index ix_name;


