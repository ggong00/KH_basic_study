--1. 이름이 ALLEN인 사원가 같은 엄무를 하는 사원의 사원번호, 이름, 업무, 급여 추출
select empno, ename, job, sal 
    from emp
    where job = (select job from emp where ename = 'ALLEN')
        and ename <> 'ALLEN';
        
--2. EMP 테이블의 사원번호가 7521인 사원과 업무가 같고 급여가 7934인 사원보다 많은 사원의 사원번호, 이름, 담당업무, 입사일, 급여 추출
select empno, ename, job, hiredate, sal 
    from emp
    where job = (select job from emp where empno = '7521')
        and sal > (select sal from emp where empno = '7934');

--3. EMP 테이블에서 급여의 평균보다 적은 사원의 사원번호, 이름, 업무, 급여, 부서번호 추출
select empno, ename, job, sal, deptno
    from emp
    where sal < (select avg(sal) from emp);

--4. 부서별 최소급여가 20번 부서의 최소급여보다 큰 부서의 부서번호, 최소 급여 추출
select deptno , min(sal)
    from emp
    group by deptno
    having min(sal) > (select min(sal) from emp where deptno = '20');

--5. 업무별 급여 평균 중 가장 작은 급여평균의 업무와 급여평균 추출
select job , avg(sal)
    from emp
    group by job
    having avg(sal) = (select min(avg(sal)) from emp group by job);

--6. 업무별 최대 급여를 받는 사원의 사원번호, 이름, 업무, 입사일, 급여, 부서번호 추출
select empno, ename, job, hiredate, sal, deptno
    from emp e
    where sal = (select max(sal) from emp e2 where e.job = e2.job);
    
--7. 30번 부서의 최소급여를 받는 사원보다 많은 급여를 받는 사원의 사원번호, 이름, 업무, 입사일, 급여, 부서번호, 단 30번 부서는 제외하고 추출
select empno, ename, job, hiredate, sal, deptno
    from emp
    where sal > (select min(sal) from emp where deptno = '30')
        and deptno <> '30';       

--8. 급여와 보너스가 30번 부서에 있는 사원의 급여와 보너스가 같은 사원을 30번 부서의 사원은 제외하고 추출
select *
    from emp
    where (sal, nvl(comm, 0)) in (select sal, nvl(comm, 0) from emp where deptno = '30')
        and deptno <> '30';

--9. BLAKE와 같은 부서에 있는 모든 사원의 이름과 입사일자를 추출
select ename, hiredate 
    from emp
    where deptno = (select deptno from emp where ename = 'BLAKE');

--10. 평균급여 이상을 받는 모든 사원에 대해 사원의 번호와 이름을 급여가 많은 순서로 추출
select empno, ename
    from emp
    where sal >= (select avg(sal) from emp)
    order by sal desc;

--11. 이름에 T가 있는 사원이 근무하는 부서에서 근무하는 모든 사원에 대해 사원번호,이름,급여를 출력, 사원번호 순서로 추출
select *
    from emp
    where deptno = ANY (select deptno from emp where ename like '%T%');

--12. 부서위치가 CHICAGO인 모든 사원에 대해 이름,업무,급여 추출
select * 
    from emp e, dept d
    where e.deptno = d.deptno
        and e.deptno = (select deptno from dept where loc = 'CHICAGO');

--13. KING에게 보고하는 모든 사원의 이름과 급여를 추출
select ename, sal
    from emp
    where mgr = (select empno from emp where ename = 'KING');
    
select e1.ename , e1.sal
    from emp e1, emp e2
    where e1.mgr = e2.empno
        and e2.ename = 'KING';

--14. FORD와 업무와 월급이 같은 사원의 모든 정보 추출
select *
    from emp
    where (job , sal) = (select job, sal from emp where ename = 'FORD');

--15. 업무가 JONES와 같거나 월급이 FORD 이상인 사원의 이름,업무,부서번호,급여 추출
select *
    from emp
    where job = (select job from emp where ename = 'JONES') 
        or sal >= (select sal from emp where ename = 'FORD');

--16. SCOTT 또는 WARD와 월급이 같은 사원의 이름,업무,급여를 추출
select *
    from emp
    where sal in (select sal from emp where ename in('SCOTT','WARD'));

--17. SALES에서 근무하는 사원과 같은 업무를 하는 사원의 이름,업무,급여,부서번호 추출
select *
    from emp
    where job in(select job from emp e, dept d where e.deptno = d.deptno
                and d.dname = 'SALES');
                             
--18. 자신의 업무별 평균 월급보다 낮은 사원의 부서번호, 이름, 급여, 자신의 부서 평균급여를 추출
select ename ,(select round(avg(sal), 0) from emp e2 where e1.deptno = e2.deptno) 부서평균
    from emp e1
    where sal < (select avg(sal) from emp e2 where e1.job = e2.job);

--19. 사원번호,사원명,부서명,소속부서 인원수,업무,소속 업무 급여평균,급여를 추출
select e.empno, e.ename, d.dname,
        (select count(*) from emp e2 where e.deptno = e2.deptno) 인원수,
        e.job, 
        (select round(avg(sal),0) from emp e2 where e.job = e2.job) 업무급여평균,
        e.sal
    from emp e, dept d
    where e.deptno = d.deptno;

--20. 사원번호,사원명,부서번호,업무,급여, 자신의 소속 업무 평균급여를 추출
select empno, ename, deptno, job, sal,
        (select avg(sal) from emp e2 where e.job = e2.job) 업무평균급여
    from emp e;

--21. 최소한 한 명의 부하직원이 있는 관리자의 사원번호,이름,입사일자,급여 추출
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

--22. 부하직원이 없는 사원의 사원번호, 이름, 업무, 부서번호 추출
select empno, ename, hiredate, sal
    from emp e
    where empno not in (select e.empno from emp e , emp e2 
                        where e.empno = e2.mgr)
    order by e.sal;

--23. BLAKE의 부하직원의 이름, 업무, 상사번호 추출
select ename, job, mgr
    from emp
    where ename in (select e2.ename from emp e, emp e2
                    where e.empno = e2.mgr 
                        and e.ename = 'BLAKE');
                        
select ename, job, mgr
    from emp
    where mgr=(select empno from emp
                where ename='BLAKE');                        

--24. BLAKE와 같은 상사를 가진 사원의 이름,업무, 상사번호 추출        
select *
    from emp
    where mgr in (select mgr from emp 
                    where ename = 'BLAKE');
        
select ename, job, mgr from emp
where mgr=(select mgr from emp
	    where ename='BLAKE');        
    