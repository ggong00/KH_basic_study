--2. EMP 테이블에서 급여가 3000이상인 사원의 정보를 사원번호,이름,담당업무,급여를 출력하는 SELECT 문장을 작성하시오.
select empno, ename, job, sal
  from emp 
  where sal >= 3000;

--3. EMP 테이블에서 사원번호가 7788인 사원의 이름과 부서번호를 출력하는 SELECT 문장을 작성하시오.
select ename, deptno
  from emp
  where empno = '7788';

--4. EMP 테이블에서 입사일이 February 20, 1981과 May 1, 19981 사이에 입사한 사원의 이름,업무,입사일을 출력하는 SELECT 문장을 작성하시오. 단 입사일 순으로 출력하시오.
select ename
  from emp
  where hiredate between 1981;
--5. EMP 테이블에서 부서번호가 10,20인 사원의 모든 정보를 출력하는 SELECT 문장을 작성하시오. 단 이름순으로 정렬하여라.
select *
  from emp 
  where deptno in(10,20);

--6. EMP 테이블에서 급여가 1500이상이고 부서번호가 10,30인 사원의 이름과 급여를 출력하는 SELECT 문장을 작성하여라. 단 HEADING을 Employee과 Monthly Salary로 출력하여라.
select ename, sal
  from emp 
  where sal >= 1500 and deptno in(10,30);

--7. EMP 테이블에서 1982년에 입사한 사원의 모든 정보를 출력하는 SELECT 문을 작성하여라.
select *
  from emp
  where hiredate >= '19820101' and hiredate <= '19821231';
  
select * 
  from emp
  where hiredate like '82%';
  
--8. EMP 테이블에서 COMM에 NULL이 아닌 사원의 모든 정보를 출력하는 SELECT 문을 작성하여라.
select *
  from emp
  where comm is null;

--9. EMP 테이블에서 보너스가 급여보다 10%가 많은 모든 종업원에 대하여 이름,급여,보너스를 출력하는 SELECT 문을 작성하여라.
select ename, sal, comm  
  from emp
  where comm * 1.1 >= sal;

--10. EMP 테이블에서 업무가 Clerk이거나 Analyst이고 급여가 1000,3000,5000이 아닌 모든 사원의 정보를 출력하는 SELECT 문을 작성하여라.
select *
  from emp
  where job in ('CLERK','ANALYST') and sal not in (1000,3000,5000);  

--11. EMP 테이블에서 이름에 L이 두 자가 있고  부서가 30이거나 또는 관리자가 7782인 사원의 모든 정보를 출력하는 SELECT 문을 작성하여라.
select * 
  from emp
  where ename like '%L%L%' and deptno = 30 or mgr = '7782';
  
