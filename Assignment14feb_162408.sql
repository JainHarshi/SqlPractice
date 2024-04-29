select * from customers;
select * from employees;
select * from orders;
select * from orderdetails;
select * from suppliers;
select * from region;
select * from categories;
select * from shippers;
select * from employeeterritories;
select * from customerdemographics;
select * from CUSTOMERCUSTOMERDEMO;
select * from tab;
select * from categories;

--Calculate the total sales amount for each employee along with a flag indicating
--if the employee has more than 50 orders
select e.employeeid,
sum(od.unitprice*od.quantity),
count(o.orderid) as totalorders,
case when count(o.orderid) > 50 then 'More than 50 orders'
else 'Not More than 50 orders'
end as More_than_50_orders
from employees e inner join orders o
on e.employeeid = o.employeeid
inner join orderdetails od
on od.orderid = o.orderid
group by e.employeeid;




-- Calculate the total number of orders and total sales amount
-- for each customer who has placed orders in 1997
select 
    Orders.CustomerID,
    count(OrderDetails.OrderID) as total_order,
    sum(OrderDetails.UnitPrice*OrderDetails.Quantity) as Sales_amount
from OrderDetails 
inner join Orders on Orders.OrderID=OrderDetails.OrderID
where
    extract(year from OrderDate)=1997
group by    grouping sets(
    Orders.CustomerID)
order by
    Orders.CustomerID;


--Count the number of orders for each product category, and include a summary row showing 
--the total number of orders for all categories
select
    Categories.CategoryName,
    count(OrderDetails.OrderID)
from Categories
inner join Products on Products.CategoryID = Categories.CategoryID
inner join OrderDetails on OrderDetails.ProductID=Products.ProductID
group by
    rollup(Categories.CategoryName)
order by
    Categories.CategoryName;

--Calculate the total sales amount for each product category, and indicate
--if the total sales amount is greater than $1000
with pc as(
select
     Categories.CategoryName as CategoryName,
     sum(OrderDetails.UnitPrice*OrderDetails.Quantity) as Sales_amount
from Categories
inner join Products on Products.CategoryID = Categories.CategoryID
inner join OrderDetails on Products.ProductID=OrderDetails.ProductID
group by
    Categories.CategoryName)
select 
    CategoryName,
    Sales_amount,
    CASE
        WHEN Sales_amount > 1000 THEN 'Yes'
        ELSE 'No'
    END AS Total_sales_greater_than_1000from  
from pc    ;

--Calculate the average order value for each customer, and include a 
--summary row for the overall average order value
select 
    Orders.CustomerID,
    avg(OrderDetails.UnitPrice*OrderDetails.Quantity) as Average
from Orders
inner join OrderDetails on OrderDetails.OrderID=Orders.OrderID
GROUP BY
    ROLLUP(Orders.CustomerID)
ORDER BY    
     Orders.CustomerID;

--Calculate the total sales amount for each employee along
--with subtotals by country and a grand totaL
select
     
     Orders.EmployeeID as Employee,
     ShipCountry,
     sum(OrderDetails.UnitPrice*OrderDetails.Quantity) as Sales_amount
from Orders
inner join OrderDetails on OrderDetails.OrderID=Orders.OrderID
group by
    cube(ShipCountry,Orders.EmployeeID);

--Count the total number of orders for each product category,
--subtotaled by year, and provide a grand total:
select
    Categories.CategoryName,
    EXTRACT(YEAR FROM Orders.OrderDate) AS YEAR,
    count(OrderDetails.OrderID)  
FROM Categories
INNER JOIN  Products on Products.CategoryID=Categories.CategoryID
INNER JOIN OrderDetails on OrderDetails.ProductID=Products.ProductID
INNER JOIN Orders on Orders.OrderID=OrderDetails.OrderID
group by 
    CUBE(Categories.CategoryName, EXTRACT(YEAR FROM Orders.OrderDate))
order by
   Categories.CategoryName ;

--8 Calculate the total sales amount for each 
--shipper, subtotaled by region, and a grand total
select
    Shippers.CompanyName,
    Orders.ShipRegion,
    sum(OrderDetails.UnitPrice*OrderDetails.Quantity) as Sales_amount
from Shippers
inner join Orders on Orders.ShipVia=Shippers.ShipperID
inner join OrderDetails on Orders.OrderID=OrderDetails.OrderID
group by
    cube(Shippers.CompanyName,Orders.ShipRegion)
order by
    Shippers.CompanyName;

--Count the total number of orders for each customer,
--subtotaled by month, and provide a grand totaL
select
    Orders.CustomerID,
    extract(month from Orders.OrderDate) as Month,
    count(Orders.OrderID)
FROM Orders 
inner join OrderDetails on Orders.OrderID=OrderDetails.OrderID
group by
    cube(extract(month from Orders.OrderDate),Orders.CustomerID)
order by
   Month;

--10 Calculate the total sales amount for each product, 
--subtotaled by country, and provide a grand totaL
select
    Products.ProductName,
    Orders.ShipCountry,
    sum(OrderDetails.UnitPrice*OrderDetails.Quantity) as Sales_amount
from Products
inner join OrderDetails on OrderDetails.ProductID=Products.ProductID
inner join Orders on OrderDetails.OrderID=Orders.OrderID
GROUP BY
    CUBE(Orders.ShipCountry,Products.ProductName)
order by
    Orders.ShipCountry;

--11 Calculate the total sales amount for each product category and year
WITH PI AS (
select
    Categories.CategoryName,
    sum(OrderDetails.UnitPrice*OrderDetails.Quantity) AS SALES_AMOUNT,
    EXTRACT(YEAR FROM Orders.OrderDate) AS YEAR
FROM Categories
INNER JOIN  Products on Products.CategoryID=Categories.CategoryID
INNER JOIN OrderDetails on OrderDetails.ProductID=Products.ProductID
INNER JOIN Orders on Orders.OrderID=OrderDetails.OrderID
GROUP BY
     Categories.CategoryName,EXTRACT(YEAR FROM Orders.OrderDate))
SELECT * FROM PI
PIVOT(SUM(SALES_AMOUNT) FOR  YEAR IN(1996,1997,1998,1999))
ORDER BY
   CategoryName;

--12 Calculate the total quantity sold for each product category and month
WITH PI AS(
select
    Categories.CategoryName,
    EXTRACT(MONTH FROM Orders.OrderDate) AS Month,
    SUM(OrderDetails.Quantity)  AS TOTAL_COUNT
FROM Categories
INNER JOIN  Products on Products.CategoryID=Categories.CategoryID
INNER JOIN OrderDetails on OrderDetails.ProductID=Products.ProductID
INNER JOIN Orders on Orders.OrderID=OrderDetails.OrderID
group by 
    Categories.CategoryName,EXTRACT(MONTH FROM Orders.OrderDate))
SELECT * FROM PI 
PIVOT(SUM(TOTAL_COUNT) FOR Month IN (1 AS JAN,2 AS FEB,3 AS MAR,4 AS APR,5 AS MAY,6 AS JUN, 7 AS JULY, 8 AS AUG,9 AS SEPT,10 AS OCT,11 AS NOV, 12 AS DEC))
order by
   CategoryName;

--13 Count the total number of orders for each shipper and country
WITH PI AS(
SELECT
    Shippers.CompanyName,
    ShipCountry,
    COUNT(OrderID) AS TOTAL_COUNT
FROM Shippers
INNER JOIN Orders on Orders.Shipvia=Shippers.ShipperID
GROUP BY
    Shippers.CompanyName,ShipCountry)
SELECT * FROM PI
PIVOT(SUM(TOTAL_COUNT) FOR ShipCountry IN ('USA','Canada','UK','Germany','France'));

--14 Calculate the total sales amount for each employee and year
with pi as(
select
    EmployeeID,
    extract(year from OrderDate) as year,
    sum(OrderDetails.UnitPrice*OrderDetails.Quantity) as Sales_amount
from Orders
INNER JOIN OrderDetails on Orders.OrderID=OrderDetails.OrderID
group by
     EmployeeID,extract(year from OrderDate))
select * from pi 
pivot(sum(Sales_amount) for year in(1996,1997,1998))
order by
    EmployeeID;

--15 Count the total number of orders for each customer and year
with pi as(
select
    Orders.CustomerID,
    extract(year from Orders.OrderDate) as year,
    count(Orders.OrderID) as total_order
FROM Orders 
inner join OrderDetails on Orders.OrderID=OrderDetails.OrderID
group by
    Orders.CustomerID,extract(year from Orders.OrderDate))
select 
   CustomerID,
    COALESCE(a, 0) as year_1996,
    COALESCE(b, 0) as year_1997,
    COALESCE(c, 0)as year_1998 ,
    COALESCE(d, 0) as year_1999,
    COALESCE(e, 0) as year_2000
from pi 
pivot(sum(total_order) for year in (1996 as a,1997 as b,1998 as c,1999 as d,2000 as e))
order by
    CustomerID;
