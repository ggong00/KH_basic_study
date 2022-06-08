--1. EMP 테이블에서 인원수,최대 급여,최소 급여,급여의 합을 계산하여 출력하는 SELECT 문장을 작성하여라.
select * from emp;

select count(*), max(sal), min(sal), sum(sal) 
  from emp;
  
--2. EMP 테이블에서 각 업무별로 최대 급여,최소 급여,급여의 합을 출력하는 SELECT 문장을 작성하여라.
select job 업무 , max(sal), min(sal), sum(sal)
  from emp
  group by job; 
  
--3. EMP 테이블에서 업무별 인원수를 구하여 출력하는 SELECT 문장을 작성하여라.
select job 업무, count(*) 인원수
  from emp
  group by job;
  
--4. EMP 테이블에서 최고 급여와 최소 급여의 차이는 얼마인가 출력하는 SELECT 문장을 작성하여라.
select max(sal) - min(sal)
  from emp;
  
--5. EMP 테이블에서 부서별로 인원수,평균 급여,최저급여,최고 급여,급여의 합을 구하여 출력하여라.    
select deptno, count(*),avg(sal),max(sal), min(sal), sum(sal) 
  from emp
  group by deptno;
  
--6. 각 부서별로 인원수,급여의 평균, 최저 급여, 최고 급여, 급여의 합을 구하여 급여의 합이 많은 순으로 출력하여라.    
select deptno, count(*),avg(sal), max(sal), min(sal), sum(sal) 
  from emp
  group by deptno
  order by sum(sal) desc;
  
--7. 부서별, 업무별 그룹하여 결과를 부서번호, 업무, 인원수, 급여의 평균, 급여의 합을 구하여 출력하여라.     
select deptno, job, count(*), avg(sal), sum(sal)
  from emp
  group by deptno, job;
 
--8. 업무별, 부서별 그룹하여 결과를 부서번호, 업무, 인원수, 급여의 평균, 급여의 합을 구하여 출력하여라.
select job, deptno, count(*), avg(sal), sum(sal)
  from emp
  group by job, deptno;

--9. EMP 테이블에서 급여가 최대 2900이상인 부서에 대해서 부서번호, 평균 급여, 급여의 합을 구하여 출력하여라.
select deptno, avg(sal), sum(sal)
  from emp
  group by deptno
  having max(sal) >= 2900;
  
--10. EMP 테이블에서 업무별 급여의 평균이 3000 이상인 업무에 대해서 업무명,평균 급여, 급여의 합을 구하여 출력하여라.
select job, avg(sal), sum(sal)
  from emp
  group by job
  having avg(sal) >= 3000; 

--11. EMP 테이블에서 전체 월급이 5000을 초과하는 각 업무에 대해서 업무와 월급여 합계를 출력하여라. 단 판매원은 제외하고 월 급여 합계로 정렬(내림차순)하여라
select job, sum(sal)
  from emp
  where job != 'SALESMAN'
  group by job
  having sum(sal) > 5000
  order by sum(sal) desc; 
  
--12 emp 테이블에서 부서 인원이 4명보다 많은 부서의 부서번호, 인원수. 급여의 합을 구하여 출력
select deptno, count(*), sum(sal)
  from emp
  group by deptno
  having count(*) > 4
