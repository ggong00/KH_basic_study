--������ ����
create sequence book_bookid_seq;

--������ ä��
select book_bookid_seq.nextval
  from dual;
  
--������ ���� ��  
select book_bookid_seq.currval
  from dual;
  
select * from book;  

insert into book values(book_bookid_seq.nextval,'spring','�Ѻ�',35000);

rollback;

--������ ����
drop sequence book_bookid_seq;

create sequence book_bookid_seq
increment by -1
start with 29
minvalue 21
maxvalue 30
nocycle;
--cache 3; cache default���� 20 (cycle �������� ���� �۾ƾ���)

select 'sbn' || book_bookid_seq.nextval
  from dual;
  
select book_bookid_seq.currval
  from dual;  
  
