--4�� [��� �����ͺ��̽�]

-- (9-1) ������ ���� ������ �̸��� ���̽ÿ�
select ename
  from emp
  where mgr is null;
  
-- (9-2) ����� �̸��� �μ��� �̸��� ���̽ÿ�
-- (����)
select e.ename, d.dname
  from emp e , dept d
  where e.deptno = d.deptno;
  
-- (��Į�� �μ�����)
select e.ename �����,
      (select d.dname
        from dept d
        where e.deptno = d.deptno) �μ���
  from emp e;
  
-- (9-3) 'CHICAGO'�� �ٹ��ϴ� ����� �̸��� ���̽ÿ�
-- (����)
select e.ename
  from emp e, dept d
  where e.deptno = d.deptno
    and d.loc like '%CHICAGO%';
    
-- (�ζ��� ��)
select ename
  from emp e,
      (select deptno
        from dept
        where loc like '%CHICAGO%') d
  where e.deptno = d.deptno;
  
-- (��ø����)  
select ename
  from emp e
  where e.deptno in (select deptno
                      from dept
                      where loc like '%CHICAGO%');
         
-- (EXISTS)		 
select ename
  from emp e
  where exists (select 1
                from dept d
                where e.deptno = d.deptno
                  and d.loc like '%CHICAGO%');
                  
-- (9-4) ��պ��� �޿��� ���� ������ �̸��� ���̽ÿ�
select ename
  from emp
  where sal > (select avg(sal)
              from emp);
              
-- (9-5) �ڱ� �μ��� ��պ��� �޿��� ���� ������ �̸��� ���̽ÿ�
select ename
  from emp e
  where sal > (select avg(sal)
                from emp e2
                where e.deptno = e2.deptno)