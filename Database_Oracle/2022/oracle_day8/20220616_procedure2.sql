/* 프로시저 예제 3 (out)*/
create or replace procedure averagePrice (
  averageVal out number

)
as
begin
  select avg(price)
    into averageVal
    from book
    where price is not null;
end;


/* 테스트 (익명프로시저) */
set serveroutput on;
declare
  average number;
begin
  averageprice(average);
  DBMS_OUTPUT.PUT_LINE('책 평균' || average);
end;

/* 프로시저 삭제*/
drop procedure averageprice;



