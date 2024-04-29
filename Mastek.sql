create table details(
sid int,
cid varchar2(10),
sname varchar2(10),
cname varchar2(10),
grade varchar2(5),
fname varchar2(15),
fphone int,
constraint composit primary key(sid , cid)
);

Select * from details; 

Insert into details(sid , cid, sname, cname , grade, fname , fphone)
values(1, 'is318' , 'a', 'a', 'a','a',12);

INSERT INTO details VALUES(2, 'is301' , 'a', 'a', 'a','a',12);

commit;

