create database saledata;
use saledata;
drop table online_sales_data;
create table online_sales_data
(Transaction_ID Bigint,
Date Date,
Product_Category varchar(50),
Product_Name varchar(500),
Units_Sold	bigint,
Unit_Price  Bigint,
Total_Revenue bigint,
Region	  varchar(50),
Payment_Method Varchar(50));


load data infile 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Online Sales Data.csv'
into table online_sales_data
fields terminated by ',' 
optionally enclosed by '"'
lines terminated by '\n'
ignore 1 rows ;

-- Extract the Month from the Date column 
SELECT 
    Date,
    MONTH(Date) AS sales_month
FROM 
    online_sales_data
LIMIT 10;

-- Group by Year and Month
SELECT 
    YEAR(Date) AS sales_year,
    MONTH(Date) AS sales_month
FROM 
    online_sales_data
GROUP BY 
    YEAR(Date), MONTH(Date);
    
--  Use SUM() to Calculate Total Revenue Per Group
SELECT 
    YEAR(Date) AS sales_year,
    MONTH(Date) AS sales_month,
    SUM(Total_Revenue) AS total_revenue
FROM 
    online_sales_data
GROUP BY 
    YEAR(Date), MONTH(Date);

-- Use COUNT(DISTINCT Transaction_ID) to Calculate Order Volume
SELECT 
    YEAR(Date) AS sales_year,
    MONTH(Date) AS sales_month,
    SUM(Total_Revenue) AS total_revenue,
    COUNT(DISTINCT Transaction_ID) AS total_orders
FROM 
    online_sales_data
GROUP BY 
    YEAR(Date), MONTH(Date);

-- Use ORDER BY to Sort Results
SELECT 
    YEAR(Date) AS sales_year,
    MONTH(Date) AS sales_month,
    SUM(Total_Revenue) AS total_revenue,
    COUNT(DISTINCT Transaction_ID) AS total_orders
FROM 
    online_sales_data
GROUP BY 
    YEAR(Date), MONTH(Date)
ORDER BY 
    sales_year, sales_month;

-- Limit Results for a Specific Time Period
SELECT 
    YEAR(Date) AS sales_year,
    MONTH(Date) AS sales_month,
    SUM(Total_Revenue) AS total_revenue,
    COUNT(DISTINCT Transaction_ID) AS total_orders
FROM 
    online_sales_data
WHERE
    Date BETWEEN '2024-01-01' AND '2024-08-27'
GROUP BY 
    YEAR(Date), MONTH(Date)
ORDER BY 
    sales_year, sales_month;

    


