/*
===========================================================
Topic       : Basic Aggregate Functions
Database    : SalesDB
Description : Practice using aggregate functions to
              calculate totals, averages, maximums,
              and minimums.
Author      : Suryansh
===========================================================
*/

USE SalesDB;

-----------------------------------------------------------
-- Q1. Find the total number of orders.
-----------------------------------------------------------
SELECT
    COUNT(*) AS Total_Orders
FROM Orders;

-----------------------------------------------------------
-- Q2. Calculate the total sales.
-----------------------------------------------------------
SELECT
    SUM(Sales) AS Total_Sales
FROM Orders;

-----------------------------------------------------------
-- Q3. Calculate the average sales.
-----------------------------------------------------------
SELECT
    AVG(Sales) AS Average_Sales
FROM Orders;

-----------------------------------------------------------
-- Q4. Find the highest sales value.
-----------------------------------------------------------
SELECT
    MAX(Sales) AS Highest_Sales
FROM Orders;

-----------------------------------------------------------
-- Q5. Find the lowest sales value.
-----------------------------------------------------------
SELECT
    MIN(Sales) AS Lowest_Sales
FROM Orders;

-----------------------------------------------------------
-- Concepts Covered
-----------------------------------------------------------
-- ✓ Aggregate Functions
-- ✓ COUNT()
-- ✓ SUM()
-- ✓ AVG()
-- ✓ MAX()
-- ✓ MIN()