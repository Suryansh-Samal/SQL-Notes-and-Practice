/*
===========================================================
Topic       : RANK()
Database    : SalesDB
Description : Practice using the RANK() window function
              to rank records based on sales and
              aggregated values.
Author      : Suryansh
===========================================================
*/

USE SalesDB;

-----------------------------------------------------------
-- Q1. Rank each order based on sales
-- from highest to lowest.
-----------------------------------------------------------
SELECT
    OrderID,
    OrderDate,
    Sales,

    RANK() OVER
    (
        ORDER BY Sales DESC
    ) AS Sales_Rank

FROM Sales.Orders;

-----------------------------------------------------------
-- Q2. Rank customers based on
-- their total sales.
-----------------------------------------------------------
SELECT
    CustomerID,

    SUM(Sales) AS Total_Sales,

    RANK() OVER
    (
        ORDER BY SUM(Sales) DESC
    ) AS Customer_Rank

FROM Sales.Orders

GROUP BY CustomerID;

-----------------------------------------------------------
-- Q3. Rank each order based on sales
-- while displaying the associated product.
-----------------------------------------------------------
SELECT
    OrderID,
    ProductID,
    OrderDate,
    Sales,

    RANK() OVER
    (
        ORDER BY Sales DESC
    ) AS Sales_Rank

FROM Sales.Orders;

-----------------------------------------------------------
-- Concepts Covered
-----------------------------------------------------------
-- ✓ RANK()
-- ✓ Window Functions
-- ✓ OVER()
-- ✓ ORDER BY
-- ✓ GROUP BY
-- ✓ SUM()
-- ✓ Ranking