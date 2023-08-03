CREATE PROCEDURE usp_CreateFactAndDimensionTablesAndLoadData
AS
BEGIN
    -- Create the Accounts dimension table
    CREATE TABLE dbo.dim_accounts (
        [Account ID] VARCHAR(4) PRIMARY KEY,
        [Account Name] VARCHAR(255),
        [Account Type] VARCHAR(10)
    );

    -- Populate the Accounts dimension table from the staging table
    INSERT INTO dbo.dim_accounts (
        [Account ID],
        [Account Name],
        [Account Type]
    )
    SELECT 
        [Account ID],
        [Account Name],
        [Account Type]
    FROM dbo.accounts;

    -- Create the Customers dimension table
    CREATE TABLE dbo.dim_customers (
        [Customer ID] VARCHAR(4) PRIMARY KEY,
        [Customer Name] VARCHAR(255),
        [Email] VARCHAR(255),
        [Phone] VARCHAR(25),
        [Address] TEXT
    );

    -- Populate the Customers dimension table from the staging table
    INSERT INTO dbo.dim_customers (
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
    FROM dbo.customers;

    -- Create the Employees dimension table
    CREATE TABLE dbo.dim_employees (
        [Employee ID] VARCHAR(4) PRIMARY KEY,
        [Employee Name] VARCHAR(255),
        [Department] VARCHAR(10),
        [Position] VARCHAR(20),
        [Hire Date] DATE,
        [Salary] FLOAT
    );

    -- Populate the Employees dimension table from the staging table
    INSERT INTO dbo.dim_employees (
        [Employee ID],
        [Employee Name],
        [Department],
        [Position],
        [Hire Date],
        [Salary]
    )
    SELECT 
        [Employee_ID],
        [Employee_Name],
        [Department],
        [Position],
        [Hire_Date],
        [Salary]
    FROM dbo.employees;

    -- Create the Vendors dimension table
    CREATE TABLE dbo.dim_vendors (
        [Vendor ID] VARCHAR(4) PRIMARY KEY,
        [Vendor Name] VARCHAR(255),
        [Email] VARCHAR(255),
        [Phone] VARCHAR(25),
        [Address] TEXT
    );

    -- Populate the Vendors dimension table from the staging table
    INSERT INTO dbo.dim_vendors (
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
    FROM dbo.vendors;

    -- Create the Transactions fact table
    CREATE TABLE dbo.fact_transactions (
        [Transaction ID] VARCHAR(4) PRIMARY KEY,
        [Date] DATE,
        [Account ID] VARCHAR(4),
        [Transaction Type] VARCHAR(20),
        [Amount] FLOAT,
        [Customer ID] VARCHAR(4),
        [Employee ID] VARCHAR(4),
        [Vendor ID] VARCHAR(4)
    );

    -- Populate the Transactions fact table from the staging table and join with the dimensions
    INSERT INTO dbo.fact_transactions (
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
    tr.[Transaction ID],
    tr.[Date],
    acc.[Account ID],
    tr.[Transaction Type],
    tr.[Amount],
    cus.[Customer ID],
    emp.[Employee ID],
    ven.[Vendor ID]
FROM dbo.transactions AS tr
LEFT JOIN dbo.dim_accounts AS acc ON tr.[Account ID] = acc.[Account ID]
LEFT JOIN dbo.dim_customers AS cus ON tr.[Customer ID] = cus.[Customer ID]
LEFT JOIN dbo.dim_employees AS emp ON tr.[Employee ID] = emp.[Employee ID]
LEFT JOIN dbo.dim_vendors AS ven ON tr.[Vendor ID] = ven.[Vendor ID];
end;