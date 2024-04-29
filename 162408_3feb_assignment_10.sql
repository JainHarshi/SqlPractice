--Create a Table:
 -- Create a table named `Employee`
create table employee(
empid varchar2(30) primary key,
ename varchar2(30) not null,
empSalary number not null,
empDept varchar2(30) not null
);


------------------------------------------------------------
--// Assignment_010

--1. Create a Sequence:
--- Create a sequence named `emp_id_seq`
--with a starting value of 100 and an increment of 1.
create sequence emp_id_seq
minvalue 1
maxvalue 999999999999999
start with 100
increment by 1
cache 100;


--2. Add a Foreign Key:
--- Create a table named `Department` with columns: `DeptID` (Primary Key) and `DeptName`. Alter the
--`Employee` table to add a foreign key constraint on the `EmpDepartment` column referencing the `Department`
--table.
create table department(
deptid number primary key,
deptname varchar2(30)
);

alter table department modify deptid varchar(30);

alter table employee 
add constraint emp_fk foreign key(empDept) references department(deptid);


--3. Modify Data Type:
-- Modify the data type of the `EmpSalary` column 
--in the `Employee` table to NUMBER(10,2). 
alter table employee 
modify empSalary number(10,2);

--add column in a  employee table to update the name of column
alter table employee
add empAddress varchar2(100);


--4. Rename a Column:
-- Rename the column `EmpAddress`
--in the `Employee` table to `EmpLocation`
alter table employee rename column empAddress to empLocation;


--5. Create a Unique Constraint:
--Add a unique constraint named `uniq_name` on the 
--`EmpName` column
alter table employee 
add constraint uniq_name unique(eName);


