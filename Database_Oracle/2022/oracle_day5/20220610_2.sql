--newbook 테이블 생성
create table newbook (
  bookid      number,
  bookname    varchar2(20),
  publisher   varchar2(20),
  price       number
);

--컬럼 추가
alter table newbook add isbn varchar2(13);

--컬럼 수정
alter table newbook modify isbn number;

--컬럼 삭제
alter table newbook drop column isbn;

--컬럼 not null 제약조건 추가
alter table newbook modify bookid number not null; 

--컬럼 not null 제약조건 추가(이름명시)
alter table newbook modify bookid constraint newbook_bookid_nn not null;

--컬럼 기본키 제약조건 추가
alter table newbook add primary key(bookid);

--컬럼 기본키 제약조건 추가(이름명시)
alter table newbook add constraint newbook_bookid_pk primary key(bookid);

--테이블 삭제
drop table newbook;

select * from user_constraints where table_name = 'NEWBOOK';
desc newbook;
