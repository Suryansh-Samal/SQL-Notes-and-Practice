/*
===========================================================
Topic       : LAG() and LEAD()
Database    : SalesDB
Description : Practice using the LAG() and LEAD() window
              functions to compare values between rows,
              analyze month-over-month performance, and
              measure customer loyalty.
Author      : Suryansh
===========================================================
*/

USE SalesDB;

-----------------------------------------------------------
-- Q1. Analyze Month-over-Month (MoM) sales performance
-- by calculating the sales difference and percentage
-- change compared to the previous month.
-----------------------------------------------------------
SELECT
    Order_Month,
    Current_Month_Sales,
    Previous_Month_Sales,

    Current_Month_Sales - Previous_Month_Sales
        AS Sales_Difference,

    ROUND
    (
        CAST
        (
            Current_Month_Sales - Previous_Month_Sales
            AS FLOAT
        )
        /
        Previous_Month_Sales * 100,
        1
    ) AS Percentage_Change

FROM
(
    SELECT
        MONTH(OrderDate) AS Order_Month,

        SUM(Sales) AS Current_Month_Sales,

        LAG(SUM(Sales)) OVER
        (
            ORDER BY MONTH(OrderDate)
        ) AS Previous_Month_Sales

    FROM Sales.Orders

    GROUP BY MONTH(OrderDate)

) AS MonthlySales;

-----------------------------------------------------------
-- Q2. Rank customers based on their average
-- number of days between consecutive orders.
-----------------------------------------------------------
SELECT
    CustomerID,

    AVG(Gap_Between_Orders) AS Average_Days_Between_Orders,

    RANK() OVER
    (
        ORDER BY
        COALESCE
        (
            AVG(Gap_Between_Orders),
            999999
        )
    ) AS Loyalty_Rank

FROM
(
    SELECT
        OrderID,
        CustomerID,

        OrderDate AS Current_Order,

        LEAD(OrderDate) OVER
        (
            PARTITION BY CustomerID
            ORDER BY OrderDate
        ) AS Next_Order,

        DATEDIFF
        (
            DAY,
            OrderDate,
            LEAD(OrderDate) OVER
            (
                PARTITION BY CustomerID
                ORDER BY OrderDate
            )
        ) AS Gap_Between_Orders

    FROM Sales.Orders

) AS CustomerOrders

GROUP BY CustomerID;

-----------------------------------------------------------
-- Concepts Covered
-----------------------------------------------------------
-- ✓ LAG()
-- ✓ LEAD()
-- ✓ RANK()
-- ✓ OVER()
-- ✓ PARTITION BY
-- ✓ ORDER BY
-- ✓ GROUP BY
-- ✓ SUM()
-- ✓ AVG()
-- ✓ DATEDIFF()
-- ✓ COALESCE()
-- ✓ ROUND()
-- ✓ Month-over-Month Analysis
-- ✓ Customer Loyalty Analysis