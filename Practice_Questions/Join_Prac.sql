Use SalesDB
--Q1 Find customer name, order id and sales for the customers who have placed orders.
Select 
	firstname As CustomerName,
	OrderID,
	Sales
From Sales.Customers c
Inner Join Sales.Orders o on c.CustomerID = o.CustomerID;

-- Q2 Find customer id and firstname of the customers who haven't placed any orders.
Select
	c.CustomerID,
	FirstName
From Sales.Customers c
Left Join Sales.Orders o on c.CustomerID = o.CustomerID
Where o.OrderID Is Null;

-- Q3 Find the total number of orders placed by each customer. Give CustomerID | FirstName | TotalOrders
Select 
	c.CustomerID,
	c.FirstName,
	Count(o.CustomerID) as TotalOrders
From Sales.Customers c 
Left Join Sales.Orders o on c.CustomerID = o.CustomerID
Group By c.CustomerID,
		 c.FirstName;

-- Q4 Find customers who have placed more than 2 orders. Give CustomerID | FirstName | TotalOrders
SELECT 
    c.CustomerID,
    c.FirstName,
    COUNT(o.CustomerID) AS TotalOrders
FROM Sales.Customers c 
LEFT JOIN Sales.Orders o 
    ON c.CustomerID = o.CustomerID
GROUP BY 
    c.CustomerID,
    c.FirstName
HAVING COUNT(o.CustomerID) > 2;

/*Q5 Find the customers who have placed at least one order, along with their total sales amount.
Give CustomerID | FirstName | TotalSales*/
Select 
	c.CustomerID,
	c.FirstName,
	Sum(o.Sales) as TotalSales
From Sales.Customers c
Inner Join Sales.Orders o on c.CustomerID = o.CustomerID
Group by c.CustomerID,
		 c.FirstName;

--Q6 Find all customers who have never placed an order AND are from USA. Give CustomerID | FirstName | Country
Select 
	c.CustomerID,
	c.FirstName,
	c.Country
From Sales.Customers c
Left Join Sales.Orders o on c.CustomerID = o.CustomerID
Where o.OrderID IS Null And c.Country = 'USA'

/*Q7 Find the customer(s) who have placed the highest number of orders. Give CustomerID | FirstName | TotalOrders
Give CustomerID | FirstName | TotalOrders. If two or more customers are tied for the highest number,
return all of them.*/
With CustomerOrders As (
	Select 
		c.CustomerID,
		c.FirstName,
		Count(o.CustomerID) As TotalOrders
	from Sales.Customers c
	Inner Join Sales.Orders o on c.CustomerID = o.CustomerID
	Group By c.CustomerID,
			 c.FirstName
),
RankedCustomers As (
	Select 
		*,
		Rank() Over (Order by TotalOrders Desc) As CustomerRank
	from CustomerOrders
) 	
Select 
	CustomerID,
	FirstName,
	TotalOrders
from RankedCustomers
Where CustomerRank = 1

--Q8 Find the total sales made by each product category. Give Category | TotalSales
/*Join the necessary tables.
Calculate total sales using SUM().
Group the result by product category.
Sort from highest total sales to lowest.*/
Select 
	p.Category,
	Sum(o.Sales) as TotalSales
from Sales.Products p
Inner Join Sales.Orders o on p.ProductID = o.ProductID
Group by p.Category
Order by TotalSales Desc

/* Q9 Find the total sales made by each customer for each product category. Include ONLY products that have been ordered at least once. Do not include customers/category combinations with no orders.
Give CustomerID | FirstName | Category | TotalSales
Sort by CustomerID ascending, then TotalSales descending.*/
Select 
	c.CustomerID,
	c.FirstName,
	p.Category,
	Sum(Sales) as TotalSales
from Sales.Customers c
Inner join Sales.Orders o on c.CustomerID = o.CustomerID
Inner join Sales.Products p on o.ProductID = p.ProductID
Group By c.CustomerID,
		 c.FirstName,
		 p.Category
Order by CustomerID, TotalSales Desc;

/* Q10Find the customer who has spent the most money in total.
Requirements:
Include only customers who have placed at least one order
Return all customers if there is a tie
Give CustomerID | FirstName | TotalSales
Highest TotalSales first.*/
Select 
	CustomerID,
	FirstName,
	TotalSales
from(
Select 
	*,
	Rank() Over (Order by TotalSales desc) as CustomerRank
from(
Select
	c.CustomerID,
	C.FirstName,
	Sum(Sales) As TotalSales
from Sales.Customers  c
Inner Join Sales.Orders o on c.CustomerID = o.CustomerID
Group by c.CustomerID,
		 c.FirstName
)t
)x
Where CustomerRank = 1;

-- Can also be done like this
With CustomerOrders as (
	Select 
		c.CustomerID,
		c.FirstName,
		Sum(Sales) As TotalSales
	from Sales.Customers c
	Inner Join Sales.Orders o on c.CustomerID = o.CustomerID
	Group by c.CustomerID,
			 c.FirstName
), 

CustomerRanking As(
	Select 
	*,
	Rank() Over (Order by TotalSales desc) as CustomerRank
	from CustomerOrders
)
Select 
	CustomerID,
	FirstName,
	TotalSales
from CustomerRanking
Where CustomerRank = 1

/* Q11 Find all customers who have placed 2 or more orders.
Return:
CustomerID | FirstName | TotalOrders
Requirements:
Only customers with 2+ orders
Sort by TotalOrders descending
Don't include customers with zero orders*/
Select 
	c.CustomerID,
	c.FirstName,
	Count(o.CustomerID) as TotalOrders
from Sales.Customers c
Inner join Sales.Orders o on c.CustomerID = o.CustomerID
Group by c.CustomerID,
		c.FirstName
Having Count(o.CustomerID)>= 2

/*Q12 Find customers whose total sales are greater than the average total sales of all customers who have placed 
at least one order.
Return:
CustomerID | FirstName | TotalSales*/
Select 
	CustomerID,
	FirstName,
	TotalSales
from (
Select 
	c.CustomerID,
	c.FirstName,
	Sum(Sales) as TotalSales,
	Avg(Sum(Sales)) Over () As AvgSales
from Sales.Customers c
Inner join Sales.Orders o on c.CustomerID = o.CustomerID
Group by c.CustomerID,
		c.FirstName
)t 
Where TotalSales > AvgSales

/* Q13 Find: The number of distinct customers who have placed at least one order.
Return exactly:
TotalCustomers*/
Select 
	Count(CustomerID) as TotalCustomers
from(
Select 
	c.CustomerID,
	Count(o.CustomerID) as TotalOrders
from Sales.Customers c
Inner join Sales.Orders o on c.CustomerID = o.CustomerID
group by c.CustomerID)t
Where TotalOrders>1

/* Q14 Find customers who have placed orders on at least 2 different dates.
Return:
CustomerID | FirstName | DistinctOrderDates
Requirements:
A customer can have multiple orders on the same date.
Multiple orders on the same date count as ONE date.
Only customers with 2 or more different order dates.
Sort by DistinctOrderDates descending.*/
Select
	c.CustomerID,
	c.FirstName,
	Count(Distinct o.OrderDate) as DistinctOrderDate
from Sales.Customers c
Inner join Sales.Orders o on c.CustomerID = o.CustomerID
Group by c.CustomerID,
		 c.FirstName
Having Count(Distinct o.OrderDate) >=2

/* Q15 Find customers who have placed orders, but have never placed an order with Sales < 20.
Return:
CustomerID | FirstName*/
Select 
	c.CustomerID,
	c.FirstName
from Sales.Customers c
inner join Sales.Orders o on c.CustomerID = o.CustomerID
group by c.CustomerID,
		 c.FirstName
Having count(case when o.sales<20 then 1 end) = 0 
	
/* Q16 Find customers whose total sales are greater than 100, but who have placed at least 3 orders.
Return:
CustomerID | FirstName | TotalOrders | TotalSales
Requirements:
Customer must have at least 3 orders
Their total sales must be greater than 100
Sort by TotalSales descending*/
Select 
	c.CustomerID,
	c.FirstName,
	Count(o.OrderID) as TotalOrders,
	Sum(o.Sales) as TotalSales
from Sales.Customers c
inner join Sales.Orders o on c.CustomerID = o.CustomerID
Group by c.CustomerID,
		 c.FirstName
Having Count(o.OrderID)>=3 and Sum(Sales)>100

/* Q17 Find the customers who have placed orders for more than one different ProductID.
Return:
CustomerID | FirstName | DistinctProducts
Requirements:
A customer may have ordered the same product multiple times.
That product should count only once.
Only customers who ordered 2 or more different products should appear.
Sort by DistinctProducts descending.*/
Select
	c.CustomerID,
	c.FirstName,
	Count(distinct o.ProductID) as DistinctProducts
from Sales.Customers c
inner join Sales.Orders o on o.CustomerID = c.CustomerID
Group by c.CustomerID,
		 c.FirstName
Having Count(distinct o.ProductID)>=2
Order by DistinctProducts

--Q18 Show CustomerID, FirstName, Product and totalorders per product by each customer
SELECT
    c.CustomerID,
    c.FirstName,
    p.Product,
    COUNT(o.ProductID) AS OrderCountPerProduct
FROM Sales.Customers c
INNER JOIN Sales.Orders o
    ON c.CustomerID = o.CustomerID
INNER JOIN Sales.Products p
    ON o.ProductID = p.ProductID
GROUP BY
    c.CustomerID,
    c.FirstName,
    p.Product
	
/* Q19 Return every order along with its customer information.
Return:
OrderID | FirstName | Country | Sales
Requirements:
Include EVERY order.
Even if an order's CustomerID has no match in Sales.Customers, keep that order.
For unmatched orders, FirstName and Country should be NULL.
Don't filter out unmatched orders.*/
Select 
	o.OrderID,
	c.FirstName,
	c.Country,
	o.Sales
from Sales.Orders o 
left join Sales.Customers c on c.CustomerID = o.CustomerID

/* Q20 Return all customers and all orders, including:
Customers who have orders
Customers who have no orders
Orders whose CustomerID has no matching customer
Return:
CustomerID | FirstName | OrderID | Sales*/
 Select 
	c.CustomerID,
	c.FirstName,
	o.OrderID,
	o.Sales
from Sales.Customers c 
Full join Sales.Orders o on c.CustomerID = o.CustomerID

/* Q21 Find the total number of customers and the total number of orders.
Return exactly:
TotalCustomers | TotalOrders
Important requirements
A customer with 5 orders must count as 1 customer.
Every order should count as 1 order.*/
WITH TotalCustomers AS (
    SELECT COUNT(DISTINCT o.CustomerID) AS TotalCustomers
    FROM Sales.Customers c
    INNER JOIN Sales.Orders o 
        ON c.CustomerID = o.CustomerID
),
TotalOrders AS (
    SELECT COUNT(*) AS TotalOrders
    FROM Sales.Orders
)
SELECT
    tc.TotalCustomers,
    tor.TotalOrders
FROM TotalCustomers tc
CROSS JOIN TotalOrders tor;

-- Also be done like this
SELECT
    COUNT(DISTINCT c.CustomerID) AS TotalCustomers,
    COUNT(o.OrderID) AS TotalOrders
FROM Sales.Customers c
INNER JOIN Sales.Orders o
    ON c.CustomerID = o.CustomerID;

-- Also like this
SELECT
     (SELECT COUNT(DISTINCT o.CustomerID)
    FROM Sales.Customers c
    INNER JOIN Sales.Orders o 
        ON c.CustomerID = o.CustomerID) As TotalCustomers,

    (SELECT COUNT(*) 
     FROM Sales.Orders) AS TotalOrders;