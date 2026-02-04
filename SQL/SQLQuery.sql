/* =========================================
   Credit Card Project – SQL Server Script
   ========================================= */

------------------------------------------------
-- 0. Create & Use Database
------------------------------------------------
IF NOT EXISTS (SELECT 1 FROM sys.databases WHERE name = 'ccdb')
BEGIN
    CREATE DATABASE ccdb;
END
GO

USE ccdb;
GO

------------------------------------------------
-- 1. Create cc_detail Table
------------------------------------------------
IF OBJECT_ID('dbo.cc_detail', 'U') IS NOT NULL
    DROP TABLE dbo.cc_detail;
GO

CREATE TABLE dbo.cc_detail (
    Client_Num INT,
    Card_Category VARCHAR(20),
    Annual_Fees INT,
    Activation_30_Days INT,
    Customer_Acq_Cost INT,
    Week_Start_Date DATE,
    Week_Num VARCHAR(20),
    Qtr VARCHAR(10),
    current_year INT,
    Credit_Limit DECIMAL(10,2),
    Total_Revolving_Bal INT,
    Total_Trans_Amt INT,
    Total_Trans_Ct INT,
    Avg_Utilization_Ratio DECIMAL(10,3),
    Use_Chip VARCHAR(10),
    Exp_Type VARCHAR(50),
    Interest_Earned DECIMAL(10,3),
    Delinquent_Acc VARCHAR(5)
);
GO

------------------------------------------------
-- 2. Create cust_detail Table
------------------------------------------------
IF OBJECT_ID('dbo.cust_detail', 'U') IS NOT NULL
    DROP TABLE dbo.cust_detail;
GO

CREATE TABLE dbo.cust_detail (
    Client_Num INT,
    Customer_Age INT,
    Gender VARCHAR(5),
    Dependent_Count INT,
    Education_Level VARCHAR(50),
    Marital_Status VARCHAR(20),
    State_cd VARCHAR(50),
    Zipcode VARCHAR(20),
    Car_Owner VARCHAR(5),
    House_Owner VARCHAR(5),
    Personal_Loan VARCHAR(5),
    Contact VARCHAR(50),
    Customer_Job VARCHAR(50),
    Income INT,
    Cust_Satisfaction_Score INT
);
GO

------------------------------------------------
-- 3. Set Date Format (for CSV dates)
------------------------------------------------
SET DATEFORMAT DMY;
GO

------------------------------------------------
-- 4. Load CSV Data (Initial Load)
------------------------------------------------
BULK INSERT dbo.cc_detail
FROM 'C:\Users\akash\Downloads\credit_card.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);
GO

BULK INSERT dbo.cust_detail
FROM 'C:\Users\akash\Downloads\customer.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);
GO

------------------------------------------------
-- 5. Load Additional Data (Week 53)
------------------------------------------------
BULK INSERT dbo.cc_detail
FROM 'C:\Users\akash\Downloads\cc_add.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);
GO

BULK INSERT dbo.cust_detail
FROM 'C:\Users\akash\Downloads\cust_add.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK
);
GO



