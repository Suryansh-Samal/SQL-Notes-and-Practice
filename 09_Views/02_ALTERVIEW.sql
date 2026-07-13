/*
===========================================================
Topic       : Altering and Dropping Views
Database    : SalesDB
Description : Practice modifying existing SQL views,
              adding new columns, updating business logic,
              and deleting views when no longer required.
Author      : Suryansh
===========================================================
*/

USE SalesDB;

-----------------------------------------------------------
-- Q1. Alter the monthly sales summary view by
-- adding the average monthly sales.
-----------------------------------------------------------

ALTER VIEW Sales.V_Monthly_Summary
AS

SELECT

    DATETRUNC(MONTH, OrderDate) AS OrderMonth,

    SUM(Sales) AS TotalSales,

    COUNT(OrderID) AS TotalOrders,

    SUM(Quantity) AS TotalQuantity,

    AVG(Sales) AS AvgSales

FROM Sales.Orders

GROUP BY DATETRUNC(MONTH, OrderDate);

-----------------------------------------------------------
-- Q2. Drop the monthly sales summary view.
-----------------------------------------------------------

DROP VIEW Sales.V_Monthly_Summary;

-----------------------------------------------------------
-- Q3. Alter the combined details view by
-- adding customer and salesperson information.
-----------------------------------------------------------

ALTER VIEW Sales.Combined_Details
AS

SELECT

    O.OrderID,

    O.OrderDate,

    P.Product,

    P.Category,

    C.CustomerID,

    COALESCE(C.FirstName, '')
    + ' ' +
    COALESCE(C.LastName, '')
        AS FullName,

    C.Country AS CustomerCountry,

    C.Score,

    E.EmployeeID AS SalesPersonID,

    COALESCE(E.FirstName, '')
    + ' ' +
    COALESCE(E.LastName, '')
        AS SalesPersonName

FROM Sales.Orders AS O

LEFT JOIN Sales.Products AS P
ON O.ProductID = P.ProductID

LEFT JOIN Sales.Customers AS C
ON O.CustomerID = C.CustomerID

LEFT JOIN Sales.Employees AS E
ON O.SalesPersonID = E.EmployeeID;

-----------------------------------------------------------
-- Q4. Alter the Europe customer view by
-- adding customer and salesperson details while
-- excluding customers from the USA.
-----------------------------------------------------------

ALTER VIEW Sales.CustomerDetails_Europe
AS

SELECT

    O.OrderID,

    O.OrderDate,

    P.Product,

    P.Category,

    C.CustomerID,

    COALESCE(C.FirstName, '')
    + ' ' +
    COALESCE(C.LastName, '')
        AS FullName,

    C.Country AS CustomerCountry,

    C.Score,

    E.EmployeeID AS SalesPersonID,

    COALESCE(E.FirstName, '')
    + ' ' +
    COALESCE(E.LastName, '')
        AS SalesPersonName

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
-- ✓ ALTER VIEW
-- ✓ DROP VIEW
-- ✓ COALESCE()
-- ✓ String Concatenation
-- ✓ LEFT JOIN
-- ✓ Aggregate Functions
-- ✓ AVG()
-- ✓ SUM()
-- ✓ COUNT()
-- ✓ DATETRUNC()
-- ✓ Business Logic
-- ✓ View Maintenance