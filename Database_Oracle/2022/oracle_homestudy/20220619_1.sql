-- 5�� ��������
set serveroutput on;
-- (9-4) ���� ������ �� �� �����ߴ����� �� ���ž��� ���̽ÿ�
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
  dbms_output.put_line('�̸� : ' || custName || ' ���� ���� �� : ' || countOrder);
  end loop;
  close c1;
end;

exec EX_9_4;

-- (9-5) �ֹ��� �ִ� ���� �̸��� �ֹ� �Ѿ��� ����ϰ� �ֹ��� ���� ���� �̸��� ����ϴ� ���νý��� �ۼ��Ͻÿ�
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
      dbms_output.put_line('�̸� : ' || custname);
    else
      dbms_output.put_line('�̸� : ' || custname || ' �ֹ� �Ѿ� : ' || sumsaleprice);
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
    gradeInfo := '���'; 
   else
    gradeInfo := '����';
   end if;
   return gradeinfo;
end;

select c.name �̸�, grade(nvl(sum(saleprice),0)) ���
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
  if custAddress like '%���ѹα�%' then
    addressInfo := '��������';
  else 
    addressInfo := '���ܰ���';
  end if;  
  return addressInfo;
end;

select domestic(address), sum(o.saleprice)
  from customer c, orders o
  where c.custid = o.custid
  group by domestic(address);
  
  

