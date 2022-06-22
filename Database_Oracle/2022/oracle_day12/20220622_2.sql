-- (10-2) 고객의 주소를 이용하여 거주지를 반환하는 함수
create or replace function Domestic(
  p_address customer.address%type
)return varchar2
as
  lv_address varchar2(12);
begin
  if p_address is null then
    lv_address := '알수없음';
  elsif p_address like '%대한민국%' then
    lv_address := '국내거주';
  else
    lv_address := '국외거주';
  end if;  
  
  return lv_address;
  
  exception when others then
    dbms_output.put_line('예외발생' || sqlerrm(sqlcode));
end;

-- case 2 (고객번호로 거주지 조회)
create or replace function exec10_2(
  p_custid    customer.custid%type
) return varchar2
is
  lv_domestic varchar2(12);
begin

  select decode(instr(t1.address,'대한민국'),0,'국외','국내')
    into lv_domestic
    from customer t1
   where t1.custid = p_custid;
   
  return lv_domestic;
  
  exception
    when others then
      dbms_output.put_line('기타오류 : ' || SQLERRM(SQLCODE));
end;

select  t1.domestic "거주국가", sum(t2.saleprice) "총판매액"
    from (select  custid, exec10_2(custid) domestic
            from customer ) t1,
          orders t2
   where  t1.custid = t2.custid        
group by  t1.domestic;


--case 3 고객아이디를 활용하여 거주지 반환
create or replace function exec10_2_2(
  p_custid    customer.custid%type
) return varchar2
is
  lr_domestic varchar2(12);
  lv_address  customer.address%type;

begin

  select address into lv_address
    from customer
   where custid = p_custid; 
  
  if lv_address like '%대한민국%' then
    lr_domestic := '국내';
  else
    lr_domestic := '국외';
  end if;
   
  return lr_domestic;
  exception
    when others then
      dbms_output.put_line('기타오류 : ' || SQLERRM(SQLCODE));
end;

  select  t1.domestic "거주국가", sum(t2.saleprice) "총판매액"
    from (select  custid, exec10_2_2(custid) domestic
            from customer ) t1,
          orders t2
   where  t1.custid = t2.custid        
group by  t1.domestic;


---------------------
set serveroutput on;

var tmp varchar2(12);
exec :tmp := domestic('대한민국');
print tmp;

select name, domestic(address)
  from customer;
  
select decode(instr(t1.address,'대한민국'),0,'국외','국내') 거주국가
  from customer t1
  where t1.custid = 3;
  
select c.name,  case   when instr(c.address,'대한민국') = 0 then '국외거주'
                       when instr(c.address,'대한민국') > 0 then '국내거주'
                       else '알수없음' 
                        end as "거주지"
  from customer c;
  
select c.name,  case instr(c.address,'대한민국')  when 0 then '국외거주'
                                                 else '국내거주' 
                 end as "거주지"
  from customer c;  

-- (10-3) domestic 함수를 사용하여 거주지별로 주문합계를 나타내는 SQL문
select domestic(c.address) 거주지, sum(o.saleprice) 주문합계
  from customer c, orders o
  where c.custid = o.custid
  group by domestic(c.address);
  
  