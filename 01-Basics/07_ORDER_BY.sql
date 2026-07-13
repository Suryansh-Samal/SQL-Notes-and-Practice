/*
===========================================================
Topic       : ORDER BY
Database    : SalesDB
Description : Practice sorting query results in ascending
              and descending order using the ORDER BY clause.
Author      : Suryansh
===========================================================
*/

USE SalesDB;

-----------------------------------------------------------
-- Q1. Show all order details sorted by sales
-- from highest to lowest.
-----------------------------------------------------------

SELECT
    *
FROM Sales.Orders

ORDER BY Sales DESC;

-----------------------------------------------------------
-- Q2. Show all order details sorted by sales
-- from lowest to highest.
-----------------------------------------------------------

SELECT
    *
FROM Sales.Orders

ORDER BY Sales;
-- ASC is the default sorting order.

-----------------------------------------------------------
-- Concepts Covered
-----------------------------------------------------------
-- ✓ ORDER BY
-- ✓ ASC (Ascending Order)
-- ✓ DESC (Descending Order)
-- ✓ Sorting Query Results