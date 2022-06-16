-- 4장 연습문제 (극장 데이터베이스)

-- (10-1) 극장이름과 고객이름을 저장하는 극장-고객 뷰를 생성하시오
create or replace view vw_theater_customer
as
select c.name, t.theater_name
  from theater t, customer c, reservation r
  where r.cust_no = c.cust_no
    and t.theater_no = r.theater_no;

-- (10-2) 대한극장에 예약을 한 고객의 수를 날짜별로 저장하는 대한-고객수 뷰를 생성하시오
create or replace view VW_RESERVATION_DATE_CNTCUST_ID_3 ("날짜","고객수")
as
select r.screening_date "date", count(*)
  from reservation r , theater t
  where t.theater_no = r.theater_no
    and t.theater_name like '대한'
  group by r.screening_date;
  

  
