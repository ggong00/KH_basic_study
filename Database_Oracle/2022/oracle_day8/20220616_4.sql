-- 4�� �������� (���� �����ͺ��̽�)

-- (10-1) �����̸��� ���̸��� �����ϴ� ����-�� �並 �����Ͻÿ�
create or replace view vw_theater_customer
as
select c.name, t.theater_name
  from theater t, customer c, reservation r
  where r.cust_no = c.cust_no
    and t.theater_no = r.theater_no;

-- (10-2) ���ѱ��忡 ������ �� ���� ���� ��¥���� �����ϴ� ����-���� �並 �����Ͻÿ�
create or replace view VW_RESERVATION_DATE_CNTCUST_ID_3 ("��¥","����")
as
select r.screening_date "date", count(*)
  from reservation r , theater t
  where t.theater_no = r.theater_no
    and t.theater_name like '����'
  group by r.screening_date;
  

  
