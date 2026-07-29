/*
===============================================================================
Topic         : MERGE Statement
Database      : SQL Server (SSMS)
Description   : Update existing records in the target table using the MERGE
                statement. This example updates employee salaries when matching
                Employee IDs are found in the source table.
Author        : Suryansh
===============================================================================
*/

-- ============================================================================
-- Create Target Table
-- ============================================================================

CREATE TABLE Employees
(
    EmpID INT PRIMARY KEY,
    Name VARCHAR(50),
    Salary INT
);

-- ============================================================================
-- Insert Sample Data into Target Table
-- ============================================================================

INSERT INTO Employees
VALUES
(1, 'John', 50000),
(2, 'Alice', 60000),
(3, 'Bob', 55000);

-- ============================================================================
-- Create Source Table
-- ============================================================================

CREATE TABLE EmployeeUpdates
(
    EmpID INT,
    Name VARCHAR(50),
    Salary INT
);

-- ============================================================================
-- Insert Sample Data into Source Table
-- ============================================================================

INSERT INTO EmployeeUpdates
VALUES
(2, 'Alice', 65000),
(3, 'Bob', 58000);

-- ============================================================================
-- MERGE Statement
-- Updates the salary of employees that exist in both tables.
-- ============================================================================

MERGE Employees AS Target
USING EmployeeUpdates AS Source
ON Target.EmpID = Source.EmpID

WHEN MATCHED THEN
UPDATE
SET
    Target.Salary = Source.Salary;

-- ============================================================================
-- View Final Result
-- ============================================================================

SELECT *
FROM Employees;
