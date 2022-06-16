drop table works;
drop table employee;
drop table project;
drop table department;

--�μ� ���̺�
create table department (
  deptno    number(2),
  deptname  varchar2(20),
  manager   number(4)
);
alter table department add constraint department_deptno_pk 
  primary key(deptno);
alter table department modify deptname constraint department_deptname_nn not null;

--��� ���̺�
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
alter table employee add constraint employee_sex_ck check(sex in('��','��'));

-- ������Ʈ ���̺�
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

--  ���� ���̺�
create table works (
  empno          number(4),
  projno         number(3),
  hoursworked    number(3)
);
alter table works add constraint works_empno_projno_pk 
  primary key(empno,projno);
alter table works add constraint works_projno_fk
  foreign key(projno) references project(projno);  
alter table works add constraint works_hoursworked_ck check(hoursworked > 0);

-- �μ� ������ �Է�
insert into department values (10,'������',1001);
insert into department values (20,'ȸ����',1004);
insert into department values (30,'������',1007);
insert into department values (40,'�ѹ���',1011);
insert into department values (50,'�λ���',1013);

select * from department;

-- ��� ������ �Է�
insert into employee values (1001,'ȫ�浿1','010-111-1001','���1','��','����',7000000,10);
insert into employee values (1002,'ȫ�浿2','010-111-1002','���2','��','����1',4000000,10);
insert into employee values (1003,'ȫ�浿3','010-111-1003','���3','��','����2',3000000,10);
insert into employee values (1004,'ȫ�浿4','010-111-1004','�λ�1','��','����',6000000,20);
insert into employee values (1005,'ȫ�浿5','010-111-1005','�λ�2','��','����1',3500000,20);
insert into employee values (1006,'ȫ�浿6','010-111-1006','�λ�3','��','����2',2500000,20);
insert into employee values (1007,'ȫ�浿7','010-111-1007','����1','��','����',5000000,30);
insert into employee values (1008,'ȫ�浿8','010-111-1008','����2','��','����1',4000000,30);
insert into employee values (1009,'ȫ�浿9','010-111-1009','����3','��','����2',3000000,30);
insert into employee (empno,name,address,sex,position,salary,deptno) 
  values (1010,'ȫ�浿10','����4','��','����3',2000000,30);  
insert into employee values (1011,'ȫ�浿11','010-111-1011','�뱸1','��','����',5500000,40);
insert into employee values (1012,'ȫ�浿12','010-111-1012','�뱸2','��','����1',2000000,40);
insert into employee values (1013,'ȫ�浿13','010-111-1013','����1','��','����',6500000,50);
insert into employee values (1014,'ȫ�浿14','010-111-1014','����2','��','����1',3500000,50);

select * from employee;
-- ������Ʈ ���̺� ������ �Է�
insert into project values (101,'�����ͱ���',10);
insert into project values (102,'IFRS',20);
insert into project values (103,'������',30);

select * from project;
--���� ���̺� ������ �Է�
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
  
  
-- 2
select * from employee;
select * from department;
select * from project;
select * from works;
-- 3
select name �̸�, phoneno ����ó, address �ּ�
  from employee
  where sex = '��';

-- 4
update employee e set salary = salary * 1.1
  where exists(select * 
        from department d
        where e.empno = d.manager);
        
select * from employee;        

-- 5
select substr(name,1,1) || '**' ��, count(*) �ο���
  from employee
  group by substr(name,1,1);
  
-- 6
select name �̸� ,nvl2(phoneno,substr(phoneno,1,8)||'**'||substr(phoneno,11,12),'����ó����') ����ó ,address �ּ�
  from employee
  where deptno = (select deptno
                  from department
                  where deptname = '������');
               
-- 7
select count(*) �����
  from employee
  where deptno =(
      select d.deptno
      from department d,employee e
      where e.deptno = d.deptno
        and d.manager = e.empno
        and e.name = 'ȫ�浿7');
                  
-- 8
select name �̸�
  from employee
  where empno not in(
      select e.empno
      from works w, employee e
      where w.empno = e.empno);

-- 9
select rownum ����,a.* 
  from(select *
    from employee
    order by salary desc) a
  where rownum <= 3;
  
-- 10
select d.deptname �μ��̸�, e.name �̸�, w.hoursworked �ٹ��ð�
  from department d, employee e, works w
  where e.deptno = d.deptno
    and w.empno = e.empno
  order by d.deptname, e.name;

-- 11
select p.projno "������Ʈ ��ȣ", p.projname "������Ʈ ��", p2.cnt "����� ��" 
  from project p , 
  (select projno, count(*) cnt
    from works
    group by projno
  having count(*) >= 2) p2
  where p.projno = p2.projno;
  
-- 12
select name
  from employee
  where deptno in(
    select deptno
      from employee
      group by deptno
      having count(*) >= 3);

-- 13
select e.name �����, e2.sum �ٹ��ð�
  from employee e, (select w.empno ,sum(w.hoursworked) sum
                   from employee e , works w
                   where w.empno = e.empno
                   group by w.empno
                    having sum(w.hoursworked) = (select max(hoursworked)
                                                 from works) 
                    or sum(w.hoursworked) = (select min(hoursworked)
                                             from works)) e2
  where e.empno = e2.empno
  order by e2.sum desc;

-- 14
create view vw_ename_pojname_hoursworked as
select e.name �����, p.projname ������Ʈ��, w.hoursworked �ٹ��ð�
  from employee e, project p, works w
  where e.empno = w.empno
    and w.projno = p.projno;    

select *
  from vw_ename_pojname_hoursworked;

-- 15
select e.name �����
  from employee e
  where exists(select *
                from works w, project p
                where w.projno = p.projno
                  and e.deptno = p.deptno
                  and p.projname = '�����ͱ���');

-- 16
create index ix_employee2 on employee(name,phoneno);

select *
  from user_ind_columns
  where table_name = 'EMPLOYEE';

-- 17
select e.name �̸�, e.salary ����
  from employee e
  where e.salary > (select avg(e2.salary)
                   from employee e2
                   where e.deptno = e2.deptno);
                   
-- 18
select e.name �����, e.salary �޿�, e.deptno �μ���ȣ
from employee e
  where e.empno in(select e2.empno
                   from (select *
                           from employee
                           order by salary desc) e2
                    where e.deptno = e2.deptno
                    and rownum <= 2);
                          
                          
