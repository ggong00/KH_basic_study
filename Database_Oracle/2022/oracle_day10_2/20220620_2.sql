--시퀀스 생성
create sequence book_bookid_seq;

--시퀀스 채번
select book_bookid_seq.nextval
  from dual;
  
--시퀀스 현재 값  
select book_bookid_seq.currval
  from dual;
  
select * from book;  

insert into book values(book_bookid_seq.nextval,'spring','한빛',35000);

rollback;

--시퀀스 삭제
drop sequence book_bookid_seq;

create sequence book_bookid_seq
increment by -1
start with 29
minvalue 21
maxvalue 30
nocycle;
--cache 3; cache default값이 20 (cycle 범위보다 값이 작아야함)

select 'sbn' || book_bookid_seq.nextval
  from dual;
  
select book_bookid_seq.currval
  from dual;  
  
