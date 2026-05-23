

CREATE TABLE ecommerce (
    InvoiceNo VARCHAR(20),
    StockCode VARCHAR(20),
    Description TEXT,
    Quantity INT,
    InvoiceDate TIMESTAMP,
    UnitPrice NUMERIC,
    CustomerID NUMERIC,
    Country VARCHAR(100),
    Revenue NUMERIC,
    Month INT,
    Year INT,
    Day VARCHAR(20)
);

--  Check Data Imported or Not


SELECT * FROM ecommerce
LIMIT 10;

--STEP 7 — Count Total Rows

SELECT COUNT(*) FROM ecommerce


--1. Total Revenue
SELECT SUM(Revenue) AS Total_Revenue
FROM ecommerce;
--2. Total Customers
SELECT COUNT(DISTINCT CustomerID) AS Total_Customers
FROM ecommerce;

--3. Top 10 Customers
SELECT CustomerID,
SUM(Revenue) AS Total_Spending
FROM ecommerce
GROUP BY CustomerID
ORDER BY Total_Spending DESC
LIMIT 10;

--4. Top Selling Products
SELECT Description,
SUM(Quantity) AS Total_Quantity
FROM ecommerce
GROUP BY Description
ORDER BY Total_Quantity DESC
LIMIT 10;


--5. Country-wise Revenue
SELECT Country,
SUM(Revenue) AS Revenue
FROM ecommerce
GROUP BY Country
ORDER BY Revenue DESC;


--6. Monthly Revenue
SELECT Month,
SUM(Revenue) AS Monthly_Revenue
FROM ecommerce
GROUP BY Month
ORDER BY Month;


--7. Best Sales Day
SELECT Day,
SUM(Revenue) AS Revenue
FROM ecommerce
GROUP BY Day
ORDER BY Revenue DESC;

--STEP 9 — Advanced Queries (Resume Booster)
-- Average Order Value
SELECT AVG(order_total) AS Avg_Order_Value
FROM (
    SELECT InvoiceNo,
    SUM(Revenue) AS order_total
    FROM ecommerce
    GROUP BY InvoiceNo
) t;

--Repeat Customers
SELECT CustomerID,
COUNT(DISTINCT InvoiceNo) AS Total_Orders
FROM ecommerce
GROUP BY CustomerID
HAVING COUNT(DISTINCT InvoiceNo) > 1
ORDER BY Total_Orders DESC;
