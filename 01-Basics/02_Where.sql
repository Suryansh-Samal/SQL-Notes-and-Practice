/*
===========================================================
Topic       : WHERE Clause
Database    : SalesDB
Description : Practice filtering records using the WHERE
              clause with comparison, logical, pattern
              matching, NULL, and range operators.
Author      : Suryansh
===========================================================
*/

USE SalesDB;

-----------------------------------------------------------
-- Q1. Show all orders placed by Customer ID 1.
-----------------------------------------------------------
SELECT
    *
FROM Sales.Orders
WHERE CustomerID = 1;

-----------------------------------------------------------
-- Q2. Show all orders with sales greater than 500.
-----------------------------------------------------------
SELECT
    *
FROM Sales.Orders
WHERE Sales > 500;

-----------------------------------------------------------
-- Q3. Show all customers from Germany.
-----------------------------------------------------------
SELECT
    *
FROM Sales.Customers
WHERE Country = 'Germany';

-----------------------------------------------------------
-- Q4. Show customers who are NOT from Germany.
-----------------------------------------------------------
SELECT
    *
FROM Sales.Customers
WHERE Country <> 'Germany';

-----------------------------------------------------------
-- Q5. Show products with prices between 100 and 500.
-----------------------------------------------------------
SELECT
    *
FROM Sales.Products
WHERE Price BETWEEN 100 AND 500;

-----------------------------------------------------------
-- Q6. Show customers from Germany or the USA.
-----------------------------------------------------------
SELECT
    *
FROM Sales.Customers
WHERE Country IN ('Germany', 'USA');

-----------------------------------------------------------
-- Concepts Covered
-----------------------------------------------------------
-- ✓ WHERE
-- ✓ Comparison Operators (=, >, <, >=, <=, <>)
-- ✓ BETWEEN
-- ✓ IN
