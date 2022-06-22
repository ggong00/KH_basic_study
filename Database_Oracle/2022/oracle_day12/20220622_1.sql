--문제7) EMP 테이블을 사용할 수 있는 시간은 월요일부터 금요일까지 09시부터 18시까지만
--사용할 수 있도록 하는 트리거를 작성하여라.

create or replace trigger emp_trg 
before insert or delete or update on emp
for each row when (to_char(sysdate,'dy') in ('토','일') or 
                  to_number(to_char(sysdate,'hh24')) not between 9 and 18)

begin
  raise_application_error(-20001,'테이블 수정이 불가능합니다.');
end;

update emp set sal = 1000;

rollback;

