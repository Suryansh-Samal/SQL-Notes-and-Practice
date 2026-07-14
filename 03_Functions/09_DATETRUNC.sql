/*
===========================================================
Topic       : DATETRUNC()
Database    : SalesDB
Description : Practice using the DATETRUNC() function to
              truncate date values to a specified date part
              and perform monthly sales analysis.
Author      : Suryansh
===========================================================
*/

USE SalesDB;

-----------------------------------------------------------
-- Q1. Find the total sales for each month by
-- truncating the order date to the first day
-- of the month.
-----------------------------------------------------------

SELECT

    DATETRUNC(MONTH, OrderDate) AS OrderMonth,

    SUM(Sales) AS TotalSales

FROM Sales.Orders

GROUP BY

    DATETRUNC(MONTH, OrderDate)

ORDER BY

    OrderMonth;

-----------------------------------------------------------
-- Concepts Covered
-----------------------------------------------------------
-- ✓ DATETRUNC()
-- ✓ MONTH
-- ✓ GROUP BY
-- ✓ SUM()
-- ✓ ORDER BY
-- ✓ Aggregate Functions
-- ✓ Monthly Sales Analysis