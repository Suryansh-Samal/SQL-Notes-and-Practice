/*
===========================================================
Topic       : AVG()
Database    : SalesDB
Description : Practice using the AVG() function as a
              window function to calculate averages,
              compare values, and compute moving averages.
Author      : Suryansh
===========================================================
*/

USE SalesDB;

-----------------------------------------------------------
-- Q1. Display each order along with:
-- 1. The average sales across all orders.
-- 2. The average sales for each product.
-----------------------------------------------------------
SELECT
    OrderID,
    OrderDate,
    ProductID,
    Sales,

    AVG(COALESCE(Sales, 0)) OVER() AS Average_Total_Sales,

    AVG(COALESCE(Sales, 0)) OVER
    (
        PARTITION BY ProductID
    ) AS Average_Sales_By_Product

FROM Sales.Orders;

-----------------------------------------------------------
-- Q2. Display each customer along with:
-- 1. The overall average customer score.
-- 2. The average score for each customer.
-----------------------------------------------------------
SELECT
    CustomerID,
    COALESCE(LastName, 'Unknown') AS LastName,
    COALESCE(Score, 0) AS Score,

    AVG(COALESCE(Score, 0)) OVER() AS Average_Score,

    AVG(COALESCE(Score, 0)) OVER
    (
        PARTITION BY CustomerID
    ) AS Average_Score_By_Customer

FROM Sales.Customers;

-----------------------------------------------------------
-- Q3. Retrieve all orders where the sales are
-- greater than the average sales.
-----------------------------------------------------------
SELECT
    *
FROM
(
    SELECT
        OrderID,
        OrderDate,
        Sales,

        AVG(COALESCE(Sales, 0)) OVER() AS Average_Sales

    FROM Sales.Orders

) AS OrderSales

WHERE Sales > Average_Sales;

-----------------------------------------------------------
-- Q4. Calculate the moving average of sales
-- for each product over time.
-----------------------------------------------------------
SELECT
    OrderID,
    ProductID,
    OrderDate,
    Sales,

    AVG(Sales) OVER
    (
        PARTITION BY ProductID
    ) AS Average_Sales,

    AVG(Sales) OVER
    (
        PARTITION BY ProductID
        ORDER BY OrderDate
    ) AS Moving_Average

FROM Sales.Orders;

-----------------------------------------------------------
-- Concepts Covered
-----------------------------------------------------------
-- ✓ AVG()
-- ✓ COALESCE()
-- ✓ Window Functions
-- ✓ OVER()
-- ✓ PARTITION BY
-- ✓ ORDER BY
-- ✓ Moving Average
-- ✓ Subqueries