/*
===========================================================
Topic       : DENSE_RANK()
Database    : SalesDB
Description : Practice using the DENSE_RANK() window
              function to rank records based on sales
              without leaving gaps in the ranking.
Author      : Suryansh
===========================================================
*/

USE SalesDB;

-----------------------------------------------------------
-- Q1. Rank each order based on sales
-- from highest to lowest using DENSE_RANK().
-----------------------------------------------------------
SELECT
    OrderID,
    ProductID,
    OrderDate,
    Sales,

    DENSE_RANK() OVER
    (
        ORDER BY Sales DESC
    ) AS Sales_Rank

FROM Sales.Orders;

-----------------------------------------------------------
-- Concepts Covered
-----------------------------------------------------------
-- ✓ DENSE_RANK()
-- ✓ Window Functions
-- ✓ OVER()
-- ✓ ORDER BY
-- ✓ Ranking
-- ✓ Handling Ties