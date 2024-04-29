--Q1.Display employee name,id from employee table order by id
     SELECT EID,ENAME 
     FROM EMPLOYEE
     ORDER BY EID;
     
--Q2.Display Project name, Project id from Project table order by PID
     SELECT PID, Pname 
     FROM PROJECT 
     ORDER BY PID;
     
--Q3.Display Department id ,Department name from Department table order by DID
     SELECT DID,DNAME
     FROM department
     ORDER BY DID;
     
--Q4.Display BTIME,Eid,Pid from BUDGET table order by BTIME asc 
     SELECT BTIME,EID,PID
     FROM BUDGET
     ORDER BY BTIME ASC;
     
--Q5.Display EID, PID ,BTIME from BUDGET table order by btime,eid
     SELECT BTIME,EID,PID
     FROM BUDGET
     ORDER BY BTIME ASC,EID ASC;
     
--Q6.fetch the Eid, Pid,Btime from BUDGET table order by Btime asc,order by Eid desc;
     SELECT Btime,EID,PID
     FROM Budget
     ORDER BY Btime ASC,EID DESC;
     
--Q7.fetch top 3 Btime from Budget table;
     SELECT * 
     FROM Budget 
     ORDER BY Btime
     FETCH NEXT 3 ROWS ONLY;
     
--Q8.Display the name of employee having btime greater than 4.5.
     SELECT *
     FROM budget 
     WHERE btime>4.5;
     
--Q9.Display the name of employee with Employee ID 11 and department id 10.
     SELECT 
     EID,DID,Ename
     FROM 
     EMPLOYEE
     WHERE EID=11 AND DID=10;
     
--Q10.Display all information of employee having department id 10;
     SELECT EID 
     FROM  Budget
     WHERE Btime!=9;

--Q11.Display name of employee having employment id 2
     SELECT ename,eid
     FROM EMPLOYEE 
     WHERE EID=2;

--Q12.Display list of all projects having Project id in the range of 21 to 27;
     SELECT * 
     FROM PROJECT
     WHERE pid between 21 and 27;
     
--Q13.Display list of all employees name who got btime greater than or equals to 3;
     SELECT *
     FROM Budget
     WHERE Btime>=3 ;

--Q14. Display list of all employees name who got btime less than or equals to 10;
     SELECT *
     FROM Budget
     WHERE Btime<=10 ;
     
--Q15 Count the number of employees whose department ids are same
     SELECT 
     Did, COUNT(Ename)
     FROM EMPLOYEE 
     GROUP BY DID;
     
--Q16.Display the names of employee whose employee id is not 11 and 4
     SELECT EName 
     FROM EMPLOYEE 
     WHERE EID NOT IN(11,4);

--Q17.Display the names of employee with employee id 5 and 2
     SELECT EName 
     FROM EMPLOYEE 
     WHERE EID IN(5,2);

--Q18.Display the Projects whose names contain 'a' and have a project id  starting with '2'.
     SELECT 
     Pid , Pname 
     FROM PROJECT 
     WHERE  PName LIKE '%a%' AND PID LIKE '2%';
     
--Q.19.A. Display name of student starting with 'D';
     SELECT ENAME
     FROM EMPLOYEE
     WHERE name like 'D%';
     
--Q.19.B. Display name of employee whose name end with ey;
     SELECT ENAME 
     FROM EMPLOYEE 
     WHERE eNAME like'%ey';
     
--Q19.C. Display name of employee whose name contains ac
     SELECT ENAME
     FROM EMPLOYEE 
     WHERE ENAME like'%ac%';
     
--Q20. Display unique department from department table;
     SELECT DISTINCT DNAME 
     FROM DEPARTMENT;