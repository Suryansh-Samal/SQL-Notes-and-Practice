/*
============================================================
Topic      : Where Statement
Database   : MyDatabase
Description: Introduction to filtering data using WHERE clause.
Author     : Suryansh
============================================================
*/

-- Select the database
USE MyDatabase;

------------------------------------------------------------------------------------
-- Q1. Display all records from the Customers table where score is not equal to 0
------------------------------------------------------------------------------------
SELECT *
FROM Customers
WHERE score != 0;

