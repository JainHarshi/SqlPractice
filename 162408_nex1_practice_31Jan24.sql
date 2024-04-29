

---Q1. Display SID,CID,Grade in Grades table in asc order of CID;
select sid,cid,grade from grades
order by cid asc;

--Q2. Display Grade,SID,CID, in Grades table in asc order of Grade;
select grade,sid,cid from grades
order by grade asc;

--Q3. Display fname,Fphone,fid from faculty table in desc order of fname
select fname,fphone,fid from faculty
order by fname desc;

--Q4. Display fname,Fphone,fid from faculty table in ASC order of fname
select fname,fphone,fid from faculty 
order by fname asc;

--Q5. Display fname,Fphone,fid from faculty table arrange fname in asc order and fphone in desc order
select fname,fphone,fid from faculty 
order by fname asc,fphone desc;

--Q6 Display SID,S_Name From Student table arrange in asc order SID,S_name
select sid,s_name from students
order by s_name asc;
select sid,s_name from students
order by sid asc;

--Q7. Retrieve the grades of all students in the courseiD 'IS318'.
select sid,grade from grades 
where cid='IS318';

--Q8.Find the grade of student with SID 1 in the courseid 'IS301'.
select cid,sid,grade from grades 
where cid='IS301' and sid='1';

--Q9 Retrieve the names of students whose names start with 'A'.
select s_name from students 
where s_name like 'A%';

--Q10 Find faculties whose names contain the letter 's'.
select fname from faculty 
where fname like '%s%';

--Q11. Retrieve the grades of students whose grades are between 'B' and 'A'.
select grade from grades 
where grade between 'B' and 'A';

--Q12. Find faculties whose phone numbers are between '40000' and '60000'.
select fname from faculty 
where fphone between '40000' and '6000';

--Q13 Retrieve the names of students whose names contain the letter 'a'.
select s_name from students
where s_name like '%a%';


--Q14 Find the faculties whose names end with 'er'.
select fname from faculty
where fname like '%er';

--Q15. Display the courses ordered by their IDs in descending order.
select cname,cid from course
order by cid desc;

--Q16. Count the number of students in each grade.
select grade,count(sid) from grades group by grade;


--Q17. Find the faculty with the highest phone number.
select max(fphone) from faculty;

--Q18.Retrieve the first 3 students.
select * from students 
fetch next 3 rows only;

--Q19. Retrieve the names of students ordered alphabetically by their names.
SELECT S_name FROM Students 
ORDER BY S_name ASC;

--Q20 Retrieve the grades of students whose grades are between 'A' and 'B'.
select grade from grades 
where grade between 'A' and 'B';

commit;

