/*
===========================================================
Topic       : COUNT()
Database    : SalesDB
Description : Practice using the COUNT() function as both
              an aggregate function and a window function.
              Includes duplicate detection using
              PARTITION BY.
Author      : Suryansh
===========================================================
*/

USE SalesDB;

-----------------------------------------------------------
-- Q1. Find the total number of orders.
-----------------------------------------------------------
SELECT
    COUNT(*) AS Total_Orders
FROM Sales.Orders;

-----------------------------------------------------------
-- Q2. Display each order along with the total number
-- of orders using a window function.
-----------------------------------------------------------
SELECT
    OrderID,
    OrderDate,
    COUNT(*) OVER() AS Total_Orders
FROM Sales.Orders;

-----------------------------------------------------------
-- Q3. Display each order along with:
-- 1. Total number of orders.
-- 2. Total number of orders placed by each customer.
-----------------------------------------------------------
SELECT
    CustomerID,
    OrderID,
    OrderDate,

    COUNT(*) OVER() AS Total_Orders,

    COUNT(*) OVER
    (
        PARTITION BY CustomerID
    ) AS Total_Orders_By_Customer

FROM Sales.Orders;

-----------------------------------------------------------
-- Q4. Display customer details along with:
-- 1. Total number of customers.
-- 2. Total number of non-NULL scores.
-----------------------------------------------------------
SELECT
    CustomerID,
    FirstName,
    LastName,
    Country,
    Score,

    COUNT(*) OVER() AS Total_Customers,

    COUNT(2) OVER() AS Total_Customers_Using_Constant,

    COUNT(Score) OVER() AS Total_Non_Null_Scores

FROM Sales.Customers;

-----------------------------------------------------------
-- Q5. Check for duplicate OrderID values
-- in the Orders table.
-----------------------------------------------------------
SELECT
    *
FROM
(
    SELECT
        OrderID,
        COUNT(*) OVER
        (
            PARTITION BY OrderID
        ) AS Duplicate_Count

    FROM Sales.Orders

) AS DuplicateOrders

WHERE Duplicate_Count > 1;

-----------------------------------------------------------
-- Q6. Check for duplicate OrderID values
-- in the OrdersArchive table.
-----------------------------------------------------------
SELECT
    *
FROM
(
    SELECT
        OrderID,
        COUNT(*) OVER
        (
            PARTITION BY OrderID
        ) AS Duplicate_Count

    FROM Sales.OrdersArchive

) AS DuplicateOrders

WHERE Duplicate_Count > 1;

-----------------------------------------------------------
-- Concepts Covered
-----------------------------------------------------------
-- ✓ COUNT()
-- ✓ COUNT(*)
-- ✓ COUNT(Column)
-- ✓ COUNT(Constant)
-- ✓ Window Functions
-- ✓ OVER()
-- ✓ PARTITION BY
-- ✓ Duplicate Detection
-- ✓ Aggregate Functions