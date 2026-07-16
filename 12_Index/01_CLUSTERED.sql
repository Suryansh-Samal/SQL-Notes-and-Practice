/*
===========================================================
Topic       : Clustered Index
Database    : SalesDB
Description : Practice creating, using, and dropping
              clustered indexes to improve query
              performance.
Author      : Suryansh
===========================================================
*/

USE SalesDB;

-----------------------------------------------------------
-- Q1. Create a copy of the Customers table.
-----------------------------------------------------------

SELECT
    *
INTO Sales.DBCustomers
FROM Sales.Customers;

-----------------------------------------------------------
-- Q2. Create a clustered index on CustomerID.
--
-- Note:
-- A table can have only ONE clustered index because
-- the data rows can be physically sorted in only
-- one order.
-----------------------------------------------------------

CREATE CLUSTERED INDEX idx_DBCustomers_CustomerID

ON Sales.DBCustomers (CustomerID);

-----------------------------------------------------------
-- Q3. Drop the clustered index.
-----------------------------------------------------------

DROP INDEX idx_DBCustomers_CustomerID

ON Sales.DBCustomers;

-----------------------------------------------------------
-- Concepts Covered
-----------------------------------------------------------
-- ✓ Clustered Index
-- ✓ CREATE CLUSTERED INDEX
-- ✓ DROP INDEX
-- ✓ SELECT INTO
-- ✓ Physical Data Storage
-- ✓ Query Performance
-- ✓ Primary Key Indexing