--Oracle Union all

--List all customers from the USA and Canada
select 
    * 
from 
    customers 
where 
    country='USA'
union all
select 
    * 
from 
    customers 
where 
    country='Canada';

--List all employees from USA and UK

select 
    *
from 
    employees 
where 
    country='USA'
union all
select
    *
from 
    employees 
where 
    country='UK';
    
--List all products from the 'Beverages' category and 'Confections category'

select * from products  
where categoryid=(select categoryid from categories where categoryname='Beverages')
union all
select * from products
where categoryid=(select categoryid from categories where categoryname='Confections');


select 
    p.productname, c.categoryname 
from 
    products p 
inner join 
    categories c 
on 
    p.categoryid= c.categoryid 
where categoryname='Beverages'
union all
select 
    p.productname, c.categoryname 
from 
    products p 
inner join 
    categories c 
on 
    p.categoryid= c.categoryid 
where 
    categoryname='Confections';
    
--List all orders shipped by 'Speedy Express' and 'United Package'

select 
    o.orderid,s.companyname
from 
    shippers s 
inner join 
    orders o
on 
    o.shipvia =s.shipperid 
where 
    companyname='Speedy Express' 
union all
select 
    o.orderid, s.companyname
from 
    shippers s 
inner join 
    orders o 
on 
    o.shipvia= s.shipperid 
where 
    companyname='United Package';

--List all customers and suppliers company name

select companyname from customers
union all
select companyname from suppliers;



--Oracle Intersect

--List all customers from USa and Canada
select * from customers  where country='USA'
intersect 
select * from customers where country='Canada';

--List all employees from USA and UK
select EmployeeID,FirstName from employees where country='USA'
intersect
select EmployeeID,FirstName from employees where country='UK';


--List all products from 'Beverages category and 'Confections' category

select * from products where categoryid=(select categoryid from categories where  categoryname='Beverages')
intersect
select * from products where categoryid=(select categoryid from categories where categoryname ='Confections');


--List all orders shipped by 'Speedy Express' and 'United Package'

select o.orderid, s.companyname 
from  orders o inner join shippers s on o.shipvia = s.shipperid where  companyname='Speedy Express'
intersect
select o.orderid, s.companyname 
from orders o inner join shippers s on o.shipvia=s.shipperid where companyname='United Package';


--Listall customers and suppliers company name
select companyname  from customers
intersect
select companyname from suppliers;


=======================================================================================


--Minus

--List customers not from the USA
select * from customers minus
select * from customers where country='USA';

--List employees not from the UK


select employeeid,firstname,lastname , country from employees
minus
select employeeid,firstname, lastname, country from employees where country='UK';


--List products not in the 'Beverages' category

select p.productname, c.categoryname
from products p 
inner join categories c
on p.categoryid=c.categoryid minus
select p.productname, c.categoryname
from products p
inner join categories c 
on p.categoryid=c.categoryid 
where categoryname='Beverages';


--List orders not shipped by 'Speedy Express'.

select o.orderid, s.companyname from orders o inner join shippers s on o.shipvia =s.shipperid
minus
select o.orderid, s.companyname from orders o inner join shippers s on o.shipvia=s.shipperid where companyname='Speedy Express';


--List  customers who are not also suppliers.
select contactname from customers 
minus
select contactname from suppliers ;
=============================================================================================================================================================
--Anti Join
/* 
It returns the rows that are present in first table and 
that are absent in the second table
*/

--List customers who have not placed any orders

select c.contactname from customers c where not exists
(select 1 from orders o where o.customerid=c.customerid);

select count(distinct customerid)from customers;
--List employees who have not made  any sales;
select * from employees where not exists(select 1 from orders where orders.employeeid=employees.employeeid);


--List  categories with no product


select c.categoryname from categories c where not exists(select 1 from products p where p.categoryid=c.categoryid);


--List product with no orders;
select * from products;
select * from orders;
select * from orderdetails;

select p.productname from products p where not exists( select 1 from orderdetails od where od.productid=p.productid);


--List suppliers with no products;

select s.companyname from suppliers s where not exists(select 1 from products  p where p.supplierid=s.supplierid);



===================================================================================================================================
--Semi Join
-- List customers who have placed orders;
select c.contactname from customers c where exists
(select 1 from orders o where o.customerid= c.customerid);


--List employees who have made sales


select e.employeeid, e.firstname, e.lastname from employees e where exists(select 1 from  orders  o where o.employeeid= e.employeeid);


--List categories with products;

select p.categoryid,p.productname
from products p
where exists( select 1 from categories c where p.categoryid=c.categoryid);



--List products with orders

select * products;
select * from orderdetails;

select p.productname from products p
where exists (select 1 from orderdetails od where od.productid=p.productid);


--List suppliers with products
select  distinct s.companyname,p.productname from suppliers  s inner join products p 
on p.supplierid= s.supplierid
where exists ( select 1 from products p where p.supplierid=s.supplierid);



--With Clause:
--List all employees with their managers

with emp_mgr as (
select firstname, lastname, title from employees )
select 
    firstname, lastname,  
case when title='Sales Representative' 
then (select firstname || lastname  from emp_mgr where title='Sales Manager')
else
'Employee' end as "Manager"
from emp_mgr where firstname!='Steven';

--Calculate the total number or orders placed by each customers


with concise_orders as
(select orderid, customerid,orderdate from orders)
select customerid, count(orderid) as orderbycustomer from concise_orders group by customerid;


--Calculate the total sales amount for each product;

with product_sale as
(select orderid, productid,(unitprice*quantity) as price from orderdetails)
select productid, sum(price)  as totalsaleamount from product_sale group by productid;


--find the top 10 customers based on their total order amount

select * from orders;
select * from orderdetails;

with sales as(
select o.customerid,od.orderid ,(od.quantity* od.unitprice) as sales
from orders o inner join orderdetails od 
on o.orderid=od.orderid)
select customerid, sum(sales) from sales group by customerid order by sum(sales) desc fetch next 10 rows only;


--find the top 5 product based on total sales amount

with products_sales as
(select productid,orderid,
(quantity*unitprice) price  from orderdetails)
select p.productname, sum(ps.price) from
products_sales ps inner join products p on p.productid= ps.productid group by p.productname 
order by sum(price) desc fetch next 5 rows only;
=============================================================================================================


--grouping set

--1.calculate the total number of order for each customer, year and month;

select  
extract (year from orderdate ) year,
extract( month from orderdate) month, 
customerid , 
count(orderid) 
from orders
group by
grouping sets( 
(extract (year from orderdate)),
(extract(month from orderdate)),
(customerid)
) ;




--2.calculate the total sales amount for each product category and year
--orders product,category
with p_sale as(
select
    orderid, 
    productid, 
    (unitprice*quantity)-(unitprice*quantity*discount) as price 
from 
    orderdetails)
select 
    c.categoryname,p.productid ,extract (year from o.shippeddate) as year,sum(ps.price)
from 
    p_sale ps 
inner join 
    products p
on 
    ps.productid=p.productid
inner join 
    categories c
on 
    p.categoryid= c.categoryid 
inner join 
    orders o
on 
    o.orderid=ps.orderid
group by
grouping sets
(
   
    (c.categoryname),
    (p.productid),
    (o.shippeddate)
)
order by c.categoryname, extract(year from o.shippeddate);  



--3.calculate the total sales amount for each shipper and country
--we would require two table products and suppliers

select * from shippers;
select * from suppliers;
select * from products;
select * from orders;

select
    s.companyname,
    o.shipCountry,
    sum((od.unitprice*od.quantity)-
    (od.unitprice*od.quantity*discount)) as sale
from 
    shippers s
inner join
    orders o
on
    o.shipvia=s.shipperid
inner join
    orderdetails od
on
    od.orderid=o.orderid
group by
grouping sets(
(s.companyname,o.shipcountry));

--4.calculate the total number of orders
--for each employee and territory

select 
    o.employeeid ,
    t.territorydescription as territory,
    count(o.orderid)
from
    orders o
inner join
    employeeterritories et
on
    o.employeeid=et.employeeid
inner join
    territories t
on
    et.territoryid=t.territoryid
group by
grouping sets((o.employeeid),(t.territorydescription))
;

--5.calculate the total sales amount for each customer and product category

with sales as
(select orderid, 
productid, 
(unitprice*quantity)-(unitprice*quantity*discount) as price
from orderdetails)
select 
    c.contactname,cat.categoryname,sum(s.price)
from 
    sales s 
inner join
    products p 
on
    p.productid=s.productid
inner join
    categories cat
on
    cat.categoryid=p.categoryid
inner join
    orders o
on 
    o.orderid=s.orderid
inner join
    customers c
on
    c.customerid=o.customerid
group by

grouping sets(
(c.contactname),
(cat.categoryname)
);