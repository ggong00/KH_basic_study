-- 1~10까지의 합 -for문-
declare
  lv_sum number(4) := 0; -- default값 null
begin
  for i in 1..10 loop
    lv_sum := lv_sum + i;
  end loop;
  
  dbms_output.put_line('1~10까지의 합 = ' || lv_sum);
--  exception
end;

-- 1~10까지의 합 -while문-
declare
  lv_cnt number(2);
  lv_sum number(4) := 0; -- default값 null
begin
  lv_cnt := 1;
  while lv_cnt <= 10 loop
    lv_sum := lv_sum + lv_cnt;
    lv_cnt := lv_cnt + 1;
  end loop;
  
  dbms_output.put_line('1~10까지의 합 = ' || lv_sum);
--  exception
end;

-- 구구단 2~9단까지
begin
  for i in 2..9 loop
    DBMS_OUTPUT.PUT_LINE(i || '단 출력');
    for j in 1..9 loop
      DBMS_OUTPUT.PUT_LINE(i || '*' || j || '=' || i*j);
    end loop;
    DBMS_OUTPUT.PUT_LINE('--------------');
  end loop;
end;  