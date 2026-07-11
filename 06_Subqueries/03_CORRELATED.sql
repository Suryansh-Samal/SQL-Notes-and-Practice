/*
===========================================================
Topic       : Correlated Subqueries
Database    : SalesDB
Description : Practice using correlated subqueries that
              reference the outer query to retrieve
              related data for each row.
Author      : Suryansh
===========================================================
*/

USE SalesDB;

-----------------------------------------------------------
-- Q1. Display all customers along with
-- the total number of orders placed
-- by each customer.
-----------------------------------------------------------
SELECT
    C.CustomerID,
    C.FirstName,
    C.LastName,
    C.Country,

    (
        SELECT COUNT(*)
        FROM Sales.Orders AS O
        WHERE O.CustomerID = C.CustomerID
    ) AS Total_Orders

FROM Sales.Customers AS C;

-----------------------------------------------------------
-- Q2. Display each customer along with
-- their total sales amount.
-----------------------------------------------------------
SELECT
    C.CustomerID,
    C.FirstName,
    C.LastName,

    (
        SELECT SUM(O.Sales)
        FROM Sales.Orders AS O
        WHERE O.CustomerID = C.CustomerID
    ) AS Total_Sales

FROM Sales.Customers AS C;

-----------------------------------------------------------
-- Q3. Display each customer along with
-- the date of their most recent order.
-----------------------------------------------------------
SELECT
    C.CustomerID,
    C.FirstName,
    C.LastName,

    (
        SELECT MAX(O.OrderDate)
        FROM Sales.Orders AS O
        WHERE O.CustomerID = C.CustomerID
    ) AS Latest_Order_Date

FROM Sales.Customers AS C;

-----------------------------------------------------------
-- Concepts Covered
-----------------------------------------------------------
-- ✓ Correlated Subqueries
-- ✓ Aggregate Functions
-- ✓ COUNT()
-- ✓ SUM()
-- ✓ MAX()
-- ✓ WHERE
-- ✓ Outer Query References