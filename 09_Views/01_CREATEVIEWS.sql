/*
===========================================================
Topic       : Views
Database    : SalesDB
Description : Practice creating SQL views to simplify
              reporting, combine data from multiple tables,
              and filter data for specific business needs.
Author      : Suryansh
===========================================================
*/

USE SalesDB;

-----------------------------------------------------------
-- Q1. Create a monthly sales summary view.
-----------------------------------------------------------

CREATE VIEW Sales.V_Monthly_Summary AS

SELECT

    DATETRUNC(MONTH, OrderDate) AS OrderMonth,

    SUM(Sales) AS TotalSales,

    COUNT(OrderID) AS TotalOrders,

    SUM(Quantity) AS TotalQuantity

FROM Sales.Orders

GROUP BY DATETRUNC(MONTH, OrderDate);

-----------------------------------------------------------
-- Q2. Create a view that combines details from
-- Orders, Products, Customers, and Employees.
-----------------------------------------------------------

CREATE VIEW Sales.Combined_Details AS

SELECT

    O.OrderID,

    O.OrderDate,

    P.Product,

    P.Category,

    C.CustomerID,

    E.EmployeeID AS SalesPersonID

FROM Sales.Orders AS O

LEFT JOIN Sales.Products AS P
ON O.ProductID = P.ProductID

LEFT JOIN Sales.Customers AS C
ON O.CustomerID = C.CustomerID

LEFT JOIN Sales.Employees AS E
ON O.SalesPersonID = E.EmployeeID;

-----------------------------------------------------------
-- Q3. Create a view for the Europe sales team by
-- excluding customers from the USA.
-----------------------------------------------------------

CREATE VIEW Sales.CustomerDetails_Europe AS

SELECT

    O.OrderID,

    O.OrderDate,

    P.Product,

    P.Category,

    C.CustomerID,

    E.EmployeeID AS SalesPersonID

FROM Sales.Orders AS O

LEFT JOIN Sales.Products AS P
ON O.ProductID = P.ProductID

LEFT JOIN Sales.Customers AS C
ON O.CustomerID = C.CustomerID

LEFT JOIN Sales.Employees AS E
ON O.SalesPersonID = E.EmployeeID

WHERE C.Country <> 'USA';

-----------------------------------------------------------
-- Concepts Covered
-----------------------------------------------------------
-- ✓ CREATE VIEW
-- ✓ Reporting Views
-- ✓ LEFT JOIN
-- ✓ Aggregate Functions
-- ✓ SUM()
-- ✓ COUNT()
-- ✓ DATETRUNC()
-- ✓ GROUP BY
-- ✓ Filtering Data
-- ✓ Business-Specific Views