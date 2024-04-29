select * from Product_Info1;

//1
select price from Product_Info1 where price > 100;

//2
select * from order_Info;
select odate from order_Info 
where odate > to_date('2024-02-02', 'yyyy-mm-dd');


//3
select * from customer_info;
select cid, cname from customer_info where cstate = 'New York';

//4
select * from Order_Product;
select * from Product_Info1;
select pid , qty from Order_Product where qty is not null;

//5
select * from customer_info;
select cid, cname from customer_info where cstate = 'California';

//6
select 
pid,
pdesc,
price 
from Product_Info1 
where price > 200;

//7



//Alteration of Table
-- ALTER TABLE Order_Product
-- rename COLUMN pid to oid1;
-- 
-- ALTER TABLE Order_Product
-- rename COLUMN oid1 to oid;
-- 
--  ALTER TABLE Order_Product
-- rename COLUMN oid to pid;
-- 
-- select * from Order_Product;
select * from Order_Product;

select oid, count(qty) from Order_Product group by (oid);

//8
select DISTINCT pdesc from Product_Info1;

//9
select avg(price) from Product_Info1;

//10
--select 

//11
select pdesc 
from Product_Info1
fetch next 5 rows only;



--''''''''''''''''''''''''''''''''''''''''''''''''''''''
//12

select * from Order_Product;
select * from product_info1;

select 
pdesc , 
qty 
from    product_info1, Order_Product
where 
Order_Product.pid = product_info1.pid
order by (qty) desc ;


//13
select 
pid , pdesc 
from product_info1 
where pdesc = 'Phone';

//14
select * from customer_info;
select cid, cname 
from 
customer_info 
where 
cstate = 'California' or cstate = 'New York';

//15
select 
pid, 
pdesc, 
price 
from 
Product_Info1 
where price between 100 and 500;


//16
select p



//17



//19
select avg(qty)  from Order_Product;

//20




commit;

-------------------------------------------Assignment_006
create table faculty(
fid number  primary key,
faculty varchar2(30) not null,
fphone varchar2(30) not null unique
);

create table student(
sid number  primary key,
sname varchar2(30) not null

);

create table course(
cid number  primary key,
c_name varchar2(30) not null,
fid number, 
FOREIGN KEY (fid) REFERENCES faculty(fid)
);

create table grade(
sid number REFERENCES student(sid)  ,
cid number REFERENCES course(cid) ,
grade varchar2(30) not null,
primary key(sid, cid)
--constraint fk foreign key (sid) references student(sid), 
);
 insert into student values(101, 'John Smith');
 insert into student values(102, 'Alice Johnson');
 insert into student values(103, 'Bob Miller');
 insert into student values(104, 'Emily Brown');
  insert into student values(105, 'Daniel Kim');
  insert into student values(106, 'Eva Martinez');
   insert into student values(107, 'Gary Wilson');
    insert into student values(108, 'Hannah Lee');
    insert into student values(109, 'Ian Turner');
insert into student values(110, 'Jessica Hall');

select * from student;

insert into faculty values(201, 'Dr. Anderson', '555-1234');
insert into faculty values(202, 'Prof. Davis', '555-5678');
insert into faculty values(203, 'Dr. White', '555-9876');
insert into faculty values(204, 'Prof. Harris', '555-4321');
insert into faculty values(205, 'Dr. Robinson', '555-8765');
insert into faculty values(206, 'Prof. Garcia', '555-2345');
insert into faculty values(207, 'Dr. Baker', '555-6789');
insert into faculty values(208, 'Prof. Murphy', '555-3456');
insert into faculty values(209, 'Dr. Carter', '555-7890');
insert into faculty values(210, 'Prof. Martin', '555-0123');

select * from course;
Select * from faculty;
drop table faculty;

insert into course values(301, 'Database Management', 201);
insert into course values(302, 'Programming Fundamentals', 202);
insert into course values(303, 'Data Structures', 203);
insert into course values(304, 'Web Development', 204);
insert into course values(305, 'Algorithms', 205);
insert into course values(306, 'Network Security', 206);
insert into course values(307, 'Artificial Intelligence', 207);
insert into course values(308, 'Software Engineering', 208);
insert into course values(309, 'Computer Graphics', 209);
insert into course values(310, 'Operating Systems', 210);

DELETE FROM faculty
WHERE fid = 301;

DELETE FROM faculty
WHERE fid = 302;

DELETE FROM faculty
WHERE fid = 303;

DELETE FROM faculty
WHERE fid = 304;

DELETE FROM faculty
WHERE fid = 305;

DELETE FROM faculty
WHERE fid = 306;

DELETE FROM faculty
WHERE fid = 307;

DELETE FROM faculty
WHERE fid = 308;

DELETE FROM faculty
WHERE fid = 309;

DELETE FROM faculty
WHERE fid = 310;


select * from faculty;
select * from grade;
select * from student;
select * from course;

insert into grade values(101, 301, 'A');
insert into grade values(102, 302, 'B');
insert into grade values(103, 303, 'C');
insert into grade values(104, 304, 'A');
insert into grade values(105, 305, 'B');
insert into grade values(106, 306, 'A');
insert into grade values(107, 307, 'C');
insert into grade values(108, 308, 'B');
insert into grade values(109, 309, 'A');
insert into grade values(110, 310, 'C');



////--------------------------- Assignment 8

//1
//Select all students and their grades
select 
sname , grade 
from student, grade 
where grade.sid = student.sid;

//2
--Select all students and their grades
select * from course;

select
c_name, faculty
from course, faculty
where course.fid = faculty.fid;

//3
--Display all grades for a specific course (e.g., 'Database Management')
select
grade, c_name
from grade, course
where grade.cid = course.cid;

//4
--Show the average grade for each course

--SELECT 
--    CID,
--    AVG(DECODE(Grade, 'A', 90, 'B', 80, 'C', 60)) AS "Average Grade"
--FROM 
--    Grade
--GROUP BY CID;

select cid, 
avg(case grade when 'A' then 100
           when 'B' then 90
           when 'C' then 80
           else  0
        end ) as Avg_Grade
from grade group by cid;

//5
--List students and their grades for courses taught by a specific faculty (e.g., 'Dr. Anderson')
/*select sname, 
grade, 
c_nmae, 
faculty 
from student, 
grade, 
course,
faculty
where student.sid = grade.sid,
grade.cid = course.cid,
course.fid = faculty.fid;*/

select grade,g.sid,(select s.sname from student s where s.sid=g.sid)as Student_Name  from grade g where cid in(select cid from course where fid in(select fid from faculty where faculty='Dr. Anderson'))

//6
--Display the highest grade in each course
select
max(grade) , c_name 
from grade, course
where grade.cid = course.cid;


//.7
--Show the number of students in each course
select sname,
c_name
from students,
course
group by(c_name)
where course.cid = grade.cid,
grade.sid = student.sid;

--8. List courses with the number of students and average grade


--9. Retrieve students who scored 'A' in any course


--10. Display courses with more than 2 students 
--and average grade above 80

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
ALTER TABLE employee  
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


------------------------------------------------------------
--// Assignment_010


--Create a Table:
 -- Create a table named `Employee`
create table employee(
empid varchar2(30) primary key,
ename varchar2(30) not null,
empSalary number not null,
empDept varchar2(30) not null
);



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


commit;