/*
===========================================================
Topic       : DATEADD()
Database    : MyDatabase
Description : Practice using the DATEADD() function to
              add or subtract days, months, and years.
Author      : Suryansh Samal
===========================================================
*/

USE MyDatabase;

-----------------------------------------------------------
-- Q1. Add or subtract time from the order date
-----------------------------------------------------------
SELECT
    OrderID,
    OrderDate,

    -- Subtract 10 days from the order date
    DATEADD(DAY, -10, OrderDate) AS Ten_Days_Before,

    -- Add 3 months to the order date
    DATEADD(MONTH, 3, OrderDate) AS Three_Months_Later,

    -- Add 2 years to the order date
    DATEADD(YEAR, 2, OrderDate) AS Two_Years_Later
FROM Sales.Orders;

-----------------------------------------------------------
-- Concepts Covered
-----------------------------------------------------------
-- ✓ DATEADD()
-- ✓ Adding Days
-- ✓ Adding Months
-- ✓ Adding Years
-- ✓ Subtracting Days

