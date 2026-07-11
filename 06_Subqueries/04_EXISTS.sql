/*
===========================================================
Topic       : EXISTS
Database    : SalesDB
Description : Practice using the EXISTS operator to
              determine whether a related record exists
              in a subquery.
Author      : Suryansh
===========================================================
*/

USE SalesDB;

-----------------------------------------------------------
-- Q1. Display all orders placed by
-- customers from Germany.
-----------------------------------------------------------
SELECT
    *
FROM Sales.Orders AS O

WHERE EXISTS
(
    SELECT
        1
    FROM Sales.Customers AS C
    WHERE C.Country = 'Germany'
      AND O.CustomerID = C.CustomerID
);

-----------------------------------------------------------
-- Concepts Covered
-----------------------------------------------------------
-- ✓ EXISTS
-- ✓ Correlated Subqueries
-- ✓ WHERE
-- ✓ Filtering Rows
-- ✓ Relationship Checks