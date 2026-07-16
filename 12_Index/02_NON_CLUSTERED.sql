/*
===========================================================
Topic       : Non-Clustered Index
Database    : SalesDB
Description : Practice creating and using non-clustered
              indexes to improve query performance.
              Learn about single-column indexes,
              composite indexes, and the left-most
              key principle.
Author      : Suryansh
===========================================================
*/

USE SalesDB;

-----------------------------------------------------------
-- Q1. Create a non-clustered index on LastName.
-----------------------------------------------------------

CREATE INDEX idx_DBCustomers_LastName

ON Sales.DBCustomers (LastName);

-----------------------------------------------------------
-- Q2. Create a non-clustered index on FirstName.
--
-- Note:
-- The NONCLUSTERED keyword is optional because
-- it is the default index type in SQL Server.
-----------------------------------------------------------

CREATE INDEX idx_DBCustomers_FirstName

ON Sales.DBCustomers (FirstName);

-----------------------------------------------------------
-- Q3. Create a composite non-clustered index
-- on Country and Score.
--
-- Note:
-- The order of columns in a composite index
-- is important and affects query performance.
-----------------------------------------------------------

CREATE INDEX idx_DBCustomers_CountryScore

ON Sales.DBCustomers
(
    Country,
    Score
);

-----------------------------------------------------------
-- Q4. Query that uses the composite index.
--
-- Since Country is the left-most column of the
-- composite index, SQL Server can utilize it.
-----------------------------------------------------------

SELECT
    *
FROM Sales.DBCustomers

WHERE Country = 'USA';

-----------------------------------------------------------
-- Q5. Query that cannot efficiently use the
-- composite index.
--
-- Since the query filters only by Score and
-- skips the left-most indexed column (Country),
-- the composite index is generally not used.
-----------------------------------------------------------

SELECT
    *
FROM Sales.DBCustomers

WHERE Score > 500;

-----------------------------------------------------------
-- Concepts Covered
-----------------------------------------------------------
-- ✓ Non-Clustered Index
-- ✓ CREATE INDEX
-- ✓ Composite Index
-- ✓ Single-Column Index
-- ✓ Left-Most Key Principle
-- ✓ Query Optimization
-- ✓ Index Performance