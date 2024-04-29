create table customers(
cid number primary key,
cname varchar(25) not null,
cstate varchar2(25)); 

Insert into customers values(2, 'Apex', 'NC');
Insert into customers values(6, 'Acme', 'GA');


create table orderInfo(
oid number primary key,
odate date not null,
cid number,
foreign key(cid) references customers(cid)
); 

drop table orders;

Insert into orderInfo values(1006, to_date( '10/24/2009' , 'mm-dd-yyyy' ) , 2 );
Insert into orderInfo values(1007, to_date( '10/25/2009' , 'mm-dd-yyyy' ) , 6 );

select * from order;

create table ProductOrderInfo(
pid number ,
oid number,
qty number,
primary key(pid, oid) 
); 

insert into ProductOrderInfo values(7, 1006, 1);
insert into ProductOrderInfo values(5, 1006, 1);
insert into ProductOrderInfo values(4, 1006, 5);
insert into ProductOrderInfo values(11, 1007, 4);
insert into ProductOrderInfo values(4, 1007, 6);

create table ProductDesc(
pid number primary key ,
pdesc varchar2(30),
price number not null
); 

insert into ProductDesc values(7, 'table', 800);
insert into ProductDesc values(5, 'desk', 325);
insert into ProductDesc values(4, 'chair', 200);
insert into ProductDesc values(11, 'dresser', 500);


select * from customers;
select * from orderInfo;
select * from ProductDesc;
select * from ProductOrderInfo;

commit;

create table ProductDesc(
pid number primary key ,
pdesc varchar2(30),
price number not null
); 



