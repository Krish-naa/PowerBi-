CREATE PROCEDURE dbo.usp_CreateFactAndDimensionTables
AS
BEGIN
    -- Create Customer Dimension Table
    CREATE TABLE dbo.Customer_Dim (
        CustomerID NVARCHAR(100) PRIMARY KEY,
        Name NVARCHAR(100),
        Email NVARCHAR(100),
        Phone NVARCHAR(30),
        City NVARCHAR(100),
        Age INT,
        Gender NVARCHAR(10),
        DateOfBirth DATE,
        RegistrationDate DATETIME
    );

    INSERT INTO dbo.Customer_Dim (CustomerID, Name, Email, Phone, City, Age, Gender, DateOfBirth, RegistrationDate)
    SELECT [Customer ID], Name, Email, Phone, City, Age, Gender, [Date Of Birth], [Registration Date]
    FROM dbo.Customer;

    -- Create Product Dimension Table
    CREATE TABLE dbo.Product_Dim (
        ProductID NVARCHAR(100) PRIMARY KEY,
        Category NVARCHAR(100),
        Brand NVARCHAR(100),
        Model NVARCHAR(100),
        Weight FLOAT,
        Price FLOAT,
        SerialNumber NVARCHAR(100),
        Stock INT,
        WarrantyMonths INT
    );

    INSERT INTO dbo.Product_Dim (ProductID, Category, Brand, Model, Weight, Price, SerialNumber, Stock, WarrantyMonths)
    SELECT [Product ID], Category, Brand, Model, Weight, Price, [Serial Number], Stock, [Warranty (Months)]
    FROM dbo.Product;

    -- Create Campaign Dimension Table
    CREATE TABLE dbo.Campaign_Dim (
        CampaignID NVARCHAR(100) PRIMARY KEY,
        CampaignName NVARCHAR(200),
        StartDate DATETIME,
        EndDate DATETIME,
        Budget FLOAT,
        Channel NVARCHAR(100),
        Reach INT,
        Impressions INT,
        ConversionRate FLOAT
    );

    INSERT INTO dbo.Campaign_Dim (CampaignID, CampaignName, StartDate, EndDate, Budget, Channel, Reach, Impressions, ConversionRate)
    SELECT [Campaign ID], [Campaign Name], [Start Date], [End Date], Budget, Channel, Reach, Impressions, [Conversion Rate]
    FROM dbo.Campaign;

    -- Create Sales Fact Table
    CREATE TABLE dbo.Sales_Fact (
        OrderID INT PRIMARY KEY,
        CustomerID NVARCHAR(100),
        OrderDate DATETIME,
        ProductID NVARCHAR(100),
        Quantity INT,
        UnitPrice FLOAT,
        TotalAmount FLOAT,
        PaymentMethod NVARCHAR(100),
        OrderStatus NVARCHAR(100)
    );

    INSERT INTO dbo.Sales_Fact (OrderID, CustomerID, OrderDate, ProductID, Quantity, UnitPrice, TotalAmount, PaymentMethod, OrderStatus)
    SELECT [Order ID], [Customer ID], [Order Date], [Product ID], Quantity, [Unit Price], [Total Amount], [Payment Method], [Order Status]
    FROM dbo.Sales;
END;
