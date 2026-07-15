/*
===========================================================
Topic       : Stored Procedures
Database    : SalesDB
Description : Practice creating, executing, altering,
              and dropping stored procedures. Learn how
              to use parameters, variables, error handling,
              and conditional logic inside procedures.
Author      : Suryansh
===========================================================
*/

USE SalesDB;

-----------------------------------------------------------
-- Q1. Find the total number of customers and
-- average score for customers in the USA.
-----------------------------------------------------------

SELECT

    COUNT(*) AS TotalCustomersUSA,

    AVG(Score) AS AverageScore

FROM Sales.Customers

WHERE Country = 'USA';

-----------------------------------------------------------
-- Q2. Create a stored procedure to return the
-- customer summary for USA.
-----------------------------------------------------------

CREATE PROCEDURE GetCustomerSummary
AS
BEGIN

    SELECT

        COUNT(*) AS TotalCustomersUSA,

        AVG(Score) AS AverageScore

    FROM Sales.Customers

    WHERE Country = 'USA';

END;

-----------------------------------------------------------
-- Q3. Execute the stored procedure.
-----------------------------------------------------------

EXEC GetCustomerSummary;

-----------------------------------------------------------
-- Q4. Alter the stored procedure by adding a
-- country parameter with a default value.
-----------------------------------------------------------

ALTER PROCEDURE GetCustomerSummary

    @Country NVARCHAR(50) = 'USA'

AS

BEGIN

    SELECT

        COUNT(*) AS TotalCustomers,

        AVG(Score) AS AverageScore

    FROM Sales.Customers

    WHERE Country = @Country;

    SELECT

        COUNT(*) AS TotalOrders,

        SUM(Sales) AS TotalSales

    FROM Sales.Orders AS O

    LEFT JOIN Sales.Customers AS C

        ON C.CustomerID = O.CustomerID

    WHERE C.Country = @Country;

END;

-----------------------------------------------------------
-- Q5. Execute the stored procedure using
-- different parameter values.
-----------------------------------------------------------

EXEC GetCustomerSummary @Country = 'Germany';

EXEC GetCustomerSummary @Country = 'USA';

EXEC GetCustomerSummary;

-----------------------------------------------------------
-- Q6. Drop a stored procedure.
-----------------------------------------------------------

DROP PROCEDURE GetCustomerSummaryGermany;

-----------------------------------------------------------
-- Q7. Enhance the stored procedure using
-- variables, conditional logic and
-- error handling.
-----------------------------------------------------------

ALTER PROCEDURE GetCustomerSummary

    @Country NVARCHAR(50) = 'USA'

AS

BEGIN

    BEGIN TRY

        DECLARE

            @TotalCustomers INT,

            @AvgScore FLOAT;

        ---------------------------------------------------
        -- Step 1 : Prepare and Clean Data
        ---------------------------------------------------

        IF EXISTS
        (
            SELECT 1

            FROM Sales.Customers

            WHERE Score IS NULL

            AND Country = @Country
        )

        BEGIN

            PRINT('Updating NULL scores to 0');

            UPDATE Sales.Customers

            SET Score = 0

            WHERE Score IS NULL

            AND Country = @Country;

        END

        ELSE

        BEGIN

            PRINT('No NULL scores found.');

        END;

        ---------------------------------------------------
        -- Step 2 : Generate Customer Summary
        ---------------------------------------------------

        SELECT

            @TotalCustomers = COUNT(*),

            @AvgScore = AVG(Score)

        FROM Sales.Customers

        WHERE Country = @Country;

        PRINT('Total Customers From '
            + @Country
            + ': '
            + CAST(@TotalCustomers AS NVARCHAR));

        PRINT('Average Score From '
            + @Country
            + ': '
            + CAST(@AvgScore AS NVARCHAR));

        ---------------------------------------------------
        -- Step 3 : Generate Order Summary
        ---------------------------------------------------

        SELECT

            COUNT(*) AS TotalOrders,

            SUM(Sales) AS TotalSales

        FROM Sales.Orders AS O

        LEFT JOIN Sales.Customers AS C

            ON C.CustomerID = O.CustomerID

        WHERE C.Country = @Country;

    END TRY

    BEGIN CATCH

        PRINT('An error occurred.');

        PRINT('Error Message : ' + ERROR_MESSAGE());

        PRINT('Error Number  : '
            + CAST(ERROR_NUMBER() AS NVARCHAR));

        PRINT('Error Line    : '
            + CAST(ERROR_LINE() AS NVARCHAR));

        PRINT('Error Procedure : '
            + ERROR_PROCEDURE());

    END CATCH

END;

GO

-----------------------------------------------------------
-- Q8. Execute the enhanced stored procedure.
-----------------------------------------------------------

EXEC GetCustomerSummary @Country = 'Germany';

-----------------------------------------------------------
-- Concepts Covered
-----------------------------------------------------------
-- ✓ CREATE PROCEDURE
-- ✓ ALTER PROCEDURE
-- ✓ DROP PROCEDURE
-- ✓ EXEC
-- ✓ Parameters
-- ✓ Default Parameters
-- ✓ Variables
-- ✓ DECLARE
-- ✓ IF EXISTS
-- ✓ UPDATE
-- ✓ PRINT
-- ✓ TRY...CATCH
-- ✓ Error Handling
-- ✓ Aggregate Functions
-- ✓ LEFT JOIN