/*
============================================================
Topic      : SELECT Statement
Database   : MyDatabase
Description: Introduction to retrieving data using SELECT.
Author     : Suryansh
============================================================
*/

-- Select the database
USE MyDatabase;

------------------------------------------------------------
-- Q1. Display all records from the Customers table
------------------------------------------------------------
SELECT *
FROM Customers;

------------------------------------------------------------
-- Q2. Display all records from the Orders table
------------------------------------------------------------
SELECT *
FROM Orders;

------------------------------------------------------------
-- Q3. Display only the first name, country, and score
------------------------------------------------------------
SELECT
    first_name,
    country,
    score
FROM Customers;