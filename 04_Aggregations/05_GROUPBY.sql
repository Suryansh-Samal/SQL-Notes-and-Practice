/*
===========================================================
Topic       : TOP with Aggregate Functions
Database    : SalesDB
Description : Practice using TOP, GROUP BY, ORDER BY,
              and aggregate functions to retrieve
              customers based on total sales.
Author      : Suryansh
===========================================================
*/

USE SalesDB;

-----------------------------------------------------------
-- Q1. Retrieve the two customers with the
-- lowest total sales.
-----------------------------------------------------------
SELECT TOP (2)
    CustomerID,
    SUM(Sales) AS Total_Sales
FROM Sales.Orders
GROUP BY CustomerID
ORDER BY Total_Sales ASC;

-----------------------------------------------------------
-- Concepts Covered
-----------------------------------------------------------
-- ✓ TOP
-- ✓ SUM()
-- ✓ GROUP BY
-- ✓ ORDER BY
-- ✓ Aggregate Functions