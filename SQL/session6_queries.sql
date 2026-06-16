-- Session 6: SQL Analysis for Online Retail Project

CREATE DATABASE IF NOT EXISTS online_retail_project;
USE online_retail_project;

DROP TABLE IF EXISTS online_retail;

CREATE TABLE online_retail (
    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(20),
    Description TEXT,
    Quantity INT,
    InvoiceDate DATETIME,
    UnitPrice DECIMAL(10,2),
    CustomerID VARCHAR(20),
    Country VARCHAR(100),
    Revenue DECIMAL(12,2),
    InvoiceMonth VARCHAR(10),
    InvoiceDay DATE,
    InvoiceHour INT,
    Weekday VARCHAR(20)
);

-- Import command
LOAD DATA LOCAL INFILE '/Users/ishaan0226/Desktop/Online retail analysis/Data/cleaned/online_retail_cleaned.csv'
INTO TABLE online_retail
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(InvoiceNo, StockCode, Description, Quantity, InvoiceDate, UnitPrice, CustomerID, Country, Revenue, InvoiceMonth, InvoiceDay, InvoiceHour, Weekday);

-- Check import
SELECT COUNT(*) AS total_rows
FROM online_retail;

SELECT *
FROM online_retail
LIMIT 5;

-- Total revenue
SELECT ROUND(SUM(Revenue), 2) AS total_revenue
FROM online_retail;

-- Total customers
SELECT COUNT(DISTINCT CustomerID) AS total_customers
FROM online_retail;

-- Total transactions
SELECT COUNT(DISTINCT InvoiceNo) AS total_transactions
FROM online_retail;

-- Monthly revenue
SELECT 
    InvoiceMonth,
    ROUND(SUM(Revenue), 2) AS monthly_revenue
FROM online_retail
GROUP BY InvoiceMonth
ORDER BY InvoiceMonth;

-- Top 10 countries by revenue
SELECT 
    Country,
    ROUND(SUM(Revenue), 2) AS total_revenue
FROM online_retail
GROUP BY Country
ORDER BY total_revenue DESC
LIMIT 10;

-- Top 10 products by revenue
SELECT 
    Description,
    ROUND(SUM(Revenue), 2) AS total_revenue
FROM online_retail
GROUP BY Description
ORDER BY total_revenue DESC
LIMIT 10;

-- Top 10 products by quantity sold
SELECT 
    Description,
    SUM(Quantity) AS total_quantity
FROM online_retail
GROUP BY Description
ORDER BY total_quantity DESC
LIMIT 10;

-- Top 10 customers by revenue
SELECT 
    CustomerID,
    ROUND(SUM(Revenue), 2) AS total_revenue
FROM online_retail
GROUP BY CustomerID
ORDER BY total_revenue DESC
LIMIT 10;

-- Orders per customer
SELECT 
    CustomerID,
    COUNT(DISTINCT InvoiceNo) AS order_count
FROM online_retail
GROUP BY CustomerID
ORDER BY order_count DESC
LIMIT 10;

-- Revenue by weekday
SELECT 
    Weekday,
    ROUND(SUM(Revenue), 2) AS total_revenue
FROM online_retail
GROUP BY Weekday
ORDER BY total_revenue DESC;

-- Revenue by hour
SELECT 
    InvoiceHour,
    ROUND(SUM(Revenue), 2) AS total_revenue
FROM online_retail
GROUP BY InvoiceHour
ORDER BY InvoiceHour;