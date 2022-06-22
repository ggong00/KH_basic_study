-- (10-2) ���� �ּҸ� �̿��Ͽ� �������� ��ȯ�ϴ� �Լ�
create or replace function Domestic(
  p_address customer.address%type
)return varchar2
as
  lv_address varchar2(12);
begin
  if p_address is null then
    lv_address := '�˼�����';
  elsif p_address like '%���ѹα�%' then
    lv_address := '��������';
  else
    lv_address := '���ܰ���';
  end if;  
  
  return lv_address;
  
  exception when others then
    dbms_output.put_line('���ܹ߻�' || sqlerrm(sqlcode));
end;

-- case 2 (����ȣ�� ������ ��ȸ)
create or replace function exec10_2(
  p_custid    customer.custid%type
) return varchar2
is
  lv_domestic varchar2(12);
begin

  select decode(instr(t1.address,'���ѹα�'),0,'����','����')
    into lv_domestic
    from customer t1
   where t1.custid = p_custid;
   
  return lv_domestic;
  
  exception
    when others then
      dbms_output.put_line('��Ÿ���� : ' || SQLERRM(SQLCODE));
end;

select  t1.domestic "���ֱ���", sum(t2.saleprice) "���Ǹž�"
    from (select  custid, exec10_2(custid) domestic
            from customer ) t1,
          orders t2
   where  t1.custid = t2.custid        
group by  t1.domestic;


--case 3 �����̵� Ȱ���Ͽ� ������ ��ȯ
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
  
  if lv_address like '%���ѹα�%' then
    lr_domestic := '����';
  else
    lr_domestic := '����';
  end if;
   
  return lr_domestic;
  exception
    when others then
      dbms_output.put_line('��Ÿ���� : ' || SQLERRM(SQLCODE));
end;

  select  t1.domestic "���ֱ���", sum(t2.saleprice) "���Ǹž�"
    from (select  custid, exec10_2_2(custid) domestic
            from customer ) t1,
          orders t2
   where  t1.custid = t2.custid        
group by  t1.domestic;


---------------------
set serveroutput on;

var tmp varchar2(12);
exec :tmp := domestic('���ѹα�');
print tmp;

select name, domestic(address)
  from customer;
  
select decode(instr(t1.address,'���ѹα�'),0,'����','����') ���ֱ���
  from customer t1
  where t1.custid = 3;
  
select c.name,  case   when instr(c.address,'���ѹα�') = 0 then '���ܰ���'
                       when instr(c.address,'���ѹα�') > 0 then '��������'
                       else '�˼�����' 
                        end as "������"
  from customer c;
  
select c.name,  case instr(c.address,'���ѹα�')  when 0 then '���ܰ���'
                                                 else '��������' 
                 end as "������"
  from customer c;  

-- (10-3) domestic �Լ��� ����Ͽ� ���������� �ֹ��հ踦 ��Ÿ���� SQL��
select domestic(c.address) ������, sum(o.saleprice) �ֹ��հ�
  from customer c, orders o
  where c.custid = o.custid
  group by domestic(c.address);
  
  