SELECT 
    YEAR(Date) AS Year,
    MONTH(Date) AS Month,
    SUM(Weekly_Sales) AS Monthly_Revenue,
    AVG(Weekly_Sales) AS Avg_Weekly_Sales
FROM sales
GROUP BY YEAR(Date), MONTH(Date)
ORDER BY Year, Month;