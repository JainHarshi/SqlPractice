create table branch(
branchno number(3) constraint pk_branch_branchno PRIMARY key,
branchName varchar2(25) not null,
location varchar(25) not null
);
insert into branch (branchno,branchname,location) values (101,'Geneva','NEW YORK');
INSERT INTO BRANCH VALUES 	(102,'Geneva','NEW YORK');
INSERT INTO BRANCH VALUES 	(103,'CHICAGO','CHICAGO');
INSERT INTO BRANCH VALUES 	(104,'CHICAGO','CHICAGO');
INSERT INTO BRANCH VALUES 	(105,'Kingston','NEW YORK');
INSERT INTO BRANCH VALUES 	(106,'Kingston','NEW YORK');

create table dept(
deptNo number(2,0) constraint pk_dept_deptno primary key,
dname varchar2(50) not null,
branchno number(3,0) constraint fk_branch_branchno REFERENCES branch
);

INSERT INTO DEPT VALUES	(10,'ACCOUNTING',101);
INSERT INTO DEPT VALUES (20,'RESEARCH',103);
INSERT INTO DEPT VALUES	(30,'SALES',105);
INSERT INTO DEPT VALUES	(40,'OPERATIONS',106);



create table emp(   
  empno    number(4,0),   
  ename    varchar2(10),   
  job      varchar2(9),   
  mgr      number(4,0),   
  hiredate date,   
  sal      number(7,2),   
  comm     number(7,2),   
  deptno   number(2,0),     
  constraint pk_emp primary key (empno),   
  constraint fk_deptno foreign key (deptno) references dept (deptno)   
);
DESC EMP

alter table emp
ADD  BRANCHNO INT CONSTRAINT FK_EMP_BRANCHNO REFERENCES BRANCH;


INSERT INTO EMP VALUES(7369,'SMITH','CLERK',7902,to_date('17-12-1980','dd-mm-yyyy'),800,NULL,20,102);
INSERT INTO EMP VALUES(7499,'ALLEN','SALESMAN',7698,to_date('20-2-1981','dd-mm-yyyy'),1600,300,30,102);
INSERT INTO EMP VALUES(7521,'WARD','SALESMAN',7698,to_date('22-2-1981','dd-mm-yyyy'),1250,500,30,103);
INSERT INTO EMP VALUES(7566,'JONES','MANAGER',7839,to_date('2-4-1981','dd-mm-yyyy'),2975,NULL,20,104);
INSERT INTO EMP VALUES(7654,'MARTIN','SALESMAN',7698,to_date('28-9-1981','dd-mm-yyyy'),1250,1400,30,105);
INSERT INTO EMP VALUES(7698,'BLAKE','MANAGER',7839,to_date('1-5-1981','dd-mm-yyyy'),2850,NULL,30,105);
INSERT INTO EMP VALUES(7782,'CLARK','MANAGER',7839,to_date('9-6-1981','dd-mm-yyyy'),2450,NULL,10,102);
INSERT INTO EMP VALUES(7788,'SCOTT','ANALYST',7566,to_date('13-JUL-87')-85,3000,NULL,20,103);
INSERT INTO EMP VALUES(7839,'KING','PRESIDENT',NULL,to_date('17-11-1981','dd-mm-yyyy'),5000,NULL,NULL,101);
INSERT INTO EMP VALUES(7844,'TURNER','SALESMAN',7698,to_date('8-9-1981','dd-mm-yyyy'),1500,0,30,104);
INSERT INTO EMP VALUES(7876,'ADAMS','CLERK',7788,to_date('13-JUL-87')-51,1100,NULL,20,105);
INSERT INTO EMP VALUES(7900,'JAMES','CLERK',7698,to_date('3-12-1981','dd-mm-yyyy'),950,NULL,30,103);
INSERT INTO EMP VALUES(7902,'FORD','ANALYST',7566,to_date('3-12-1981','dd-mm-yyyy'),3000,NULL,20,105);
INSERT INTO EMP VALUES(7934,'MILLER','CLERK',7782,to_date('23-1-1982','dd-mm-yyyy'),1300,NULL,10,104);
INSERT INTO EMP VALUES(7901,'JOHN_SMITH','CLERK',7698,to_date('23-1-1982','dd-mm-yyyy'),3000,NULL,30,104);
commit;

select * from branch;
select * from dept;
select * from emp;


--Q1. Display employee name,job,sal,comm in asc order of job
select 
ename, 
job, 
sal, 
comm 
from emp 
order by job;

--Q2. Display employee name,job,sal,comm in asc order of sal
select 
ename, 
job, 
sal, 
comm 
from emp 
order by sal;

--Q3. Display employee name,job,sal,comm in asc order of comm
select 
ename, 
job, 
sal, 
comm 
from emp 
order by comm;

--Q4. Display employee name,job,sal,comm,deptno in asc order of deptno

select 
ename, 
job, 
sal, 
comm,
deptno
from emp 
order by deptno;

--Q5. Display employee name,job,sal,comm,deptno in asc order of deptno,job

select 
ename,
deptno,
job, 
sal, 
comm
from emp 
order by deptno, job;

--Q6. Display employee name,job,sal,comm,deptno in asc order of deptno,sal,comm

select 
ename,
deptno,
job, 
sal, 
comm
from emp 
order by deptno, sal, comm;

--Q7. Fetch 5 top employees earning highest
select 
ename,
deptno,
job, 
sal, 
comm
from emp 
order by sal desc
fetch next 5 row only;

--Q8. Fetch 2nd Highest salaried employee details

select 
ename,
deptno,
job, 
sal, 
comm
from emp 
order by sal desc
offset 1 row 
fetch next 1 row only;

--Q9. Display list of all employees working in department 20

select 
ename,
deptno,
job, 
sal, 
comm
from emp 
where deptno = 20;

--Q10. Display list of all employees working in department 30

select 
ename,
deptno,
job, 
sal, 
comm
from emp 
where deptno = 30;

--Q11. Display list of all employees working in department 10
select 
ename,
deptno,
job, 
sal, 
comm
from emp 
where deptno = 10;

--Q12. Display list of all employees working as ANALYST

select 
ename,
deptno,
job, 
sal, 
comm
from emp 
where job = 'ANALYST';

--Q13. Display list of all employees working as CLERK

select 
ename,
deptno,
job, 
sal, 
comm
from emp 
where job = 'CLERK';


--Q14. Display list of all employees working as SALESMAN

select 
ename,
deptno,
job, 
sal, 
comm
from emp 
where job = 'SALESMAN';

--Q15. Display list of all employees working as PRESIDENT

select 
ename,
deptno,
job, 
sal, 
comm
from emp 
where job = 'PRESIDENT';

--Q16. Display list of all employees EARNING SAL BETWEEN 500 TO 4000

select 
ename,
deptno,
job, 
sal, 
comm
from emp 
where sal between 500 and 4000 ;

--Q17. Display list of all employees EARNING SAL NOT BETWEEN 500 TO 4000

select 
ename,
deptno,
job, 
sal, 
comm
from emp 
where sal not between 500 and 4000 ;

--Q18.A. Display list of all employees EARNING SAL >500

select 
ename,
deptno,
job, 
sal, 
comm
from emp 
where sal>500 ;

--Q18.B. Display list of all employees EARNING SAL <500


select 
ename,
deptno,
job, 
sal, 
comm
from emp 
where sal < 500 ;

--Q18.C. Display list of all employees EARNING SAL <=500

select 
ename,
deptno,
job, 
sal, 
comm
from emp 
where sal <= 500 ;

--Q18.D. Display list of all employees EARNING SAL <=500


select 
ename,
deptno,
job, 
sal, 
comm
from emp 
where sal <= 500 ;

--Q18.E. Display list of all employees EARNING SAL !=800


select 
ename,
deptno,
job, 
sal, 
comm
from emp 
where sal != 800 ;

--Q18.F. Display list of all employees EARNING SAL =5000

select 
ename,
deptno,
job, 
sal, 
comm
from emp 
where sal = 5000 ;

--Q19. LOGICAL OPERATOR AND OR NOT/LIKE/IN/NOT IN/BETWEEN NOT BETWEEN
--Q19.A DISPLAY EMPLOYEE WORKING IN DEPARTMENT 10 AS CLERK

select 
ename,
deptno,
job, 
sal, 
comm
from emp 
where deptno = 10 and job = 'CLERK' ;

--Q19.B DISPLAY EMPLOYEE WORKING IN DEPARTMENT 20 AS MANAGER

select 
ename,
deptno,
job, 
sal, 
comm
from emp 
where deptno = 20 and job = 'MANAGER' ;


--Q19.C DISPLAY EMPLOYEE WORKING IN DEPARTMENT 30 AS SALESMAN

select 
ename,
deptno,
job, 
sal, 
comm
from emp 
where deptno = 30 and job = 'SALESMAN' ;


--Q19.D DISPLAY EMPLOYEE WHO ARE WORKING AS MANAGER BUT NOT IN DEPT 10

select 
ename,
deptno,
job, 
sal, 
comm
from emp 
where deptno != 10 and job = 'MANAGER' ;

--Q19.E DISPLAY EMPLOYEE WORKING AS CLERK,MANAGER

select 
ename,
deptno,
job, 
sal, 
comm
from emp 
where job = 'CLERK' or job = 'MANAGER' ;

--Q19.F DISPLAY EMPLOYEE WORKING IN DEPTNO 20,30

select 
ename,
deptno,
job, 
sal, 
comm
from emp 
where deptno = 20 or deptno = 30 ;

--Q19.G DISPLAY EMPLOYEE NOT WORKING IN DEPTNO 20,30

select 
ename,
deptno,
job, 
sal, 
comm
from emp 
where deptno != 20 and deptno != 30 ;


--Q19.H DISPLAY EMPLOYEE NOT WORKING AS CLERK,MANAGER

select 
ename,
deptno,
job, 
sal, 
comm
from emp 
where job != 'CLERK' and job != 'MANAGER' ;

--Q19.I DISPLAY EMPLOYEE WHO'S NAME STARTS WITH 'S'

select 
ename,
deptno,
job, 
sal, 
comm
from emp 
where ename like 'S%' ;

--Q19.J DISPLAY EMPLOYEE WHO'S NAME ENDSS WITH 'S'
 
 select 
ename,
deptno,
job, 
sal, 
comm
from emp 
where ename like '%S' ;
 

--Q19.K DISPLAY EMPLOYEE WHO'S NAME HAS  'LL'

 select 
ename,
deptno,
job, 
sal, 
comm
from emp 
where ename like '%LL%' ;

--Q19.L DISPLAY EMPLOYEE WHO'S NAME CONTAINS '_'

 select 
ename,
deptno,
job, 
sal, 
comm
from emp 
where ename like '%/_%' escape '/' ;

--Q20. DISPLAY UNIUE JOB FROM EMPLOYE TABLE

select 
DISTINCT job 
from emp;

commit;






