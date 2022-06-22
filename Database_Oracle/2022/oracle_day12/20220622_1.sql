--����7) EMP ���̺��� ����� �� �ִ� �ð��� �����Ϻ��� �ݿ��ϱ��� 09�ú��� 18�ñ�����
--����� �� �ֵ��� �ϴ� Ʈ���Ÿ� �ۼ��Ͽ���.

create or replace trigger emp_trg 
before insert or delete or update on emp
for each row when (to_char(sysdate,'dy') in ('��','��') or 
                  to_number(to_char(sysdate,'hh24')) not between 9 and 18)

begin
  raise_application_error(-20001,'���̺� ������ �Ұ����մϴ�.');
end;

update emp set sal = 1000;

rollback;

