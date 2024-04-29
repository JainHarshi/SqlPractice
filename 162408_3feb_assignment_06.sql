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

