create table employees(
empId number(3),
empName varchar2(25),
dept varchar2(5)
);
desc employees;
select * from employees;
commit;
drop table employees;