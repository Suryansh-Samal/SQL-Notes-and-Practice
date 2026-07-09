/*
===========================================================
Topic       : GROUP BY
Database    : MyDatabase
Description : Practice grouping data using the GROUP BY
              clause along with aggregate functions,
              filtering grouped results using HAVING,
              and summarizing data.
Author      : Suryansh
===========================================================
*/

USE MyDatabase;

-----------------------------------------------------------
-- Q1. Calculate the average customer score
-- for each country where the average score
-- is greater than 430.
-----------------------------------------------------------
SELECT
    Country,
    AVG(Score) AS Average_Score
FROM Customers
WHERE Score <> 0
GROUP BY Country
HAVING AVG(Score) > 430;

-----------------------------------------------------------
-- Concepts Covered
-----------------------------------------------------------
-- ✓ GROUP BY
-- ✓ HAVING
-- ✓ WHERE
-- ✓ AVG()
-- ✓ Aggregate Functions