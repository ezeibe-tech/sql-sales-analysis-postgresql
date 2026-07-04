-- ==========================================
-- Week 3 SQL Project
-- Database: sales_analytics_db
-- Table: sales_data
-- Author: Promise Ezeibe
-- ==========================================

-- ==========================================
-- TASK 1: Display all sales records
-- ==========================================

SELECT *
FROM sales_data;

-- ==========================================
-- TASK 2: Display selected columns
-- ==========================================

SELECT
    ordernumber,
    orderdate,
    customername,
    productline,
    sales
FROM sales_data;

-- ==========================================
-- TASK 3: Display first 10 records
-- ==========================================

SELECT *
FROM sales_data
LIMIT 10;

-- ==========================================
-- TASK 4: Total number of records
-- ==========================================

SELECT COUNT(*) AS total_records
FROM sales_data;

-- ==========================================
-- TASK 5: Display unique product lines
-- ==========================================

SELECT DISTINCT productline
FROM sales_data
ORDER BY productline;

-- ==========================================
-- TASK 6: Display unique countries
-- ==========================================

SELECT DISTINCT country
FROM sales_data
ORDER BY country;

-- ==========================================
-- TASK 7: Display unique deal sizes
-- ==========================================

SELECT DISTINCT dealsize
FROM sales_data
ORDER BY dealsize;

-- ==========================================
-- TASK 8: Sales greater than 5000
-- ==========================================

SELECT *
FROM sales_data
WHERE sales > 5000;

-- ==========================================
-- TASK 9: Orders from USA
-- ==========================================

SELECT *
FROM sales_data
WHERE country = 'USA';

-- ==========================================
-- TASK 10: Orders with status Shipped
-- ==========================================

SELECT *
FROM sales_data
WHERE status = 'Shipped';

-- ==========================================
-- TASK 11: Sort sales from highest to lowest
-- ==========================================

SELECT
    ordernumber,
    customername,
    sales
FROM sales_data
ORDER BY sales DESC;

-- ==========================================
-- TASK 12: Sort orders by date
-- ==========================================

SELECT
    ordernumber,
    orderdate,
    sales
FROM sales_data
ORDER BY orderdate DESC;

-- ==========================================
-- TASK 13: Total revenue
-- ==========================================

SELECT
    SUM(sales) AS total_revenue
FROM sales_data;

-- ==========================================
-- TASK 14: Average sales
-- ==========================================

SELECT
    ROUND(AVG(sales),2) AS average_sales
FROM sales_data;

-- ==========================================
-- TASK 15: Highest sale
-- ==========================================

SELECT
    MAX(sales) AS highest_sale
FROM sales_data;

-- ==========================================
-- TASK 16: Lowest sale
-- ==========================================

SELECT
    MIN(sales) AS lowest_sale
FROM sales_data;

-- ==========================================
-- TASK 17: Total orders
-- ==========================================

SELECT
    COUNT(*) AS total_orders
FROM sales_data;

-- ==========================================
-- TASK 18: Revenue by product line
-- ==========================================

SELECT
    productline,
    ROUND(SUM(sales),2) AS total_sales
FROM sales_data
GROUP BY productline
ORDER BY total_sales DESC;

-- ==========================================
-- TASK 19: Revenue by country
-- ==========================================

SELECT
    country,
    ROUND(SUM(sales),2) AS total_sales
FROM sales_data
GROUP BY country
ORDER BY total_sales DESC;

-- ==========================================
-- TASK 20: Revenue by city
-- ==========================================

SELECT
    city,
    ROUND(SUM(sales),2) AS total_sales
FROM sales_data
GROUP BY city
ORDER BY total_sales DESC;

-- ==========================================
-- TASK 21: Revenue by year
-- ==========================================

SELECT
    year_id,
    ROUND(SUM(sales),2) AS total_sales
FROM sales_data
GROUP BY year_id
ORDER BY year_id;

-- ==========================================
-- TASK 22: Revenue by month
-- ==========================================

SELECT
    year_id,
    month_id,
    ROUND(SUM(sales),2) AS total_sales
FROM sales_data
GROUP BY year_id, month_id
ORDER BY year_id, month_id;

-- ==========================================
-- TASK 23: Orders by deal size
-- ==========================================

SELECT
    dealsize,
    COUNT(*) AS total_orders
FROM sales_data
GROUP BY dealsize
ORDER BY total_orders DESC;

-- ==========================================
-- TASK 24: Revenue by deal size
-- ==========================================

SELECT
    dealsize,
    ROUND(SUM(sales),2) AS total_sales
FROM sales_data
GROUP BY dealsize
ORDER BY total_sales DESC;

-- ==========================================
-- TASK 25: Product lines with revenue above 1,000,000
-- ==========================================

SELECT
    productline,
    ROUND(SUM(sales),2) AS total_sales
FROM sales_data
GROUP BY productline
HAVING SUM(sales) > 1000000
ORDER BY total_sales DESC;

-- ==========================================
-- TASK 26: Customer purchasing behaviour
-- ==========================================

SELECT
    customername,
    COUNT(*) AS total_orders,
    ROUND(SUM(sales),2) AS total_spent
FROM sales_data
GROUP BY customername
ORDER BY total_spent DESC;

-- ==========================================
-- TASK 27: Top 10 customers
-- ==========================================

SELECT
    customername,
    ROUND(SUM(sales),2) AS total_spent
FROM sales_data
GROUP BY customername
ORDER BY total_spent DESC
LIMIT 10;

-- ==========================================
-- TASK 28: Sales greater than average (Subquery)
-- ==========================================

SELECT *
FROM sales_data
WHERE sales >
(
    SELECT AVG(sales)
    FROM sales_data
);

-- ==========================================
-- TASK 29: Row numbering using window function
-- ==========================================

SELECT
    ordernumber,
    customername,
    sales,
    ROW_NUMBER() OVER (ORDER BY sales DESC) AS row_num
FROM sales_data;

-- ==========================================
-- TASK 30: Rank orders by sales
-- ==========================================

SELECT
    ordernumber,
    customername,
    sales,
    RANK() OVER (ORDER BY sales DESC) AS sales_rank
FROM sales_data;

-- ==========================================
-- TASK 31: Rank sales within each product line
-- ==========================================

SELECT
    productline,
    customername,
    sales,
    RANK() OVER (
        PARTITION BY productline
        ORDER BY sales DESC
    ) AS product_rank
FROM sales_data;