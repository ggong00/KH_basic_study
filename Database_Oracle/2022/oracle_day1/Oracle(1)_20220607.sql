select * from book;

insert into book (bookid, bookname, publisher, price) 
      values (11, '������ ����', '�Ѽ����м���', 90000);
  
ROLLBACK; --�ӽ������� ���
commit; --�����ͺ��̽��� �����ݿ�
 
insert into book (bookid, bookname, publisher)
      values (14, '������ ����', '�Ѽ����м���');
      
insert into book(bookid, bookname, price, publisher)
      select bookid, bookname, price, publisher
      from Imported_Book;
      
rollback;

/* insert into �÷�����Ʈ ���� ���� - ��� �÷��� ���� �����Ҷ� */
insert into book 
      values (15, '�����ͺ��̽�', '�Ѻ��̵��', 30000);
      
update customer 
  set address = '���ѹα� �λ�'
  where custid = 5;
  
select * from customer;

commit;

delete from customer; -- ���� ���Ἲ �������� ����

delete from customer  -- custid = 5 ���ڵ�� �������� ����
    where custid = 5;
    
commit;

ROLLBACK;

