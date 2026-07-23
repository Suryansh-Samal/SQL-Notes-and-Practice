/*
===========================================================
Topic       : COALESCE()
Database    : SalesDB
Description : Practice handling NULL values using the
              COALESCE() function in SQL Server.
Author      : Suryansh
===========================================================
*/

USE SalesDB;

-----------------------------------------------------------
-- Q1. Calculate the average customer score by
-- replacing NULL scores with 0.
-----------------------------------------------------------

SELECT

    CustomerID,

    Score,

    AVG(COALESCE(Score, 0)) OVER() AS Avg_Score

FROM Sales.Customers;

-----------------------------------------------------------
-- Q2. Display the full name of each customer.
-- If LastName is NULL, replace it with a blank
-- space. Also award each customer 10 bonus
-- points, treating NULL scores as 0.
-----------------------------------------------------------

SELECT

    FirstName,

    LastName AS Last_Name,

    CONCAT
    (
        FirstName,
        ' ',
        COALESCE(LastName, ' ')
    ) AS Full_Name,

    Score,

    COALESCE(Score, 0) + 10 AS Bonus_Points

FROM Sales.Customers;

-----------------------------------------------------------
-- Concepts Covered
-----------------------------------------------------------
-- ✓ COALESCE()
-- ✓ NULL Handling
-- ✓ CONCAT()
-- ✓ Window Functions
-- ✓ AVG() OVER()
-- ✓ Calculated Columns
-- ✓ String Functions