/*
===========================================================
Topic       : NTILE()
Database    : SalesDB
Description : Practice using the NTILE() window function
              to divide rows into buckets for
              segmentation and data distribution.
Author      : Suryansh
===========================================================
*/

USE SalesDB;

-----------------------------------------------------------
-- Q1. Divide orders into different numbers
-- of buckets using NTILE().
-----------------------------------------------------------
SELECT
    OrderID,
    Sales,

    NTILE(1) OVER
    (
        ORDER BY Sales
    ) AS One_Bucket,

    NTILE(2) OVER
    (
        ORDER BY Sales
    ) AS Two_Buckets,

    NTILE(3) OVER
    (
        ORDER BY Sales
    ) AS Three_Buckets,

    NTILE(4) OVER
    (
        ORDER BY Sales
    ) AS Four_Buckets

FROM Sales.Orders;

-----------------------------------------------------------
-- Q2. Segment orders into High, Medium,
-- and Low sales categories.
-----------------------------------------------------------
SELECT
    OrderID,
    Sales,
    Bucket,

    CASE
        WHEN Bucket = 1 THEN 'High'
        WHEN Bucket = 2 THEN 'Medium'
        WHEN Bucket = 3 THEN 'Low'
    END AS Sales_Segment

FROM
(
    SELECT
        OrderID,
        Sales,

        NTILE(3) OVER
        (
            ORDER BY Sales DESC
        ) AS Bucket

    FROM Sales.Orders

) AS OrderSegments;

-----------------------------------------------------------
-- Q3. Divide all orders into two groups
-- for data export.
-----------------------------------------------------------
SELECT
    NTILE(2) OVER
    (
        ORDER BY OrderID
    ) AS Export_Group,

    OrderID,
    CustomerID,
    ProductID,
    OrderDate,
    Sales

FROM Sales.Orders;

-----------------------------------------------------------
-- Concepts Covered
-----------------------------------------------------------
-- ✓ NTILE()
-- ✓ Window Functions
-- ✓ OVER()
-- ✓ ORDER BY
-- ✓ CASE Expression
-- ✓ Data Segmentation
-- ✓ Bucketing