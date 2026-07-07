/*
===========================================================
Topic       : CONVERT()
Database    : MyDatabase
Description : Practice converting data types and formatting
              date and time values using the CONVERT()
              function.
Author      : Suryansh
===========================================================
*/

USE MyDatabase;

-----------------------------------------------------------
-- Q1. Convert data types and format date values
-- using the CONVERT() function.
-----------------------------------------------------------
SELECT
    CreationTime,

    -- Convert DATETIME2 to DATE
    CONVERT(DATE, CreationTime) AS DateTime2_To_Date,

    -- Convert DATETIME2 to VARCHAR using U.S. standard format
    CONVERT(VARCHAR, CreationTime, 32) AS USA_Standard_Format,

    -- Convert DATETIME2 to VARCHAR using European standard format
    CONVERT(VARCHAR, CreationTime, 34) AS Europe_Standard_Format

FROM Sales.Orders;

-----------------------------------------------------------
-- Concepts Covered
-----------------------------------------------------------
-- ✓ CONVERT()
-- ✓ Data Type Conversion
-- ✓ Date Formatting
-- ✓ DATETIME2 to DATE
-- ✓ DATETIME2 to VARCHAR
-- ✓ Style Codes