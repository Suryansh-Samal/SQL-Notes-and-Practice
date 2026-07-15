-- Step 1: Write a query
-- For US Customers find the total number of customers and the average score

Select 
 Count(*) TotalCustomersUSA,
 Avg(Score) AverageScore
from Sales.Customers
where Country = 'USA'

-- Step 2: Turning the query into a stored procedure
Create procedure GetCustomerSummary As
Begin
	Select 
 Count(*) TotalCustomersUSA,
 Avg(Score) AverageScore
from Sales.Customers
where Country = 'USA'
End;

-- Step 3: Execute the stored procedure
Exec GetCustomerSummary; -- displays the table content 

--Alter a stored procedure
Alter procedure getcustomersummary @country NVARCHAR(50) ='USA' --here USA is default value if nothing
As                                                              -- is given as a parameter
Begin 
Select 
	count(*) TotalCustomers,
	Avg(score) AverageScore
from sales.customers
where country = @country;

-- Find the total number of orders and total sales
Select
	count(*) TotalOrders,
	Sum(sales) TotalSales
from Sales.Orders o 
left join Sales.Customers c
on c.CustomerID = o.CustomerID
where Country = @country
end 

Exec getcustomersummary @country = 'Germany'
Exec getcustomersummary @country = 'USA'
Exec getcustomersummary -- here default will be USA

-- Drop a procedure
Drop Procedure GetCustomerSummaryGermany;

-- Adding variables

Alter procedure getcustomersummary @country NVARCHAR(50) ='USA' --here USA is default value if nothing
As                                                              -- is given as a parameter
Begin 
	Begin try
		Declare @TotalCustomers INT, @AvgScore Float;

		--=================================
		--Step 1:Prepare and Cleanup Data
		--==================================
		If exists(Select 1 from Sales.Customers where score is null and country = @country)
		Begin
			Print('Updating null scores to 0');
			Update Sales.Customers
			set score = 0
			where score is null and country = @country
		end

		else
		begin 
			Print('NO null scores');
		end;

		--===========================
		--Step 2:Generating Report
		--===========================
		--Calculate Total Customers and Average Score for specific Country
		Select 
			@TotalCustomers = count(*) ,
			@AvgScore= Avg(score)
		from sales.customers
		where country = @country;

		Print('Total Customers From ' + @Country + ':' + Cast(@TotalCustomers As Nvarchar));
		Print('Average Score From ' + @Country + ':' + Cast(@AvgScore as NVARCHAR));

		-- Find the total number of orders and total sales for specific country
		Select
			count(*) TotalOrders,
			Sum(sales) TotalSales
		from Sales.Orders o 
		left join Sales.Customers c
		on c.CustomerID = o.CustomerID
		where c.Country = @country;
	End try

	Begin Catch
		--===============
		--Error Handling
		--===============
		Print('An error occured');
		Print('Error message: ' + Error_Message());
		Print('Error number: ' + Cast(Error_number() As Nvarchar));
		Print('Error line: ' + Cast(Error_line() As Nvarchar));
		Print('Error Procedure: ' + Error_Procedure	());
	end catch
end 
Go

Exec getcustomersummary @Country = 'Germany'