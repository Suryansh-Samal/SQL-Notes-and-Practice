/*
===========================================================
Topic       : CAST()
Database    : MyDatabase
Description : Practice converting data from one data type
              to another using the CAST() function.
Author      : Suryansh 
===========================================================
*/

USE MyDatabase;

-----------------------------------------------------------
-- Q1. Convert different data types using CAST()
-----------------------------------------------------------
SELECT

    -- Convert a string to an integer
    CAST('123' AS INT) AS String_To_Int,

    -- Convert an integer to a string
    CAST(124 AS VARCHAR(10)) AS Int_To_String,

    -- Convert a string to a DATE
    CAST('2025-08-25' AS DATE) AS String_To_Date,

    -- Convert a string to a DATETIME2
    CAST('2025-08-20' AS DATETIME2) AS String_To_DateTime2,

    -- Original DATETIME2 value
    CreationTime,

    -- Convert DATETIME2 to DATE
    CAST(CreationTime AS DATE) AS DateTime2_To_Date

FROM Sales.Orders;

-----------------------------------------------------------
-- Concepts Covered
-----------------------------------------------------------
-- ✓ CAST()
-- ✓ String to Integer
-- ✓ Integer to String
-- ✓ String to DATE
-- ✓ String to DATETIME2
-- ✓ DATETIME2 to DATE