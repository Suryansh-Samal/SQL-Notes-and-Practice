/*
===========================================================
Topic       : NOT EXISTS
Database    : SalesDB
Description : Practice using the NOT EXISTS operator to
              retrieve rows that do not have matching
              records in a related table.
Author      : Suryansh
===========================================================
*/

USE SalesDB;

-----------------------------------------------------------
-- Q1. Display all orders placed by
-- customers who are not from Germany.
-----------------------------------------------------------
SELECT
    *
FROM Sales.Orders AS O

WHERE NOT EXISTS
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
-- ✓ NOT EXISTS
-- ✓ Correlated Subqueries
-- ✓ WHERE
-- ✓ Filtering Rows
-- ✓ Relationship Checks