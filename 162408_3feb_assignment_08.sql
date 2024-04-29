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
select cid, 
avg(case grade when 'A' then 100
           when 'B' then 90
           when 'C' then 80
           else  0
        end ) as Avg_Grade
from grade group by cid;

//5
--List students and their grades for courses taught by a specific faculty (e.g., 'Dr. Anderson')

select grade,g.sid,
(select s.sname from student s where s.sid=g.sid)as Student_Name  
from grade g 
where cid in(select cid 
from course 
where fid in(select fid 
from faculty 
where faculty='Dr. Anderson'))

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
where course.cid = grade.cid
 and grade.sid = student.sid;

--8. List courses with the number of students and average grade
select
cid, count(sid),
avg(case grade when 'A' then 100
           when 'B' then 90
           when 'C' then 80
           else  0
        end ) as Avg_Grade
from grade 
group by cid;

--9. Retrieve students who scored 'A' in any course
select sname
from student, grade
where grade.sid = student.sid
and grade.grade = 'A';

--10. Display courses with more than 2 students 
--and average grade above 80
select
cid,
avg(case grade when 'A' then 80
           when 'B' then 70
           when 'C' then 60
           else  0
        end ) as Avg_Grade
from grade group by cid
having count(sid) > 2 
and avg(case grade when 'A' then 80
           when 'B' then 70
           when 'C' then 60
           else  0
        end ) > 80;