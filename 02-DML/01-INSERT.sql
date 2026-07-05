/*
===========================================================
Topic       : INSERT Statement
Database    : MyDatabase
Description : Insert a new record into a table.
Author      : Suryansh Samal
===========================================================
*/

USE MyDatabase;

-----------------------------------------------------------
-- View existing records
-----------------------------------------------------------
SELECT *
FROM Customers;

-----------------------------------------------------------
-- Q1. Insert a new customer
-----------------------------------------------------------
INSERT INTO Customers (id, first_name, country, score)
VALUES (6, 'Suryansh', 'Czechia', 950);

-----------------------------------------------------------
-- Verify the inserted record
-----------------------------------------------------------
SELECT *
FROM Customers;