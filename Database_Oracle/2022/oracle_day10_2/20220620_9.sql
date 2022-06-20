-- 트리거 (시간,날짜 제한)
CREATE OR REPLACE TRIGGER book_resource
	BEFORE insert OR update OR delete ON book
declare
--  my_exception exception;
BEGIN
	IF TO_CHAR(SYSDATE,'DY') IN ('월')
		OR TO_NUMBER(TO_CHAR(SYSDATE,'HH24'))
			NOT BETWEEN 9 AND 18 THEN
      --에러코드 -20000~20999까지 임의로 저장가능
      --에러메세지 개발자 임의로 지정
      RAISE_APPLICATION_ERROR(-20000, '작업할 수 없는 시간 입니다.');
      --사용자 정의함수는 트리거에서 사용하면 메세지 입력불가
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
insert into book values(23,'java','한빛',30000);  
rollback;