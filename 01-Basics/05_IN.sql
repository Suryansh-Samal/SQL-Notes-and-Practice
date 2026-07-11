/*
===========================================================
Topic       : IN
Database    : SalesDB
Description : Practice using the IN operator to filter
              rows based on a list of specified values.
Author      : Suryansh
===========================================================
*/

USE SalesDB;

-----------------------------------------------------------
-- Q1. Retrieve all orders placed by
-- customers with CustomerID 1 and 2.
-----------------------------------------------------------
SELECT
    *
FROM Sales.Orders
WHERE CustomerID IN (1, 2);

-----------------------------------------------------------
-- Concepts Covered
-----------------------------------------------------------
-- ✓ IN
-- ✓ WHERE
-- ✓ Filtering Rows
-- ✓ Multiple Conditions