--문제9) EMP 테이블에 INSERT,UPDATE,DELETE문장이 하루에 몇 건의ROW가 발생되는지
--조사하려고 한다. 조사 내용은 EMP_AUDIT_ROW에 사용자 이름, 작업 구분,작업 시간,
--사원번호,이전의 급여, 갱신된 급여을 저장하는 트리거를 작성하여라.

--시퀀스 생성
create sequence emp_audit_row_no_seq
  start with 1
  increment by 1
  minvalue 1
  maxvalue 99999999
  nocycle
  nocache;

--테이블 생성
desc emp;
drop table emp_audit_row;
create table emp_audit_row(
  no          number(10),
  uname       varchar2(20),           --사용자 이름
  event_type  varchar2(10),           --작업구분
  udate       date default sysdate ,  --작업시간
  empno       number(4),              --사원번호
  old_sal     number(7,2),            --이전급여
  new_sal     number(7,2)             --갱신된 급여
);

alter table emp_audit_row add constraint emp_audit_row_no_pk primary key(no);

--트리거 생성
CREATE OR REPLACE TRIGGER EMP_ROW_TR 
AFTER DELETE OR INSERT OR UPDATE ON EMP 
FOR EACH ROW 
DECLARE
BEGIN
  IF INSERTING THEN
    INSERT INTO emp_audit_row (no,uname,event_type,empno,old_sal,new_sal)
      VALUES(EMP_AUDIT_ROW_NO_SEQ.nextval,user,'신규',:new.empno,:old.sal,:new.sal);
  ELSIF UPDATING THEN
    INSERT INTO emp_audit_row (no,uname,event_type,empno,old_sal,new_sal)
      VALUES(EMP_AUDIT_ROW_NO_SEQ.nextval,user,'변경',:new.empno,:old.sal,:new.sal);
  ELSIF DELETING THEN
    INSERT INTO emp_audit_row (no,uname,event_type,empno,old_sal,new_sal)
      VALUES(EMP_AUDIT_ROW_NO_SEQ.nextval,user,'삭제',:old.empno,:old.sal,:new.sal);
  END IF;
END;

--테스트
select * from emp;

insert into emp values(8002,'gildong','MANAGER',null,'20220621',5000,null,10);

update emp
  set empno = 1111
  where empno = 8000;
  
delete emp where empno = 1111;

select * from emp_audit_row;

rollback;

select emp_audit_row_no_seq.currval
  from dual;




