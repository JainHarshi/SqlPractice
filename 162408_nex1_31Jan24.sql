--2NF
create table student (
    sid number generated always as identity primary key,
    s_name varchar2(30)
);

select * from student;

insert 
into student ( s_name) 
values ( 'Adams');

insert 
into student (s_name) 
values ( 'jones');

insert 
into student ( s_name) 
values ( 'smith');

insert 
into student ( s_name) 
values ( 'baker');

create table course (
    cid varchar2(5) primary key,
    c_name varchar2(20),
    f_name varchar2(30),
    f_phone varchar2(15)
);

select * from course;

insert 
into course (cid, c_name, f_name, f_phone) 
values ('IS318', 'Databse', 'Houser', '+1911021547');

insert 
into course (cid, c_name, f_name, f_phone) 
values ('IS301', 'EC', 'Langley', '4578922037');

create table grade (
    sid number,
    constraint sid_constraint foreign key (sid) references student(sid) on delete cascade,
    cid varchar2(5),
    constraint cid_constraint foreign key (cid) references course(cid) on delete set null,
    primary key (sid, cid),
    grade_result char(1)
);

select * 
from grade;

insert 
into grade (sid, cid, grade_result) 
values(1, 'IS318', 'A');

insert 
into grade (sid, cid, grade_result) 
values(1, 'IS301', 'B');

insert 
into grade (sid, cid, grade_result) 
values(2, 'IS318', 'A');

insert 
into grade (sid, cid, grade_result) 
values(3, 'IS318', 'A');

insert 
into grade (sid, cid, grade_result)
values(4, 'IS301', 'A');

insert 
into grade (sid, cid, grade_result)
values(4, 'IS318', 'A');

describe grade;


--3NF

create table faculty (
    fid number generated always as identity primary key,
    f_name varchar2(30),
    f_phone varchar2(15)
);

select * 
from 
faculty;

insert 
into faculty (f_name, f_phone) 
select 
f_name, f_phone 
from course;

create table course_details (
    cid varchar(2) primary key,
    c_name varchar2(20),
    fid number,
    constraint fid_constraint foreign key (fid) references faculty(fid) on delete set null
);

alter table course_details 
modify cid varchar2(5);

select * 
from course_details;

insert 
into course_details (cid, c_name) 
select cid, c_name 
from course;

update course_details 
set fid = 1 
where cid = 'IS318';

update course_details 
set fid = 2 
where cid = 'IS301';


------------------------------------------------------------
-- dropping the parent table course and 
--modifyig the grade table forign key references (constraints)

insert 
into course_details (cid, c_name) 
values ('IS777', 'Java');

insert 
into faculty (f_name, f_phone) 
values ('XYZ', '+919110121513');

update course_details 
set fid = 4 where cid='IS777';


delete from faculty where fid = 3;

delete from course_details where cid='IS777';

alter table grade drop constraint cid_constraint;
ALTER TABLE grade ADD CONSTRAINT cid_constraint FOREIGN KEY (cid) REFERENCES course_details(cid) on delete cascade;
drop table course;

commit;