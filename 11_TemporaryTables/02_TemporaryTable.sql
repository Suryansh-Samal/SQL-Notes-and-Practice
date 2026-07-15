/*
===========================================================
Topic       : Temporary Tables
Database    : SalesDB
Description : Practice creating, modifying, and storing
              data using temporary tables in SQL Server.
Author      : Suryansh
===========================================================
*/

USE SalesDB;

-----------------------------------------------------------
-- Q1. Create a temporary table containing
-- the order month number and month name.
-----------------------------------------------------------

SELECT

    MONTH(OrderDate) AS Month,

    DATENAME(MONTH, OrderDate) AS MonthName

INTO #TempOrderMonths

FROM Sales.Orders

GROUP BY

    MONTH(OrderDate),

    DATENAME(MONTH, OrderDate);

-----------------------------------------------------------
-- Q2. Display the contents of the
-- temporary table.
-----------------------------------------------------------

SELECT
    *
FROM #TempOrderMonths;

-----------------------------------------------------------
-- Q3. Delete the record for January
-- from the temporary table.
-----------------------------------------------------------

DELETE FROM #TempOrderMonths

WHERE MonthName = 'January';

-----------------------------------------------------------
-- Q4. Store the contents of the
-- temporary table permanently in a
-- new table.
-----------------------------------------------------------

SELECT
    *
INTO Sales.NewTable

FROM #TempOrderMonths;

-----------------------------------------------------------
-- Concepts Covered
-----------------------------------------------------------
-- ✓ Temporary Tables
-- ✓ SELECT INTO
-- ✓ #Temp Tables
-- ✓ DELETE
-- ✓ GROUP BY
-- ✓ MONTH()
-- ✓ DATENAME()
-- ✓ Permanent Tables