-- 1~10������ �� -for��-
declare
  lv_sum number(4) := 0; -- default�� null
begin
  for i in 1..10 loop
    lv_sum := lv_sum + i;
  end loop;
  
  dbms_output.put_line('1~10������ �� = ' || lv_sum);
--  exception
end;

-- 1~10������ �� -while��-
declare
  lv_cnt number(2);
  lv_sum number(4) := 0; -- default�� null
begin
  lv_cnt := 1;
  while lv_cnt <= 10 loop
    lv_sum := lv_sum + lv_cnt;
    lv_cnt := lv_cnt + 1;
  end loop;
  
  dbms_output.put_line('1~10������ �� = ' || lv_sum);
--  exception
end;

-- ������ 2~9�ܱ���
begin
  for i in 2..9 loop
    DBMS_OUTPUT.PUT_LINE(i || '�� ���');
    for j in 1..9 loop
      DBMS_OUTPUT.PUT_LINE(i || '*' || j || '=' || i*j);
    end loop;
    DBMS_OUTPUT.PUT_LINE('--------------');
  end loop;
end;  