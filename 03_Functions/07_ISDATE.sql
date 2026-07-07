/*
===========================================================
Topic       : ISDATE()
Database    : MyDatabase
Description : Practice validating date values using the
              ISDATE() function and converting valid dates
              using CASE and CAST().
Author      : Suryansh
===========================================================
*/

USE MyDatabase;

-----------------------------------------------------------
-- Q1. Validate date values using ISDATE().
-- Convert valid dates to DATE and replace
-- invalid dates with a default value.
-----------------------------------------------------------
SELECT
    OrderDate,

    -- Check whether the value is a valid date
    ISDATE(OrderDate) AS Check_Validity,

    -- Convert valid dates, otherwise return a default date
    CASE
        WHEN ISDATE(OrderDate) = 1
            THEN CAST(OrderDate AS DATE)
        ELSE
            '9999-01-01'
    END AS New_Order_Date

FROM
(
    SELECT '2025-08-20' AS OrderDate
    UNION
    SELECT '2025-08-23'
    UNION
    SELECT '2025-08-24'
    UNION
    SELECT '2025-08'
) AS T;

-----------------------------------------------------------
-- Concepts Covered
-----------------------------------------------------------
-- ✓ ISDATE()
-- ✓ CASE Expression
-- ✓ CASE WHEN
-- ✓ CAST()
-- ✓ Date Validation
-- ✓ Handling Invalid Dates