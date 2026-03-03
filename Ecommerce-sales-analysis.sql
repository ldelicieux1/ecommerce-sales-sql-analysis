-- =========================================
-- Project: E-Commerce Sales Performance Analysis
-- Author: Lael Delicieux
-- Tool: MySQL Workbench
-- Description:
-- Structured SQL database and business analysis queries
-- to evaluate revenue, profit, trends, and marketing ROI.
-- =========================================


-- Create Database
CREATE DATABASE IF NOT EXISTS ecommerce_dashboard;
USE ecommerce_dashboard;


-- Create Table
CREATE TABLE sales_data (
    Year INT,
    Month VARCHAR(20),
    Category VARCHAR(100),
    Region VARCHAR(50),
    Units_Sold INT,
    Revenue DECIMAL(12,2),
    Profit DECIMAL(12,2),
    Customer_Rating DECIMAL(3,1),
    Ad_Spend DECIMAL(12,2)
);


-- =========================
-- Key Performance Indicators
-- =========================

-- Total Revenue
SELECT SUM(Revenue) AS Total_Revenue 
FROM sales_data;

-- Total Profit
SELECT SUM(Profit) AS Total_Profit 
FROM sales_data;

-- Total Units Sold
SELECT SUM(Units_Sold) AS Total_Units_Sold 
FROM sales_data;


-- =========================
-- Category Analysis
-- =========================

SELECT 
    Category,
    SUM(Revenue) AS Total_Revenue
FROM sales_data
GROUP BY Category
ORDER BY Total_Revenue DESC;


-- =========================
-- Regional Analysis
-- =========================

SELECT 
    Region,
    SUM(Profit) AS Total_Profit
FROM sales_data
GROUP BY Region
ORDER BY Total_Profit DESC;


-- =========================
-- Monthly Revenue Trend
-- =========================

SELECT 
    Year,
    Month,
    SUM(Revenue) AS Monthly_Revenue
FROM sales_data
GROUP BY Year, Month
ORDER BY Year,
FIELD(Month,
'January','February','March','April','May','June',
'July','August','September','October','November','December');


-- =========================
-- Marketing Efficiency
-- =========================

SELECT 
    ROUND(SUM(Revenue) / SUM(Ad_Spend), 2) 
    AS Return_On_Ad_Spend
FROM sales_data;