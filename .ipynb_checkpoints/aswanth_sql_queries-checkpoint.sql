-- ================================================
-- RETAIL STORE SALES ANALYSIS - SQL QUERIES

-- ================================================

USE retail_analysis;

-- QUERY 1: TOTAL REVENUE ANALYSIS
SELECT 
    SUM(Weekly_Sales) AS Total_Revenue,
    AVG(Weekly_Sales) AS Avg_Weekly_Sales,
    MAX(Weekly_Sales) AS Best_Week_Sales,
    COUNT(*) AS Total_Records
FROM sales;

-- QUERY 2: TOP 10 STORES BY REVENUE
SELECT 
    s.Store,
    st.Type AS Store_Type,
    st.Size AS Store_Size,
    SUM(s.Weekly_Sales) AS Total_Revenue,
    AVG(s.Weekly_Sales) AS Avg_Weekly_Sales
FROM sales s
JOIN stores st ON s.Store = st.Store
GROUP BY s.Store, st.Type, st.Size
ORDER BY Total_Revenue DESC
LIMIT 10;

-- QUERY 3: TOP 10 DEPARTMENTS BY REVENUE
SELECT 
    Dept,
    SUM(Weekly_Sales) AS Total_Revenue,
    AVG(Weekly_Sales) AS Avg_Weekly_Sales,
    COUNT(*) AS Total_Records
FROM sales
GROUP BY Dept
ORDER BY Total_Revenue DESC
LIMIT 10;

-- QUERY 4: HOLIDAY VS NON-HOLIDAY SALES
SELECT 
    CASE 
        WHEN IsHoliday = 1 THEN 'Holiday'
        ELSE 'Non-Holiday'
    END AS Holiday_Type,
    SUM(Weekly_Sales) AS Total_Revenue,
    AVG(Weekly_Sales) AS Avg_Weekly_Sales,
    COUNT(*) AS Total_Weeks
FROM sales
GROUP BY IsHoliday
ORDER BY Avg_Weekly_Sales DESC;

-- QUERY 5: REVENUE BY STORE TYPE
SELECT 
    st.Type AS Store_Type,
    COUNT(DISTINCT s.Store) AS Number_of_Stores,
    SUM(s.Weekly_Sales) AS Total_Revenue,
    AVG(s.Weekly_Sales) AS Avg_Weekly_Sales
FROM sales s
JOIN stores st ON s.Store = st.Store
GROUP BY st.Type
ORDER BY Total_Revenue DESC;

-- QUERY 6: MONTHLY SALES TREND
SELECT 
    YEAR(Date) AS Year,
    MONTH(Date) AS Month,
    SUM(Weekly_Sales) AS Monthly_Revenue,
    AVG(Weekly_Sales) AS Avg_Weekly_Sales
FROM sales
GROUP BY YEAR(Date), MONTH(Date)
ORDER BY Year, Month;