CREATE PROCEDURE usp_CopyDataFromStagingToOperational
AS
BEGIN
    -- Copy data from Accounts staging table to dbo table
    INSERT INTO dbo.accounts (
        [Account ID], 
        [Account Name], 
        [Account Type]
    )
    SELECT 
        [Account ID], 
        [Account Name], 
        [Account Type]
    FROM stg.accounts;

    -- Copy data from Customers staging table to dbo table
    INSERT INTO dbo.customers (
        [Customer ID], 
        [Customer Name], 
        [Email], 
        [Phone], 
        [Address]
    )
    SELECT 
        [Customer ID], 
        [Customer Name], 
        [Email], 
        [Phone], 
        [Address]
    FROM stg.customers;

    -- Copy data from Employees staging table to dbo table
    INSERT INTO dbo.employees (
        [Employee_ID], 
        [Employee_Name], 
        [Department], 
        [Position], 
        [Hire_Date], 
        [Salary]
    )
    SELECT 
        [Employee ID], 
        [Employee Name], 
        [Department], 
        [Position], 
        [Hire Date], 
        [Salary]
    FROM stg.employees;

    -- Copy data from Vendors staging table to dbo table
    INSERT INTO dbo.vendors (
        [Vendor ID], 
        [Vendor Name], 
        [Email], 
        [Phone], 
        [Address]
    )
    SELECT 
        [Vendor ID], 
        [Vendor Name], 
        [Email], 
        [Phone], 
        [Address]
    FROM stg.vendors;

    -- Copy data from Transactions staging table to dbo table
    INSERT INTO dbo.transactions (
        [Transaction ID], 
        [Date], 
        [Account ID], 
        [Transaction Type], 
        [Amount], 
        [Customer ID], 
        [Employee ID], 
        [Vendor ID]
    )
    SELECT 
        [Transaction ID], 
        [Date], 
        [Account ID], 
        [Transaction Type], 
        [Amount], 
        [Customer ID], 
        [Employee ID], 
        [Vendor ID]
    FROM stg.transactions;

    -- Copy data from Income staging table to dbo table
    INSERT INTO dbo.income (
        [Income ID], 
        [Date], 
        [Account ID], 
        [Amount]
    )
    SELECT 
        [Income ID], 
        [Date], 
        [Account ID], 
        [Amount]
    FROM stg.income;

    -- Copy data from Expenses staging table to dbo table
    INSERT INTO dbo.expenses (
        [Expense ID], 
        [Date], 
        [Account ID], 
        [Amount], 
        [Vendor ID]
    )
    SELECT 
        [Expense ID], 
        [Date], 
        [Account ID], 
        [Amount], 
        [Vendor ID]
    FROM stg.expenses;
END;
