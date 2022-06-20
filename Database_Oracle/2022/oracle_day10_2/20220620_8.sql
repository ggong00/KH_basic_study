CREATE SEQUENCE emp_audit_tr
	INCREMENT BY 1
	START WITH 1
	MAXVALUE 999999
	MINVALUE 1
	NOCYCLE
	NOCACHE;
  
CREATE TABLE emp_audit(
	e_id	NUMBER(6)
		CONSTRAINT emp_audit_pk PRIMARY KEY,
	e_name	VARCHAR2(30),
	e_gubun	VARCHAR2(10),
	e_date	DATE);

CREATE OR REPLACE TRIGGER emp_audit_tr
	AFTER insert OR update OR delete ON emp
  for each row
BEGIN
	IF INSERTING THEN
		INSERT INTO emp_audit
		VALUES(emp_audit_tr.NEXTVAL,USER,'inserting',SYSDATE);
	ELSIF UPDATING THEN
		INSERT INTO emp_audit
		VALUES(emp_audit_tr.NEXTVAL,USER,'updating',SYSDATE);
	ELSIF DELETING THEN
		INSERT INTO emp_audit
		VALUES(emp_audit_tr.NEXTVAL,USER,'deleting',SYSDATE);
    
	END IF;
--    DBMS_OUTPUT.put_line('변경전 급여 : ' || :old.sal);
--    DBMS_OUTPUT.put_line('변경후 급여 : ' || :new.sal);

END;


drop trigger emp_audit_tr;

select * from emp;
select * from emp_audit;

insert into emp 
  values(8000,'GILDONG','CLERK',null,'20220101','5000',null,10);
  
update emp
  set sal = 6000
  where empno = 8000;
  
delete from emp where empno = 8000;  