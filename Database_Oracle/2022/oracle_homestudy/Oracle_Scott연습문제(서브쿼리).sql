--1. �̸��� ALLEN�� ����� ���� ������ �ϴ� ����� �����ȣ, �̸�, ����, �޿� ����
select empno, ename, job, sal 
    from emp
    where job = (select job from emp where ename = 'ALLEN')
        and ename <> 'ALLEN';
        
--2. EMP ���̺��� �����ȣ�� 7521�� ����� ������ ���� �޿��� 7934�� ������� ���� ����� �����ȣ, �̸�, ������, �Ի���, �޿� ����
select empno, ename, job, hiredate, sal 
    from emp
    where job = (select job from emp where empno = '7521')
        and sal > (select sal from emp where empno = '7934');

--3. EMP ���̺��� �޿��� ��պ��� ���� ����� �����ȣ, �̸�, ����, �޿�, �μ���ȣ ����
select empno, ename, job, sal, deptno
    from emp
    where sal < (select avg(sal) from emp);

--4. �μ��� �ּұ޿��� 20�� �μ��� �ּұ޿����� ū �μ��� �μ���ȣ, �ּ� �޿� ����
select deptno , min(sal)
    from emp
    group by deptno
    having min(sal) > (select min(sal) from emp where deptno = '20');

--5. ������ �޿� ��� �� ���� ���� �޿������ ������ �޿���� ����
select job , avg(sal)
    from emp
    group by job
    having avg(sal) = (select min(avg(sal)) from emp group by job);

--6. ������ �ִ� �޿��� �޴� ����� �����ȣ, �̸�, ����, �Ի���, �޿�, �μ���ȣ ����
select empno, ename, job, hiredate, sal, deptno
    from emp e
    where sal = (select max(sal) from emp e2 where e.job = e2.job);
    
--7. 30�� �μ��� �ּұ޿��� �޴� ������� ���� �޿��� �޴� ����� �����ȣ, �̸�, ����, �Ի���, �޿�, �μ���ȣ, �� 30�� �μ��� �����ϰ� ����
select empno, ename, job, hiredate, sal, deptno
    from emp
    where sal > (select min(sal) from emp where deptno = '30')
        and deptno <> '30';       

--8. �޿��� ���ʽ��� 30�� �μ��� �ִ� ����� �޿��� ���ʽ��� ���� ����� 30�� �μ��� ����� �����ϰ� ����
select *
    from emp
    where (sal, nvl(comm, 0)) in (select sal, nvl(comm, 0) from emp where deptno = '30')
        and deptno <> '30';

--9. BLAKE�� ���� �μ��� �ִ� ��� ����� �̸��� �Ի����ڸ� ����
select ename, hiredate 
    from emp
    where deptno = (select deptno from emp where ename = 'BLAKE');

--10. ��ձ޿� �̻��� �޴� ��� ����� ���� ����� ��ȣ�� �̸��� �޿��� ���� ������ ����
select empno, ename
    from emp
    where sal >= (select avg(sal) from emp)
    order by sal desc;

--11. �̸��� T�� �ִ� ����� �ٹ��ϴ� �μ����� �ٹ��ϴ� ��� ����� ���� �����ȣ,�̸�,�޿��� ���, �����ȣ ������ ����
select *
    from emp
    where deptno = ANY (select deptno from emp where ename like '%T%');

--12. �μ���ġ�� CHICAGO�� ��� ����� ���� �̸�,����,�޿� ����
select * 
    from emp e, dept d
    where e.deptno = d.deptno
        and e.deptno = (select deptno from dept where loc = 'CHICAGO');

--13. KING���� �����ϴ� ��� ����� �̸��� �޿��� ����
select ename, sal
    from emp
    where mgr = (select empno from emp where ename = 'KING');
    
select e1.ename , e1.sal
    from emp e1, emp e2
    where e1.mgr = e2.empno
        and e2.ename = 'KING';

--14. FORD�� ������ ������ ���� ����� ��� ���� ����
select *
    from emp
    where (job , sal) = (select job, sal from emp where ename = 'FORD');

--15. ������ JONES�� ���ų� ������ FORD �̻��� ����� �̸�,����,�μ���ȣ,�޿� ����
select *
    from emp
    where job = (select job from emp where ename = 'JONES') 
        or sal >= (select sal from emp where ename = 'FORD');

--16. SCOTT �Ǵ� WARD�� ������ ���� ����� �̸�,����,�޿��� ����
select *
    from emp
    where sal in (select sal from emp where ename in('SCOTT','WARD'));

--17. SALES���� �ٹ��ϴ� ����� ���� ������ �ϴ� ����� �̸�,����,�޿�,�μ���ȣ ����
select *
    from emp
    where job in(select job from emp e, dept d where e.deptno = d.deptno
                and d.dname = 'SALES');
                             
--18. �ڽ��� ������ ��� ���޺��� ���� ����� �μ���ȣ, �̸�, �޿�, �ڽ��� �μ� ��ձ޿��� ����
select ename ,(select round(avg(sal), 0) from emp e2 where e1.deptno = e2.deptno) �μ����
    from emp e1
    where sal < (select avg(sal) from emp e2 where e1.job = e2.job);

--19. �����ȣ,�����,�μ���,�ҼӺμ� �ο���,����,�Ҽ� ���� �޿����,�޿��� ����
select e.empno, e.ename, d.dname,
        (select count(*) from emp e2 where e.deptno = e2.deptno) �ο���,
        e.job, 
        (select round(avg(sal),0) from emp e2 where e.job = e2.job) �����޿����,
        e.sal
    from emp e, dept d
    where e.deptno = d.deptno;

--20. �����ȣ,�����,�μ���ȣ,����,�޿�, �ڽ��� �Ҽ� ���� ��ձ޿��� ����
select empno, ename, deptno, job, sal,
        (select avg(sal) from emp e2 where e.job = e2.job) ������ձ޿�
    from emp e;

--21. �ּ��� �� ���� ���������� �ִ� �������� �����ȣ,�̸�,�Ի�����,�޿� ����
select empno, ename, hiredate, sal
    from emp e
    where exists(select 1 from emp t 
                  where t.mgr=e.empno)
    order by e.sal;
             
select empno, ename, hiredate, sal
    from emp e
    where empno in (select e.empno from emp e , emp e2 
                    where e.empno = e2.mgr)
    order by e.sal;

--22. ���������� ���� ����� �����ȣ, �̸�, ����, �μ���ȣ ����
select empno, ename, hiredate, sal
    from emp e
    where empno not in (select e.empno from emp e , emp e2 
                        where e.empno = e2.mgr)
    order by e.sal;

--23. BLAKE�� ���������� �̸�, ����, ����ȣ ����
select ename, job, mgr
    from emp
    where ename in (select e2.ename from emp e, emp e2
                    where e.empno = e2.mgr 
                        and e.ename = 'BLAKE');
                        
select ename, job, mgr
    from emp
    where mgr=(select empno from emp
                where ename='BLAKE');                        

--24. BLAKE�� ���� ��縦 ���� ����� �̸�,����, ����ȣ ����        
select *
    from emp
    where mgr in (select mgr from emp 
                    where ename = 'BLAKE');
        
select ename, job, mgr from emp
where mgr=(select mgr from emp
	    where ename='BLAKE');        
    