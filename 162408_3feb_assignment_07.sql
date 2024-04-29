-------------------------------------------Assignment_007

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
