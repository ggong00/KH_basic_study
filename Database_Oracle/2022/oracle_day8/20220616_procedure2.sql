/* ���ν��� ���� 3 (out)*/
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


/* �׽�Ʈ (�͸����ν���) */
set serveroutput on;
declare
  average number;
begin
  averageprice(average);
  DBMS_OUTPUT.PUT_LINE('å ���' || average);
end;

/* ���ν��� ����*/
drop procedure averageprice;



