/*
===========================================================
Topic       : SELECT INTO (Create Table As)
Database    : SalesDB
Description : Practice creating a new table from the
              results of a SELECT query using the
              SELECT INTO statement.
Author      : Suryansh
===========================================================
*/

USE SalesDB;

-----------------------------------------------------------
-- Q1. Create a new table containing the
-- total number of orders for each month.
-----------------------------------------------------------

SELECT

    DATENAME(MONTH, OrderDate) AS MonthName,

    COUNT(OrderID) AS TotalOrders

INTO Sales.MonthlyOrders

FROM Sales.Orders

GROUP BY DATENAME(MONTH, OrderDate);

-----------------------------------------------------------
-- Q2. Display the contents of the
-- newly created table.
-----------------------------------------------------------

SELECT
    *
FROM Sales.MonthlyOrders;

-----------------------------------------------------------
-- Q3. Drop the created table.
-----------------------------------------------------------

DROP TABLE Sales.MonthlyOrders;

-----------------------------------------------------------
-- Concepts Covered
-----------------------------------------------------------
-- ✓ SELECT INTO
-- ✓ CREATE TABLE AS (SQL Server Equivalent)
-- ✓ Aggregate Functions
-- ✓ COUNT()
-- ✓ DATENAME()
-- ✓ GROUP BY
-- ✓ DROP TABLE