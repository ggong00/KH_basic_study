create table department (
    deptno      number,
    deptname    varchar2(20),
    manager     varchar2(20)
);
alter table department add constraint department_deptno_pk primary key (deptno);
alter table department modify deptname constraint department_deptname_nn not null;

create table employee (
    empno       number,
    name        varchar2(10),
    phoneno     varchar2(13),
    address     varchar2(40),
    sex         char(6),
    position    varchar(20),
    deptno      number
);
alter table employee add constraint employee_empno_pk primary key (empno);
alter table employee add constraint employee_sex_ck check (sex in('남자','여자',null));
alter table employee add constraint employee_deptno_fk foreign key (deptno)
    references department(deptno);
    
create table project (
    projno      number,
    projname    varchar2(20),
    deptno      number
);
alter table project add constraint project_projno_pk primary key (projno);
alter table project modify projname constraint project_projname_nn not null;
alter table project add constraint project_deptno_fk foreign key (deptno)
    references department(deptno);

create table works (
    empno               number,
    projno              number,
    "hours-worked"      varchar2(20)
);
alter table works add constraint works_empno_projno_pk primary key (empno,projno);
alter table works add constraint works_projno_fk foreign key (projno)
    references project(projno);
    
-- (2)
select name
  from employee;

-- (3)
select name 
  from employee
  where sex = '여자';

-- (4)
select manager
  from department;

-- (5)
select name, address
  from employee 
  where deptno = (select deptno
                 from department
                 where deptname = 'IT');
                 
-- (6)
select count(*)
  from employee
  where deptno = (select deptno
                  from department
                  where manager = '홍길동');

-- (7)
select e.deptno 부서번호, 
      (select name
       from employee e2
       where e.empno = e2.empno) 사원명,
       sum(w."hours-worked") 근무시간
  from works w , employee e
  where w.empno = e.empno
  group by e.deptno, e.empno
  order by e.deptno, 사원명;
  
-- (8)
select t1.projno, t1.projname, cnt
  from( select w.projno, count(*) cnt
        from project p , works w
        where w.projno = p.projno
        group by w.projno
        having count(*)>= 2) t2,
        project t1
  where t1.projno = t2.projno;        
        
-- (9)
select name
  from employee
  where deptno in ( select deptno
                    from employee
                    group by deptno
                    having count(*) >=3);
  