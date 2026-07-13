/*
===========================================================
Topic       : Common Table Expressions (CTE)
Database    : SalesDB
Description : Practice using Common Table Expressions (CTEs)
              to simplify complex queries, perform
              aggregations, customer segmentation,
              ranking, and running totals.
Author      : Suryansh
===========================================================
*/

USE SalesDB;

-----------------------------------------------------------
-- Q1. Analyze customer sales using multiple CTEs.
--
-- Tasks:
-- 1. Calculate total sales for each customer.
-- 2. Find each customer's last order date.
-- 3. Rank customers based on total sales.
-- 4. Segment customers into High, Medium and Low.
-----------------------------------------------------------

WITH CTE_Total_Sales AS
(
    SELECT
        CustomerID,
        SUM(Sales) AS TotalSales
    FROM Sales.Orders
    GROUP BY CustomerID
),

CTE_Last_Order AS
(
    SELECT
        CustomerID,
        MAX(OrderDate) AS LastOrder
    FROM Sales.Orders
    GROUP BY CustomerID
),

CTE_Customer_Rank AS
(
    SELECT
        CustomerID,
        TotalSales,

        RANK() OVER
        (
            ORDER BY TotalSales DESC
        ) AS CustomerRank

    FROM CTE_Total_Sales
),

CTE_Segment_Customers AS
(
    SELECT
        CustomerID,
        TotalSales,

        CASE

            WHEN TotalSales > 90 THEN 'High'

            WHEN TotalSales > 50 THEN 'Medium'

            ELSE 'Low'

        END AS CustomerSegment

    FROM CTE_Total_Sales
)

SELECT

    CR.CustomerRank,

    C.CustomerID,

    C.FirstName,

    C.LastName,

    TS.TotalSales,

    LO.LastOrder,

    SC.CustomerSegment

FROM Sales.Customers AS C

LEFT JOIN CTE_Total_Sales AS TS
ON TS.CustomerID = C.CustomerID

LEFT JOIN CTE_Last_Order AS LO
ON LO.CustomerID = C.CustomerID

LEFT JOIN CTE_Customer_Rank AS CR
ON CR.CustomerID = C.CustomerID

LEFT JOIN CTE_Segment_Customers AS SC
ON SC.CustomerID = C.CustomerID;

-----------------------------------------------------------
-- Q2. Find the running total of monthly sales.
-----------------------------------------------------------

WITH CTE_Monthly_Summary AS
(
    SELECT

        DATETRUNC(MONTH, OrderDate) AS OrderMonth,

        SUM(Sales) AS TotalSales

    FROM Sales.Orders

    GROUP BY DATETRUNC(MONTH, OrderDate)
)

SELECT

    OrderMonth,

    TotalSales,

    SUM(TotalSales) OVER
    (
        ORDER BY OrderMonth
    ) AS RunningTotal

FROM CTE_Monthly_Summary;

-----------------------------------------------------------
-- Concepts Covered
-----------------------------------------------------------
-- ✓ Common Table Expressions (CTE)
-- ✓ WITH Clause
-- ✓ Multiple CTEs
-- ✓ Nested CTEs
-- ✓ Aggregate Functions
-- ✓ SUM()
-- ✓ MAX()
-- ✓ CASE Expression
-- ✓ RANK()
-- ✓ Window Functions
-- ✓ OVER()
-- ✓ Running Total
-- ✓ LEFT JOIN
-- ✓ GROUP BY
-- ✓ DATETRUNC()