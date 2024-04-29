------------------------------------------------------------
--// Assignment_009


--1. Create a Table:
 -- Create a table named `Employee` with columns: `EmpID` (Primary Key), `EmpName`, `
-- EmpSalary`, and `EmpDepartment`.
create table employee(
empid varchar2(30) primary key,
ename varchar2(30) not null,
empSalary number not null,
empDept varchar2(30) not null
);


--2. Add a Column:
-- Alter the `Employee` table to add a new column 
--named `EmpAddress` of data type VARCHAR(100). 
alter TABLE employee  
  ADD EmpAddress VARCHAR(100); 
  
select * from employee;
  
--  3. Create an Index:
--- Create an index named `idx_salary` on the `EmpSalary` 
--column in the `Employee` table.
  create index idx_salary 
  on employee(empSalary);
 
--4. Define a Primary Key:
-- Define `EmpID` as the primary key for the `Employee` table.
alter table  employee
add empid varchar2(30) primary key ;


--5. Remove a Table:
--- Drop the `Employee` table if it exist
DROP TABLE employee;