/*
===========================================================
Topic       : DISTINCT
Database    : SalesDB
Description : Practice using the DISTINCT keyword to
              eliminate duplicate rows and retrieve
              unique records from query results.
Author      : Suryansh
===========================================================
*/

USE SalesDB;

-----------------------------------------------------------
-- Q1. Retrieve the lowest and highest sales
-- for each product.
-- DISTINCT is used to return only one row
-- for each product.
-----------------------------------------------------------
SELECT DISTINCT
    ProductID,

    MIN(Sales) OVER
    (
        PARTITION BY ProductID
    ) AS Lowest_Sales,

    MAX(Sales) OVER
    (
        PARTITION BY ProductID
    ) AS Highest_Sales

FROM Sales.Orders;

-----------------------------------------------------------
-- Concepts Covered
-----------------------------------------------------------
-- ✓ DISTINCT
-- ✓ MIN()
-- ✓ MAX()
-- ✓ Window Functions
-- ✓ OVER()
-- ✓ PARTITION BY
-- ✓ Eliminating Duplicate Rows
-- ✓ Retrieving Unique Records