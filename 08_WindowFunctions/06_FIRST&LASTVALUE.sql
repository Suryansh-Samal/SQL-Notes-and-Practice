/*
===========================================================
Topic       : FIRST_VALUE() and LAST_VALUE()
Database    : SalesDB
Description : Practice using the FIRST_VALUE() and
              LAST_VALUE() window functions to retrieve
              the lowest and highest sales for each
              product and perform comparative analysis.
Author      : Suryansh
===========================================================
*/

USE SalesDB;

-----------------------------------------------------------
-- Q1. Retrieve the lowest and highest sales
-- for each product using FIRST_VALUE()
-- and LAST_VALUE().
-----------------------------------------------------------
SELECT DISTINCT
    ProductID,
    Lowest_Sales,
    Highest_Sales
FROM
(
    SELECT
        ProductID,
        Sales,

        FIRST_VALUE(Sales) OVER
        (
            PARTITION BY ProductID
            ORDER BY Sales
        ) AS Lowest_Sales,

        LAST_VALUE(Sales) OVER
        (
            PARTITION BY ProductID
            ORDER BY Sales
            ROWS BETWEEN CURRENT ROW
            AND UNBOUNDED FOLLOWING
        ) AS Highest_Sales,

        Sales -
        FIRST_VALUE(Sales) OVER
        (
            PARTITION BY ProductID
            ORDER BY Sales
        ) AS Sales_Difference

    FROM Sales.Orders

) AS ProductSales;

-----------------------------------------------------------
-- Q2. Retrieve the lowest and highest sales
-- for each product using FIRST_VALUE()
-- only.
-----------------------------------------------------------
SELECT DISTINCT
    ProductID,

    FIRST_VALUE(Sales) OVER
    (
        PARTITION BY ProductID
        ORDER BY Sales
    ) AS Lowest_Sales,

    FIRST_VALUE(Sales) OVER
    (
        PARTITION BY ProductID
        ORDER BY Sales DESC
    ) AS Highest_Sales

FROM Sales.Orders;

-----------------------------------------------------------
-- Concepts Covered
-----------------------------------------------------------
-- ✓ FIRST_VALUE()
-- ✓ LAST_VALUE()
-- ✓ Window Functions
-- ✓ OVER()
-- ✓ PARTITION BY
-- ✓ ORDER BY
-- ✓ ROWS BETWEEN
-- ✓ DISTINCT
-- ✓ Value Comparison