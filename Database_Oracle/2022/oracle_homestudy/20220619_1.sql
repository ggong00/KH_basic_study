-- 5장 연습문제
set serveroutput on;
-- (9-4) 고객별 도서를 몇 권 구입했는지와 총 구매액을 보이시오
create or replace procedure ex_9_4 
as
custName customer.name%type;
countOrder number;
cursor c1 is select c.name, count(o.orderid)
              from orders o, book b , customer c
              where c.custid = o.custid(+)
               and b.bookid(+) = o.bookid
              group by c.custid,c.name;
begin
  open c1;
  loop 
  fetch c1 into custName,countOrder;
  exit when c1%notfound;
  dbms_output.put_line('이름 : ' || custName || ' 도서 구입 수 : ' || countOrder);
  end loop;
  close c1;
end;

exec EX_9_4;

-- (9-5) 주문이 있는 고객의 이름과 주문 총액을 출력하고 주문이 없는 고객의 이름만 출력하는 프로시스를 작성하시오
create or replace procedure ex_9_5 
as
  custname      customer.name%type;
  sumsaleprice  number;
  cursor c1 is select c.name , nvl(sum(o.saleprice),0)
                from customer c, orders o
                where c.custid = o.custid(+)
                group by c.custid, c.name;
begin
  open c1;
  loop
  fetch c1 into custname,sumsaleprice;
  exit when c1%notfound;
    if sumsaleprice = 0 then
      dbms_output.put_line('이름 : ' || custname);
    else
      dbms_output.put_line('이름 : ' || custname || ' 주문 총액 : ' || sumsaleprice);
    end if;  
  end loop;
  close c1;
end;

exec EX_9_5;

-- (10-1)
create or replace function grade(
  sumOfSaleprice number  
)return varchar2
as
  gradeInfo varchar2(40);
begin
   if sumOfSaleprice >= 20000 then
    gradeInfo := '우수'; 
   else
    gradeInfo := '보통';
   end if;
   return gradeinfo;
end;

select c.name 이름, grade(nvl(sum(saleprice),0)) 등급
  from customer c, orders o
  where c.custid = o.custid(+)
  group by c.custid, c.name;
  
-- (10-2 ~ 10-3)  
create or replace function domestic(
  custAddress customer.address%type
)return varchar2
as
  addressInfo varchar2(12);
begin
  if custAddress like '%대한민국%' then
    addressInfo := '국내거주';
  else 
    addressInfo := '국외거주';
  end if;  
  return addressInfo;
end;

select domestic(address), sum(o.saleprice)
  from customer c, orders o
  where c.custid = o.custid
  group by domestic(address);
  
  

