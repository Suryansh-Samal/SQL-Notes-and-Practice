/*
===========================================================
Topic       : FORMAT()
Database    : MyDatabase
Description : Practice formatting date values using the
              FORMAT() function.
Author      : Suryansh
===========================================================
*/

USE MyDatabase;

-----------------------------------------------------------
-- Q1. Display dates in different formats using FORMAT()
-----------------------------------------------------------
SELECT
    OrderID,
    CreationTime,

    -- Month Formats
    FORMAT(CreationTime, 'M')    AS Month_Number,
    FORMAT(CreationTime, 'MM')   AS Month_Number_Leading_Zero,
    FORMAT(CreationTime, 'MMM')  AS Month_Short_Name,
    FORMAT(CreationTime, 'MMMM') AS Month_Full_Name,

    -- Day Formats
    FORMAT(CreationTime, 'd')    AS Day_Number,
    FORMAT(CreationTime, 'dd')   AS Day_Number_Leading_Zero,
    FORMAT(CreationTime, 'ddd')  AS Day_Short_Name,
    FORMAT(CreationTime, 'dddd') AS Day_Full_Name,

    -- Year Formats
    FORMAT(CreationTime, 'yy')   AS Two_Digit_Year,
    FORMAT(CreationTime, 'yyy')  AS Three_Digit_Year,
    FORMAT(CreationTime, 'yyyy') AS Four_Digit_Year

FROM Sales.Orders
ORDER BY CreationTime;

-----------------------------------------------------------
-- Concepts Covered
-----------------------------------------------------------
-- ✓ FORMAT()
-- ✓ Month Formatting
-- ✓ Day Formatting
-- ✓ Year Formatting
-- ✓ Date Formatting