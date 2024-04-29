-------------------------------------------Assignment_004

select * from Product_Info1;

//1 
--Select all products with a price greater than $ 100
select price from Product_Info1 where price > 100;

//2
--Retrieve orders placed after 12024-02-02'
select * from order_Info;
select odate from order_Info 
where odate > to_date('2024-02-02', 'yyyy-mm-dd');


//3 
--List customers from INew York'
select * from customer_info;
select cid, cname from customer_info where cstate = 'New York';

//4
--Show products and their quantities where quantity is not null
select * from Order_Product;
select * from Product_Info1;
select pid , qty from Order_Product where qty is not null;

//5
--Retrieve orders placed by customers from 'California
select * from customer_info;
select cid, cname from customer_info where cstate = 'California';

//6
--Find products with a price less than or equal to $200 and in stock
select 
pid,
pdesc,
price 
from Product_Info1 
where price > 200;

select * from Order_Product;

//7
--Calculate the total quantity of products in all orders
select 
oid, count(qty) 
from Order_Product 
group by (oid);

//8
--Display distinct product descriptions
select 
DISTINCT pdesc 
from Product_Info1;

//9
--Find the average price of products
select pdesc, avg(price) 
from Product_Info1
group by pdesc;

//10
--Show products and their quantities, replacing null quantities with O
select 
pdesc, qty, NVL(qty, 0)
from product_Info1
join order_product
on product_info1.pid = order_product.pid;

//11
--Retrieve the first 5 products in the Product_lnfo table
select pdesc 
from Product_Info1
fetch next 5 rows only;


//12
--Display orders with quantities sorted in descending order:
select * from Order_Product;
select * from product_info1;

select 
pdesc , 
qty 
from    product_info1, Order_Product
where 
Order_Product.pid = product_info1.pid
order by (qty) desc ;


//13
--Retrieve products with descriptions containing IPhone'
select 
pid , pdesc 
from product_info1 
where pdesc = 'Phone';

//14
--Find customers in ICaliforniai or INew York'
select * from customer_info;
select cid, cname 
from 
customer_info 
where 
cstate = 'California' or cstate = 'New York';

//15
--Show products with prices between $ 100 and $500
select 
pid, 
pdesc, 
price 
from 
Product_Info1 
where price between 100 and 500;


//16
--List orders placed between '2024-02-02' and '2024-02-05
select * from orderInfo;
 select oid from orderInfo 
 where odate 
 between DATE'2024-02-02' and DATE'2024-02-05' ;



//17
--Retrieve orders with quantities not between 1 and 5
select oid , pdesc 
from Order_Product , product_Info1
where 
Order_Product.pid = product_Info1.pid
 and qty not between 1 and 5;

//18
--Display products with prices increased by 10%
select pid,
pdesc, price , price*0.1 +price as price_incresed_by_10_per
from product_Info1;



//19
--Find the average quantity of products in orders
select pdesc, avg(qty)
from product_info1 , order_product
where product_info1.pid = Order_product.pid
group by pdesc;


select * from order_info;

//20
--Show orders with dates one week ahead of 2024-02-01
select pdesc, odate
from  product_info1 inner join  order_product 
on  order_product.pid = product_info1.pid
inner join order_info on order_info.oid = order_product.oid
where odate >= to_date('2024-02-01' ,'yyyy-mm-dd')+7;




commit;

