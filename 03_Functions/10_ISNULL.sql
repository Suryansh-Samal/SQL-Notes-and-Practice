/*
===========================================================
Topic       : ISNULL()
Database    : SalesDB
Description : Practice using the ISNULL() function to
              replace NULL values with a specified value.
Author      : Suryansh
===========================================================
*/

USE SalesDB;

-----------------------------------------------------------
-- Q1. Show the first and last name of all employees.
-- Replace NULL values with 'Unavailable'.
-----------------------------------------------------------

SELECT

    ISNULL(FirstName, 'Unavailable') AS FirstName,

    ISNULL(LastName, 'Unavailable') AS LastName

FROM Sales.Employees;

-----------------------------------------------------------
-- Concepts Covered
-----------------------------------------------------------
-- ✓ ISNULL()
-- ✓ NULL Handling
-- ✓ String Replacement
-- ✓ SELECT
-- ✓ Column Aliases