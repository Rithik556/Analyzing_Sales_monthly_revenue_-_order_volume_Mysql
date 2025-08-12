Use Sales_trend;

-- Files are Loaded

Show Tables;
Select * from orders;
Select * from details;

-- Monthly Revenue & Order Volume

SELECT
    YEAR(STR_TO_DATE(o.`Order Date`, '%d-%m-%Y')) AS year,
    MONTH(STR_TO_DATE(o.`Order Date`, '%d-%m-%Y')) AS month,
    SUM(d.`Amount`) AS monthly_revenue,
    COUNT(DISTINCT o.`Order ID`) AS order_volume
FROM orders o
JOIN details d
    ON o.`Order ID` = d.`Order ID`
GROUP BY year, month
ORDER BY year, month;

-- Top 3 months by sales

SELECT 
    YEAR(STR_TO_DATE(o.`Order Date`, '%d-%m-%Y')) AS year,
    MONTH(STR_TO_DATE(o.`Order Date`, '%d-%m-%Y')) AS month,
    SUM(d.`Amount`) AS monthly_revenue
FROM `orders` o
JOIN `details` d
    ON o.`Order ID` = d.`Order ID`
GROUP BY year, month
ORDER BY monthly_revenue DESC
LIMIT 3;

-- Top 5 States by Total Revenue

SELECT 
    o.`State`,
    SUM(d.`Amount`) AS total_revenue
FROM `orders` o
JOIN `details` d
    ON o.`Order ID` = d.`Order ID`
GROUP BY o.`State`
ORDER BY total_revenue DESC
LIMIT 5;

-- Category-wise Revenue Contribution

SELECT 
    d.`Category`,
    SUM(d.`Amount`) AS category_revenue
FROM `details` d
GROUP BY d.`Category`
ORDER BY category_revenue DESC;

-- Payment Mode Popularity

SELECT 
    YEAR(STR_TO_DATE(o.`Order Date`, '%d-%m-%Y')) AS year,
    MONTH(STR_TO_DATE(o.`Order Date`, '%d-%m-%Y')) AS month,
    SUM(d.`Amount`) AS monthly_revenue
FROM `orders` o
JOIN `details` d
    ON o.`Order ID` = d.`Order ID`
GROUP BY year, month
ORDER BY monthly_revenue DESC
LIMIT 3;
