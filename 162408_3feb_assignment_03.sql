create table Product_Info1(
pid number primary key ,
pdesc varchar2(30),
price number(10, 2) not null
);

insert into Product_Info1 values(101, 'laptop', 1200);
insert into Product_Info1 values(102, 'Smartphone', 700);
insert into Product_Info1 values(103, 'Headphones', 50);
insert into Product_Info1 values(104, 'Tablet', 300);
insert into Product_Info1 values(105, 'Printer', 200);

select * from Product_Info1;



//Customer_Info
create table Customer_Info(
cid number primary key,
cname varchar(25) not null,
cstate varchar2(25)
); 

Insert into Customer_Info values(201, 'John_Smith', 'California');
Insert into Customer_Info values(202, 'Alice Johnson', 'New York');
Insert into Customer_Info values(203, 'Bob Miller', 'Texas');
Insert into Customer_Info values(204, 'Emily Brown', 'Florida');
Insert into Customer_Info values(205, 'Daniel Kim', 'Illinois');

Select * from Customer_Info;

create table order_Info(
oid number primary key,
odate date not null,
cid number,
foreign key(cid) references Customer_Info(cid)
); 

Insert into order_Info values(301, to_date( '2024/02/01' , 'yyyy-mm-dd' ) , 201);
Insert into order_Info values(302, to_date( '2024/02/02' , 'yyyy-mm-dd' ) , 202 );
Insert into order_Info values(303, to_date( '2024/02/03' , 'yyyy-mm-dd' ) , 203 );
Insert into order_Info values(304, to_date( '2024/02/04' , 'yyyy-mm-dd' ) , 204 );
Insert into order_Info values(305, to_date( '2024/02/05' , 'yyyy-mm-dd' ) , 205 );

select * from order_Info;

create table Order_Product(
pid number ,
oid number,
qty number,
primary key(pid, oid) 
); 

Insert into Order_Product values(301, 101, 2);
Insert into Order_Product values(301, 103, 1);
Insert into Order_Product values(302, 102, 3);
Insert into Order_Product values(303, 105, 1);
Insert into Order_Product values(304, 104, 2);
Insert into Order_Product values(305, 101, 1);
Insert into Order_Product values(305, 103, 2);

select * from Order_Product;

DELETE FROM Customer_Info WHERE cid = 302;




