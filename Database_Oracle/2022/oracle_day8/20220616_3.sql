--4장 [사원 데이터베이스]

-- (9-1) 팀장이 없는 직원의 이름을 보이시오
select ename
  from emp
  where mgr is null;
  
-- (9-2) 사원의 이름과 부서의 이름을 보이시오
-- (조인)
select e.ename, d.dname
  from emp e , dept d
  where e.deptno = d.deptno;
  
-- (스칼라 부속질의)
select e.ename 사원명,
      (select d.dname
        from dept d
        where e.deptno = d.deptno) 부서명
  from emp e;
  
-- (9-3) 'CHICAGO'에 근무하는 사원의 이름을 보이시오
-- (조인)
select e.ename
  from emp e, dept d
  where e.deptno = d.deptno
    and d.loc like '%CHICAGO%';
    
-- (인라인 뷰)
select ename
  from emp e,
      (select deptno
        from dept
        where loc like '%CHICAGO%') d
  where e.deptno = d.deptno;
  
-- (중첩질의)  
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
                  
-- (9-4) 평균보다 급여가 많은 직원의 이름을 보이시오
select ename
  from emp
  where sal > (select avg(sal)
              from emp);
              
-- (9-5) 자기 부서의 평균보다 급여가 많은 직원의 이름을 보이시오
select ename
  from emp e
  where sal > (select avg(sal)
                from emp e2
                where e.deptno = e2.deptno)