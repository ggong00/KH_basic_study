-- 13�� ����
-- ��� ������Ʈ ����
drop table works;
drop table employee;
drop table project;
drop table department;

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
alter table employee add constraint employee_sex_ck check (sex in('����','����',null));
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
    
insert into department values(1,'IT','ȫ�浿');     
insert into department values(2,'COMEDIAN','�̼���');     
insert into department values(3,'ENTERTAMENT','�̽±�');     
insert into department values(4,'MARKETING','���缮');     
insert into department values(5,'SPORTS','��ȣ��');

insert into employee values(1,'ȫ1','011-8249-7750','�ѱ�','����','�Ǹſ�',4);
insert into employee values(2,'ȫ2','012-8249-7750','�ѱ�','����','������',1);
insert into employee values(3,'ȫ3','013-8249-7750','�ѱ�','����','�����̳�',3);
insert into employee values(4,'ȫ4','014-8249-7750','�ѱ�','����','�����ȹ',5);
insert into employee values(5,'ȫ5','015-8249-7750','�ѱ�','����','������',4);
insert into employee values(6,'ȫ5','015-8249-7750','�ѱ�','����','������',4);

insert into project values(3,'web',1);
insert into project values(2,'game',2);
insert into project values(4,'shop',3);
insert into project values(1,'business',4);

insert into works values(1,3,67);
insert into works values(1,2,21);
insert into works values(2,2,71);
insert into works values(3,3,102);
insert into works values(3,4,331);
insert into works values(4,4,12);
insert into works values(5,3,12);

commit;

select name  
    from employee;
    
select name
    from employee
    where sex = '����';
    
select manager
    from department;
    
select name, address
    from employee
    where deptno = (select deptno
                    from department
                    where deptname = 'IT');
                    
select count(empno)
    from employee
    where deptno = (select deptno 
                    from department
                    where manager = 'ȫ�浿');                  
  
select e.name, d.deptname,w."hours-worked"
    from department d ,works w, employee e
    where e.deptno = d.deptno
        and e.empno = w.empno
    order by d.deptname,e.name;
    
select p.projname,p.projno,count(projno)
    from project p, department d, employee e
    where e.deptno = d.deptno 
        and d.deptno = p.deptno
    group by p.projno,p.projname,p.projno
    having count(projno) >= 2;    
    
select name
    from employee 
    where deptno in(select e.deptno
                    from employee e, department d
                    where e.deptno = d.deptno
                    group by e.deptno
                    having count(e.deptno) >= 3);