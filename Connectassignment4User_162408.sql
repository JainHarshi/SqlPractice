select * from Product_Info1;

//1
select price from Product_Info1 where price > 100;

//2

//3
select * from customer_info;
select cid, cname from customer_info where cstate = 'New York';

//4
select * from Order_Product;
select * from Product_Info1;
select pid , qty from Order_Product where qty is not null;

//5
select * from customer_info;
select cid, cname from customer_info where cstate = 'California';

//6
select 
pid,
pdesc,
price 
from Product_Info1 
where price > 200;

//7
select count(qty) from Order_Product;

//8
select DISTINCT pdesc from Product_Info1;

//9
select avg(price) from Product_Info1;

//10
--select 

//11
select pdesc 
from Product_Info1
fetch next 5 rows only;

//12
--select * from Order_Product;
--select 
--pdesc.Product_Info1 , 
--qty 
--from Order_Product 
--where 
--pid.rder_Product= pid.Order_Product;


//13


//14
select * from customer_info;
select cid, cname 
from 
customer_info 
where 
cstate = 'California' or cstate = 'New York';

//15
select 
pid, 
pdesc, 
price 
from 
Product_Info1 
where price between 100 and 500;


//16



//17



//19
select avg(qty)  from Order_Product;

//20



commit;
