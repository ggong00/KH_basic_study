--����9) EMP ���̺� INSERT,UPDATE,DELETE������ �Ϸ翡 �� ����ROW�� �߻��Ǵ���
--�����Ϸ��� �Ѵ�. ���� ������ EMP_AUDIT_ROW�� ����� �̸�, �۾� ����,�۾� �ð�,
--�����ȣ,������ �޿�, ���ŵ� �޿��� �����ϴ� Ʈ���Ÿ� �ۼ��Ͽ���.

--������ ����
create sequence emp_audit_row_no_seq
  start with 1
  increment by 1
  minvalue 1
  maxvalue 99999999
  nocycle
  nocache;

--���̺� ����
desc emp;
drop table emp_audit_row;
create table emp_audit_row(
  no          number(10),
  uname       varchar2(20),           --����� �̸�
  event_type  varchar2(10),           --�۾�����
  udate       date default sysdate ,  --�۾��ð�
  empno       number(4),              --�����ȣ
  old_sal     number(7,2),            --�����޿�
  new_sal     number(7,2)             --���ŵ� �޿�
);

alter table emp_audit_row add constraint emp_audit_row_no_pk primary key(no);

--Ʈ���� ����
CREATE OR REPLACE TRIGGER EMP_ROW_TR 
AFTER DELETE OR INSERT OR UPDATE ON EMP 
FOR EACH ROW 
DECLARE
BEGIN
  IF INSERTING THEN
    INSERT INTO emp_audit_row (no,uname,event_type,empno,old_sal,new_sal)
      VALUES(EMP_AUDIT_ROW_NO_SEQ.nextval,user,'�ű�',:new.empno,:old.sal,:new.sal);
  ELSIF UPDATING THEN
    INSERT INTO emp_audit_row (no,uname,event_type,empno,old_sal,new_sal)
      VALUES(EMP_AUDIT_ROW_NO_SEQ.nextval,user,'����',:new.empno,:old.sal,:new.sal);
  ELSIF DELETING THEN
    INSERT INTO emp_audit_row (no,uname,event_type,empno,old_sal,new_sal)
      VALUES(EMP_AUDIT_ROW_NO_SEQ.nextval,user,'����',:old.empno,:old.sal,:new.sal);
  END IF;
END;

--�׽�Ʈ
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




