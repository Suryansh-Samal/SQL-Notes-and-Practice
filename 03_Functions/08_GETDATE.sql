/*
===========================================================
Topic       : GETDATE()
Database    : SalesDB
Description : Practice retrieving the current system date
              and calculating employee age using the
              GETDATE() function.
Author      : Suryansh
===========================================================
*/

USE SalesDB;

-----------------------------------------------------------
-- Q1. Calculate the age of each employee.
-----------------------------------------------------------
SELECT
    FirstName,
    LastName,
    BirthDate,

    -- Calculate the employee's age based on the current date
    DATEDIFF(YEAR, BirthDate, GETDATE()) AS Age

FROM Sales.Employees;

-----------------------------------------------------------
-- Concepts Covered
-----------------------------------------------------------
-- ✓ GETDATE()
-- ✓ DATEDIFF()
-- ✓ Date Calculations
-- ✓ Current System Date