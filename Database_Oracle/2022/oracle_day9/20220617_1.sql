-- PL문법을 활용한 프로시저
create or replace procedure Interest 
as
  myInterest number;
  price number;
  cursor InterestCursor is select saleprice from orders;
begin
  myInterest := 0.0;
  open InterestCursor;
  loop
    fetch interestCursor into price;
    exit when interestCursor%notfound;
    if price >= 30000 then
      myInterest := myInterest + price * 0.1;
    else
      myInterest := myInterest + price * 0.05;
    end if;  
  end loop;
  close interestCursor;
end;

-- PL문법을 활용한 프로시저 실습
create or replace procedure Interest2
as
myInterest number;
price number;
cursor InterestCursor is select saleprice from orders;
begin
  myInterest := 0.0;
  open InterestCursor;
  while InterestCursor%found 
  loop
  fetch InterestCursor into price;
    if price >= 30000 then
      myInterest := myInterest + price * 0.1;
    else
      myInterest := myInterest + price * 0.05;
    end if;  
  end loop;
  close InterestCursor;
  dbms_output.put_line('전체 이익 금액' || myInterest);
end;









