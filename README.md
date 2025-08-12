# Analyzing_Sales_monthly_revenue_-_order_volume_Mysql
The goal of this task is to analyze monthly revenue and order volume using SQL aggregation functions, and gain additional insights into sales trends, top-performing months, product categories, states, and payment methods.

# Task 6 - Sales Trend Analysis Using Aggregations

## 📌 Objective
The goal of this task is to analyze monthly revenue and order volume using SQL aggregation functions, and gain additional insights into sales trends, top-performing months, product categories, states, and payment methods.

---

## 📂 Dataset
Two datasets were used:
1. **Orders.csv**  
   - Columns: `Order ID`, `Order Date`, `CustomerName`, `State`, `City`
2. **Details.csv**  
   - Columns: `Order ID`, `Amount`, `Profit`, `Quantity`, `Category`, `Sub-Category`, `PaymentMode`

---

## 🛠 Tools Used
- **MySQL** for data storage and analysis
- **CSV files** imported into MySQL tables (`orders` and `details`)
- **GitHub** for task submission

---

## 🧮 Analysis Performed

### 1️⃣ Monthly Revenue & Order Volume
```sql
SELECT 
    YEAR(STR_TO_DATE(o.`Order Date`, '%d-%m-%Y')) AS year,
    MONTH(STR_TO_DATE(o.`Order Date`, '%d-%m-%Y')) AS month,
    SUM(d.`Amount`) AS monthly_revenue,
    COUNT(DISTINCT o.`Order ID`) AS order_volume
FROM `orders` o
JOIN `details` d
    ON o.`Order ID` = d.`Order ID`
GROUP BY year, month
ORDER BY year, month;
