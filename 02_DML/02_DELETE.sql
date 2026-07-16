/*
===========================================================
Topic       : DELETE
Database    : SalesDB
Description : Practice deleting records from a table using
              the DELETE statement with a WHERE condition.
Author      : Suryansh
===========================================================
*/

USE SalesDB;

-----------------------------------------------------------
-- Q1. Delete customers whose score is NULL.
-----------------------------------------------------------

DELETE FROM Sales.Customers

WHERE Score IS NULL;

-----------------------------------------------------------
-- Concepts Covered
-----------------------------------------------------------
-- ✓ DELETE
-- ✓ WHERE
-- ✓ IS NULL
-- ✓ NULL Handling