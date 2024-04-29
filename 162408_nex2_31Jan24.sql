-- 1 NF
create table employee(
    eid number primary key,
    ename varchar2(30),
    pid number(2),
    pname varchar2(30),
    btime number(2,1),
    did number(10),
    dname varchar2(30)
);

insert into employee (eid, ename, pid, pname, btime, did, dname) values(1, 'huey', 27, 'alpha', 4.5, 10, 'finance');

insert into employee (eid, ename, pid, pname, btime, did, dname) values(5, 'dewey', 25, 'beta', 3, 10, 'finance');
insert into employee (eid, ename, pid, pname, btime, did, dname) values(11, 'louie', 22, 'gamma', 7, 10, 'finance');
insert into employee (eid, ename, pid, pname, btime, did, dname) values(2, 'Jack', 26, 'Pail', 8, 14, 'R'||'&'||'D');
insert into employee (eid, ename, pid, pname, btime, did, dname) values(4, 'Jill', 21, 'Hill', 9, 14, 'R'||'&'||'D');

select * from employee;

-- 2NF

create table employee_table(
    eid number primary key,
    ename varchar2(30),
    did number(10),
    dname varchar2(30)
);

insert into employee_table
    (eid, ename, did, dname)
    select eid, ename, did, dname
    from employee;

select * from employee_table;

create table project_table(
    pid number primary key,
    pname varchar2(30)
);

insert into project_table(pid, pname)
    select pid, pname
    from employee;

select * from project_table;

create table budget_table(
    eid number,
    pid number,
    btime number(2,1),
    constraint pk primary key(eid, pid)
);

insert into budget_table (eid, pid, btime)
    select eid, pid, btime from employee;

select * from budget_table;


--3NF

create table dept_table(
    did number primary key,
    dname varchar(30)
);

insert into dept_table(did, dname)
    select distinct did, dname 
    from employee_table;

select * from dept_table;

create table Employee_3nf(
    eid number primary key,
    ename varchar2(30),
    did number,
    constraint fk Foreign key (did) references dept_table(did)
);

insert into Employee_3nf
    (eid, ename, did)
    select eid, ename, did 
    from employee_table;

select * from Employee_3nf;

commit;

