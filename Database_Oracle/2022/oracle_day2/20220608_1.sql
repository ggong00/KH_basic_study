--1. EMP ���̺��� �ο���,�ִ� �޿�,�ּ� �޿�,�޿��� ���� ����Ͽ� ����ϴ� SELECT ������ �ۼ��Ͽ���.
select * from emp;

select count(*), max(sal), min(sal), sum(sal) 
  from emp;
--2. EMP ���̺��� �� �������� �ִ� �޿�,�ּ� �޿�,�޿��� ���� ����ϴ� SELECT ������ �ۼ��Ͽ���.

select job ���� , max(sal), min(sal), sum(sal)
  from emp
  group by job; 
--3. EMP ���̺��� ������ �ο����� ���Ͽ� ����ϴ� SELECT ������ �ۼ��Ͽ���.

select job ����, count(*) �ο���
  from emp
  group by job;
--4. EMP ���̺��� �ְ� �޿��� �ּ� �޿��� ���̴� ���ΰ� ����ϴ� SELECT ������ �ۼ��Ͽ���.

select max(sal) - min(sal)
  from emp;
  
--5. EMP ���̺��� �μ����� �ο���,��� �޿�,�����޿�,�ְ� �޿�,�޿��� ���� ���Ͽ� ����Ͽ���.    
    
select deptno, count(*),avg(sal),max(sal), min(sal), sum(sal) 
  from emp
  group by deptno;
--6. �� �μ����� �ο���,�޿��� ���, ���� �޿�, �ְ� �޿�, �޿��� ���� ���Ͽ� �޿��� ���� ���� ������ ����Ͽ���.    
    
select deptno, count(*),avg(sal), max(sal), min(sal), sum(sal) 
  from emp
  group by deptno
  order by sum(sal) desc;
--7. �μ���, ������ �׷��Ͽ� ����� �μ���ȣ, ����, �ο���, �޿��� ���, �޿��� ���� ���Ͽ� ����Ͽ���.    
    
select deptno, job, count(*), avg(sal), sum(sal)
  from emp
  group by deptno, job;
 
--8. ������, �μ��� �׷��Ͽ� ����� �μ���ȣ, ����, �ο���, �޿��� ���, �޿��� ���� ���Ͽ� ����Ͽ���.

select job, deptno, count(*), avg(sal), sum(sal)
  from emp
  group by job, deptno;

--9. EMP ���̺��� �޿��� �ִ� 2900�̻��� �μ��� ���ؼ� �μ���ȣ, ��� �޿�, �޿��� ���� ���Ͽ� ����Ͽ���.

select deptno, avg(sal), sum(sal)
  from emp
  group by deptno
  having max(sal) >= 2900;
--10. EMP ���̺��� ������ �޿��� ����� 3000 �̻��� ������ ���ؼ� ������,��� �޿�, �޿��� ���� ���Ͽ� ����Ͽ���.

select job, avg(sal), sum(sal)
  from emp
  group by job
  having avg(sal) >= 3000; 

--11. EMP ���̺��� ��ü ������ 5000�� �ʰ��ϴ� �� ������ ���ؼ� ������ ���޿� �հ踦 ����Ͽ���. �� �Ǹſ��� �����ϰ� �� �޿� �հ�� ����(��������)�Ͽ���

select job, sum(sal)
  from emp
  where job != 'SALESMAN'
  group by job
  having sum(sal) > 5000
  order by sum(sal) desc; 
  
--12 emp ���̺��� �μ� �ο��� 4���� ���� �μ��� �μ���ȣ, �ο���. �޿��� ���� ���Ͽ� ���

select deptno, count(*), sum(sal)
  from emp
  group by deptno
  having count(*) > 4