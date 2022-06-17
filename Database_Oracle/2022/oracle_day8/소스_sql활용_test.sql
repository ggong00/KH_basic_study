drop table works;
alter table department drop constraint department_manager_fk;
drop table employee;
drop table project;
drop table department;



--부서 테이블
create table department (
  deptno    number(2),
  deptname  varchar2(20),
  manager   number(4)
);
alter table department add constraint department_deptno_pk 
  primary key(deptno);
alter table department modify deptname constraint department_deptname_nn not null;

--사원 테이블
create table employee (
  empno     number(4),
  name      varchar2(20),
  phoneno   varchar2(20),
  address   varchar2(20),
  sex       char(3),
  position  varchar2(20),
  salary    number(7),
  deptno    number(2)
);
alter table employee add constraint employee_empno_pk 
  primary key(empno);
alter table employee add constraint employee_deptno_fk
  foreign key(deptno) references department(deptno);
alter table employee modify name constraint employee_name_nn not null;  
alter table employee add constraint employee_sex_ck check(sex in('남','여'));

alter table department add constraint department_manager_fk
  foreign key(manager) references employee(empno);
-- 프로젝트 테이블
create table project (
  projno    number(3),
  projname  varchar2(20),
  deptno    number(2)
);
alter table project add constraint project_projno_pk 
  primary key(projno);
alter table project add constraint project_deptno_fk
  foreign key(deptno) references department(deptno);  
alter table project modify projname constraint project_projname_nn not null;  

--  업무 테이블
create table works (
  empno          number(4),
  projno         number(3),
  hoursworked    number(3)
);
alter table works add constraint works_empno_projno_pk 
  primary key(empno,projno);
alter table works add constraint works_projno_fk
  foreign key(projno) references project(projno);
alter table works add constraint works_empno_fk
  foreign key(empno) references employee(empno);    
alter table works add constraint works_hoursworked_ck check(hoursworked > 0);

-- 부서 데이터 입력
insert into department(deptno,deptname) values (10,'전산팀');
insert into department(deptno,deptname) values (20,'회계팀');
insert into department(deptno,deptname) values (30,'영업팀');
insert into department(deptno,deptname) values (40,'총무팀');
insert into department(deptno,deptname) values (50,'인사팀');

select * from department;
 
-- 사원 데이터 입력
insert into employee values (1001,'홍길동1','010-111-1001','울산1','남','팀장',7000000,10);
insert into employee values (1002,'홍길동2','010-111-1002','울산2','남','팀원1',4000000,10);
insert into employee values (1003,'홍길동3','010-111-1003','울산3','남','팀원2',3000000,10);
insert into employee values (1004,'홍길동4','010-111-1004','부산1','여','팀장',6000000,20);
insert into employee values (1005,'홍길동5','010-111-1005','부산2','남','팀원1',3500000,20);
insert into employee values (1006,'홍길동6','010-111-1006','부산3','남','팀원2',2500000,20);
insert into employee values (1007,'홍길동7','010-111-1007','서울1','남','팀장',5000000,30);
insert into employee values (1008,'홍길동8','010-111-1008','서울2','남','팀원1',4000000,30);
insert into employee values (1009,'홍길동9','010-111-1009','서울3','남','팀원2',3000000,30);
insert into employee (empno,name,address,sex,position,salary,deptno) 
  values (1010,'홍길동10','서울4','남','팀원3',2000000,30);  
insert into employee values (1011,'홍길동11','010-111-1011','대구1','여','팀장',5500000,40);
insert into employee values (1012,'홍길동12','010-111-1012','대구2','남','팀원1',2000000,40);
insert into employee values (1013,'홍길동13','010-111-1013','제주1','남','팀장',6500000,50);
insert into employee values (1014,'홍길동14','010-111-1014','제주2','남','팀원1',3500000,50);

select * from employee;

-- 부서 테이블에 팀장 입력
update department d set manager = (select e.empno from employee e
                                  where d.deptno = e.deptno
                                    and e.position = '팀장');

-- 프로젝트 테이블 데이터 입력
insert into project values (101,'빅데이터구축',10);
insert into project values (102,'IFRS',20);
insert into project values (103,'마케팅',30);

select * from project;
--업무 테이블 데이터 입력
insert into works values (1001,101,800);
insert into works values (1002,101,400);
insert into works values (1003,101,300);
insert into works values (1004,102,700);
insert into works values (1005,102,500);
insert into works values (1006,102,200);
insert into works values (1007,103,500);
insert into works values (1008,103,400);
insert into works values (1009,103,300);
insert into works values (1010,103,200);

select * from works;

-- 1
desc employee;
desc department;
desc project;
desc works

select constraint_name, constraint_type
  from user_constraints
  where table_name = 'EMPLOYEE';
  
select constraint_name, constraint_type
  from user_constraints
  where table_name = 'DEPARTMENT';
  
select constraint_name, constraint_type
  from user_constraints
  where table_name = 'PROJECT';
  
select constraint_name, constraint_type
  from user_constraints
  where table_name = 'WORKS';  
  
-- 2
select * from employee;
select * from department;
select * from project;
select * from works;
-- 3
select name 이름, phoneno 연락처, address 주소
  from employee
  where sex = '여';

-- 4
update employee e set salary = salary * 1.1
  where exists(select * 
        from department d
        where e.empno = d.manager);
        
select * from employee;        

-- 5
select substr(name,1,1) || '**' 성, count(*) 인원수
  from employee
  group by substr(name,1,1);
  
-- 6
select name 이름 ,nvl2(phoneno,substr(phoneno,1,8)||'**'||substr(phoneno,11,12),'연락처없음') 연락처 ,address 주소
  from employee
  where deptno = (select deptno
                  from department
                  where deptname = '영업팀');
                  
select name"이름", nvl2(phoneno, concat(substr(phoneno,0,8),replace (substr(phoneno, 9, 4), '10', '**' )) ,
                        '연락처 없음')"연락처", address"주소" 
     from employee t1, department t2
    where t1.deptno = t2.deptno
      and t2.deptname = '영업팀';                  
               
-- 7
select count(*) 사원수
  from employee
  where deptno =(
      select d.deptno
      from department d,employee e
      where e.deptno = d.deptno
        and d.manager = e.empno
        and e.name = '홍길동7');
                  
-- 8
select name 이름
  from employee
  where empno not in(
      select e.empno
      from works w, employee e
      where w.empno = e.empno);

-- 9
select rownum 순위,a.* 
  from(select *
    from employee
    order by salary desc) a
  where rownum <= 3;
  
-- 10
select d.deptname 부서이름, e.name 이름, w.hoursworked 근무시간
  from department d, employee e, works w
  where e.deptno = d.deptno
    and w.empno = e.empno
  order by d.deptname, e.name;

-- 11
select p.projno "프로젝트 번호", p.projname "프로젝트 명", p2.cnt "사원의 수" 
  from project p , 
  (select projno, count(*) cnt
    from works
    group by projno
  having count(*) >= 2) p2
  where p.projno = p2.projno;
  
-- 12
select name 이름
  from employee
  where deptno in(
    select deptno
      from employee
      group by deptno
      having count(*) >= 3);

-- 13
select e.name 사원명, e2.sum 근무시간
  from employee e, (select w.empno ,sum(w.hoursworked) sum
                   from works w
                   group by w.empno
                    having sum(w.hoursworked) in (select max(sum(hoursworked))
                                                 from works
                                                 group by empno) 
                    or sum(w.hoursworked) in (select min(sum(hoursworked))
                                             from works
                                             group by empno)) e2
  where e.empno = e2.empno
  order by e2.sum desc;

-- 14
drop view vw_ename_pojname_hoursworked;

create view vw_ename_pojname_hoursworked as
select e.name 사원명, p.projname 프로젝트명, w.hoursworked 근무시간
  from employee e, project p, works w
  where e.empno = w.empno
    and w.projno = p.projno;    

select *
  from vw_ename_pojname_hoursworked;

-- 15
select e.name 사원명
  from employee e
  where exists(select *
                from works w, project p
                where w.projno = p.projno
                  and e.deptno = p.deptno
                  and p.projname = '빅데이터구축');

-- 16
drop index ix_employee2;
create index ix_employee2 on employee(name,phoneno);

select *
  from user_ind_columns
  where table_name = 'EMPLOYEE';

-- 17
select e.deptno 부서명,e.name 이름, e.salary 월급
  from employee e
  where e.salary > (select avg(e2.salary)
                   from employee e2
                   where e.deptno = e2.deptno);
                   
-- 18
select e.name 사원명, e.salary 급여, e.deptno 부서번호
from employee e
  where e.empno in(select e2.empno
                   from (select *
                           from employee
                           order by salary desc) e2
                    where e.deptno = e2.deptno
                    and rownum <= 2);
                          
                          
