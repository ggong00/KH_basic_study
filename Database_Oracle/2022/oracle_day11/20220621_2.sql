--1. EMP TABLE에 이름,사번,급여,부서번호를 전달받아 등록하는 PROCEDURE를 작성하여라.
create or replace procedure exercise_1(
  p_empno  in emp.empno%type,
  p_ename  in emp.ename%type,
  p_sal    in emp.sal%type,
  p_deptno in emp.deptno%type
)
as

begin
  insert into emp (empno,ename,sal,deptno)
    values(p_empno,p_ename,p_sal,p_deptno);
  
  exception 
    when others then
      dbms_output.put_line('예외');
end;

exec exercise_1(8000,'gildong',5000,10);

select * from emp;

--2. 사원번호를 입력받아 급여를 수정하는 PROCEDURE를 작성하여라.
create or replace procedure exercise_2(
  p_emp in emp.empno%type,
  p_sal in emp.sal%type
) 
as
begin
  update emp
    set sal = p_sal
    where empno = p_emp;
  
  exception
    when others then
      dbms_output.put_line('기타 오류 : ' ||  SQLCODE || '_' || SQLERRM);
end;

execute exercise_2(8000,6000);

select * from emp;

--3. 최고의 월급을 받는 사원의 사번을 구하여 출력하는 PROCEDURE를 작성하여라. 
create or replace procedure exercise_3
as
  type emp_empno_table is table of emp.empno%type
    index by binary_integer;
  empno_table emp_empno_table;  
begin
--  for k in (select empno 
--            from emp
--            where sal in(select max(sal)     
--            from emp))
--  loop                
--    dbms_output.put_line('최고의 월급을 받는 사원번호 : ' || k.empno);
--  end loop;          
  select empno bulk collect into empno_table 
    from emp
    where sal in(select max(sal)     
    from emp);
    
    for idx in 1..empno_table.count loop
      dbms_output.put_line('최고의 월급을 받는 사원번호 : ' || empno_table(idx));
    end loop;

  exception
    when others then
      dbms_output.put_line('기타 오류 : ' ||  SQLCODE || '_' || SQLERRM);
end;

exec exercise_3;

--4. 이름을 입력받아 부서명을 구하여 출력하는 PROCEDURE를 작성하여라.
create or replace procedure exercise_4(
  p_ename in emp.ename%type
)
as
  lv_dname dept.dname%type;
begin
  select t2.dname into lv_dname
    from emp t1, dept t2
    where t1.deptno = t2.deptno
      and t1.ename = p_ename;
  dbms_output.put_line(p_ename || '님의 부서는' || lv_dname || '입니다');
  exception
    when others then
      dbms_output.put_line('기타 오류 : ' ||  SQLCODE || '_' || SQLERRM);
end;

exec exercise_4('gildong');

--5. 부서번호를 입력받아 그 부서의 최고 급여를 구하여 출력하는 FUNCTION을 작성하여라.
create or replace function exercise_5 (
  p_deptno  dept.deptno%type
)return emp.sal%type
as
  lv_maxsal emp.sal%type;
begin
  select max(sal) into lv_maxsal
    from emp
    where deptno = p_deptno;
    
  return lv_maxsal; 
  
  exception
    when others then
      dbms_output.put_line('예외발생' || sqlcode || ':' || sqlerrm );
end;

select exercise_5(deptno)
  from emp
  where empno = 8000;

var g_max_sal number;  
execute :g_max_sal := exercise_5(10);
print g_max_sal;

--5.부서번호를 입력받아 그 부서의 최고 급여를 구하여 출력하는 procedure를 작성하여라.
create or replace procedure exercise_5_prc(
  p_deptno  in   dept.deptno%type,
  r_sal     out  emp.sal%type
)
as
begin
  select max(sal) into r_sal
    from emp
    where deptno = p_deptno;
  
  exception when others then
    dbms_output.put_line('예외');
end;

exec exercise_5_prc(20,:g_max_sal);
print g_max_sal;

-- 8. EMP_SAL_TOT(부서번호,급여의 합) TABLE을 생성하여라.
CREATE TABLE emp_sal_tot as
  SELECT deptno,SUM(sal) sal_tot
  FROM emp
  GROUP BY deptno;

select * from emp_sal_tot;

-- 9. EMP_SAL_TOT TABLE의 내용은 EMP TABLE을 변경하면 EMP_SAL_TOT TABLE의 내용도 자동적으로 변경되어야 한다.
--    이를 반영한 TRIGGER를 작성하여라.
create or replace trigger emp_sal_tot_tr
after insert or update or delete on emp 
begin  
  delete emp_sal_tot;  
  insert into emp_sal_tot select deptno,sum(sal) sal_tot
                                 from emp 
                                  group by deptno;   
  exception when others then
    dbms_output.put_line('기타 오류 발생 : ' || sqlcode);                                 
end;

update emp set sal = 8000
  where empno = 8000;

insert into emp values(8003,'gil','MANAGER',null,'20220621',4000,null,20);
delete emp where ename = 'gil';   
  
select * from emp;
select * from emp_sal_tot;
rollback;


