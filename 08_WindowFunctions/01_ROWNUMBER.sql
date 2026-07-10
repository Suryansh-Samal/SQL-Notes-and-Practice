/*
===========================================================
Topic       : ROW_NUMBER()
Database    : SalesDB
Description : Practice using the ROW_NUMBER() window
              function to rank records, retrieve
              top-ranked rows, and remove duplicates.
Author      : Suryansh
===========================================================
*/

USE SalesDB;

-----------------------------------------------------------
-- Q1. Rank all orders based on sales
-- from highest to lowest.
-----------------------------------------------------------
SELECT
    ProductID,
    OrderID,
    OrderDate,
    Sales,

    ROW_NUMBER() OVER
    (
        ORDER BY Sales DESC
    ) AS Sales_Rank

FROM Sales.Orders;

-----------------------------------------------------------
-- Q2. Retrieve the highest-selling order
-- for each product.
-----------------------------------------------------------
SELECT
    *
FROM
(
    SELECT
        ProductID,
        OrderID,
        Sales,

        ROW_NUMBER() OVER
        (
            PARTITION BY ProductID
            ORDER BY Sales DESC
        ) AS Product_Rank

    FROM Sales.Orders

) AS ProductSales

WHERE Product_Rank = 1;

-----------------------------------------------------------
-- Q3. Retrieve the two orders with
-- the lowest sales.
-----------------------------------------------------------
SELECT TOP (2)
    CustomerID,
    OrderID,
    OrderDate,
    Sales,

    ROW_NUMBER() OVER
    (
        ORDER BY Sales
    ) AS Sales_Rank

FROM Sales.Orders;

-----------------------------------------------------------
-- Q4. Retrieve the two customers with
-- the lowest total sales.
-----------------------------------------------------------
SELECT TOP (2)
    CustomerID,

    SUM(Sales) AS Total_Sales,

    ROW_NUMBER() OVER
    (
        ORDER BY SUM(Sales)
    ) AS Customer_Rank

FROM Sales.Orders

GROUP BY CustomerID;

-----------------------------------------------------------
-- Q5. Remove duplicate rows from the
-- OrdersArchive table by keeping the
-- most recent record for each OrderID.
-----------------------------------------------------------
SELECT
    *
FROM
(
    SELECT
        ROW_NUMBER() OVER
        (
            PARTITION BY OrderID
            ORDER BY CreationTime DESC
        ) AS Row_Number,

        *

    FROM Sales.OrdersArchive

) AS OrdersArchive

WHERE Row_Number = 1;

-----------------------------------------------------------
-- Concepts Covered
-----------------------------------------------------------
-- ✓ ROW_NUMBER()
-- ✓ Window Functions
-- ✓ OVER()
-- ✓ PARTITION BY
-- ✓ ORDER BY
-- ✓ TOP
-- ✓ GROUP BY
-- ✓ Ranking
-- ✓ Duplicate Removal