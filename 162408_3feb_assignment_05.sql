-------------------------------------------Assignment_005

//21
--List customers with names in uppercase
select 
cname , upper(cname) 
from customer_info;


//22
--Retrieve products with descriptions starting with 'Lapl
select
pid, pdesc, price
from product_info1
where pdesc like 'lap%';

//23
--Find customers with names ending in 'son'
select
cid , cname, cstate
from customer_Info
where cname like '%son';

//24
--Display orders placed on the last day of each month
select * from order_info;
select oid , odate
from  order_product , order_info
where order_product.oid = order_info.oid;



//25
--Show products with prices rounded to the 
--nearest integer
select
pid, pdesc, price, round(price) as round_off
from product_info1;


//26
--Retrieve customers with states replaced by their first two characters
select
cname, upper(replace(cstate, cstate , substr(cstate,1 ,2))) as states
from customer_info;

//27
--List orders with uantities multi lied b 2
select
pdesc, qty, qty*2
from order_product 
where product_info1.pid = order_product.pid;