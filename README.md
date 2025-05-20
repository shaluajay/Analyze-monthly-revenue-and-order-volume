# Analyze-monthly-revenue-and-order-volume
#  Online Sales Data Analysis (SQL)

##  Overview
This project analyzes monthly sales performance using **SQL queries** on the `online_sales_data` table. The analysis includes:
- Monthly revenue
- Number of distinct transactions (volume)
- Time-based filtering (e.g., January–August 2024)

##  Database & Table Structure

**Database:** `saledata`  
**Table:** `online_sales_data`

| Column Name        | Data Type    | Description                          |
|--------------------|--------------|--------------------------------------|
| Transaction_ID     | BIGINT       | Unique identifier for each sale      |
| Date               | DATE         | Date of the transaction              |
| Product_Category   | VARCHAR(50)  | Category of the product              |
| Product_Name       | VARCHAR(500) | Name/description of the product      |
| Units_Sold         | BIGINT       | Quantity sold                        |
| Unit_Price         | BIGINT       | Price per unit                       |
| Total_Revenue      | BIGINT       | Total revenue from the transaction   |
| Region             | VARCHAR(50)  | Sales region                         |
| Payment_Method     | VARCHAR(50)  | Payment method used                  |



##  Query Logic

### 🔹 Step 1: Extract Year and Month
Extract `YEAR(Date)` and `MONTH(Date)` to group data monthly.

### 🔹 Step 2: Aggregate Metrics
Use:
- `SUM(Total_Revenue)` to calculate total monthly revenue
- `COUNT(DISTINCT Transaction_ID)` to count unique orders

### 🔹 Step 3: Filter by Date Range
Use `WHERE Date BETWEEN 'YYYY-MM-DD' AND 'YYYY-MM-DD'` to limit the time frame.

### 🔹 Step 4: Sort Results
Use `ORDER BY sales_year, sales_month` to view data chronologically.

