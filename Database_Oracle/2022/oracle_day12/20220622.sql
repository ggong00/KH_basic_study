select e.name �����, e.salary �޿�, e.deptno �μ���ȣ
from employee e
  where e.empno in(select e2.empno
                   from (select *
                           from employee
                           order by salary desc) e2
                    where e.deptno = e2.deptno
                    and rownum <= 2);

-- (sqlȰ�� 18�� ���� ��ŷ�Լ� ����)                    
select *
  from (                    
    select e1.deptno, e1.name, sum(salary),
            rank() over( partition by e1.deptno order by sum(salary) desc) r1
      from employee e1
      group by e1.deptno, e1.name
      order by e1.deptno)
      where r1 < 3;
                    