/*
===========================================================
Topic       : SUM()
Database    : SalesDB
Description : Practice using the SUM() function as both
              an aggregate function and a window function
              to calculate total sales, product-wise sales,
              and sales percentages.
Author      : Suryansh
===========================================================
*/

USE SalesDB;

-----------------------------------------------------------
-- Q1. Display each order along with the total sales
-- across all orders.
-----------------------------------------------------------
SELECT
    OrderID,
    OrderDate,
    SUM(Sales) OVER() AS Total_Sales
FROM Sales.Orders;

-----------------------------------------------------------
-- Q2. Display each order along with:
-- 1. Total sales across all orders.
-- 2. Total sales for each product.
-----------------------------------------------------------
SELECT
    OrderID,
    ProductID,
    OrderDate,

    SUM(Sales) OVER() AS Total_Sales,

    SUM(Sales) OVER
    (
        PARTITION BY ProductID
    ) AS Total_Sales_By_Product

FROM Sales.Orders;

-----------------------------------------------------------
-- Q3. Calculate each product's contribution
-- to the overall sales.
-----------------------------------------------------------
SELECT
    OrderID,
    ProductID,

    SUM(Sales) OVER
    (
        PARTITION BY ProductID
    ) AS Product_Total_Sales,

    SUM(Sales) OVER() AS Overall_Total_Sales,

    ROUND
    (
        CAST
        (
            SUM(Sales) OVER (PARTITION BY ProductID)
            AS FLOAT
        )
        /
        SUM(Sales) OVER() * 100,
        2
    ) AS Sales_Percentage

FROM Sales.Orders;

-----------------------------------------------------------
-- Concepts Covered
-----------------------------------------------------------
-- ✓ SUM()
-- ✓ Aggregate Functions
-- ✓ Window Functions
-- ✓ OVER()
-- ✓ PARTITION BY
-- ✓ CAST()
-- ✓ ROUND()
-- ✓ Percentage Calculation