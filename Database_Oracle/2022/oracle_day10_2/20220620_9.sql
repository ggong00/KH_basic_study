-- Ʈ���� (�ð�,��¥ ����)
CREATE OR REPLACE TRIGGER book_resource
	BEFORE insert OR update OR delete ON book
declare
--  my_exception exception;
BEGIN
	IF TO_CHAR(SYSDATE,'DY') IN ('��')
		OR TO_NUMBER(TO_CHAR(SYSDATE,'HH24'))
			NOT BETWEEN 9 AND 18 THEN
      --�����ڵ� -20000~20999���� ���Ƿ� ���尡��
      --�����޼��� ������ ���Ƿ� ����
      RAISE_APPLICATION_ERROR(-20000, '�۾��� �� ���� �ð� �Դϴ�.');
      --����� �����Լ��� Ʈ���ſ��� ����ϸ� �޼��� �ԷºҰ�
--    raise my_exception;
	END IF;
--  exception
--    when others then 
--     dbms_output.put_line('errcode : ' || sqlcode);
--     dbms_output.put_line('errmsg : ' || sqlerrm);
END;


select TO_CHAR(SYSDATE,'HH24')
  from dual;

select * from book;  
insert into book values(23,'java','�Ѻ�',30000);  
rollback;