CREATE PROCEDURE dbo.usp_TransformDataFromStagingToDbo
AS
BEGIN


    -- Customer table


    INSERT INTO dbo.Customer ([Customer ID], Name, Email, Phone, City, Age, Gender, [Date of Birth], [Registration Date])
    SELECT [Customer ID], Name, Email,[Phone Number], City, Age, Gender, [Date of Birth], [Registration Date]
    FROM stg.customer_data 

    -- Product table
    INSERT INTO dbo.Product ([Product ID], Category, Brand, Model, Weight, Price, [Serial Number], Stock, [Warranty (months)])
    (SELECT [Product ID], Category, Brand, Model, Weight, Price, [Serial Number], Stock, [Warranty (months)]
    FROM stg.product_data)

    -- Campaign table
    INSERT INTO dbo.Campaign ([Campaign ID], [Campaign Name], [Start Date], [End Date], Budget, Channel, Reach, Impressions, [Conversion Rate])
    (SELECT [Campaign ID], [Campaign Name], [Start Date], [End Date], Budget, Channel, Reach, Impressions, [Conversion Rate]
    FROM stg.campaign_data)

    -- Sales table
    INSERT INTO dbo.Sales ([Order ID], [Customer ID], [Order Date], [Product ID], Quantity, [Unit Price], [Total Amount], [Payment Method], [Order Status])
    (SELECT [Order ID], [Customer ID], [Order Date], [Product ID], Quantity, [Unit Price], [Total Amount], [Payment Method], [Order Status]
    FROM stg.sales_data)

    -- Lead table
    INSERT INTO dbo.Lead ([Lead ID], Source, [Lead Date], Status, Score, [Last Contact Date], [Converted Customer ID])
    (SELECT [Lead ID], Source, [Lead Date], Status, Score, [Last Contact Date], [Converted Customer ID]
    FROM stg.lead_data)

    -- Feedback table
    INSERT INTO dbo.Feedback ([Feedback ID], [Customer ID], [Feedback Date], [Feedback Type], Description, Rating)
    (SELECT [Feedback ID], [Customer ID], [Feedback Date], [Feedback Type], Description, Rating
    FROM stg.feedback_data)

    -- Website Traffic table
    INSERT INTO dbo.WebsiteTraffic ([Date], Page, Visitors, [Time Spent (seconds)], [Bounce Rate (%)], [Conversion Rate (%)])
    (SELECT [Date], Page, Visitors, [Time Spent (seconds)], [Bounce Rate (%)], [Conversion Rate (%)]
    FROM stg.website_traffic_data)

    -- Email Marketing table
    INSERT INTO dbo.EmailMarketing ([Date], Subject, [Recipient Email], [Open Rate (%)], [Click Rate (%)], [Conversion Rate (%)])
    (SELECT [Date], Subject, [Recipient Email], [Open Rate (%)], [Click Rate (%)], [Conversion Rate (%)]
    FROM stg.email_marketing_data)

    -- Social Media table
    INSERT INTO dbo.SocialMedia ([Date], Platform, Post, Reach, Likes, Shares, [Engagement Rate (%)])
    (SELECT [Date], Platform, Post, Reach, Likes, Shares, [Engagement Rate (%)]
    FROM stg.social_media_data)

    -- Competitor table
    INSERT INTO dbo.Competitor ([Competitor Name], [Product Name], Price, Rating, [Customer Satisfaction])
    (SELECT [Competitor Name], [Product Name], Price, Rating, [Customer Satisfaction]
    FROM stg.competitor_data)
END;
