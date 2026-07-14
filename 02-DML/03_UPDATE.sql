/*
===========================================================
Topic       : UPDATE
Database    : SalesDB
Description : Practice updating records in a table using
              the UPDATE statement with a WHERE condition.
Author      : Suryansh
===========================================================
*/

USE SalesDB;

-----------------------------------------------------------
-- Q1. Update the last name of employees whose
-- last name is NULL.
-----------------------------------------------------------

UPDATE Sales.Employees

SET LastName = 'NA'

WHERE LastName IS NULL;

-----------------------------------------------------------
-- Concepts Covered
-----------------------------------------------------------
-- ✓ UPDATE
-- ✓ SET
-- ✓ WHERE
-- ✓ IS NULL
-- ✓ Data Modification