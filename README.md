# SQL Orders Analysis — Orders Dataset
### Week 3 | Decode Lab Internship

## Project Overview
SQL analysis performed on a cleaned 1,200-row orders dataset
using SQL Server Management Studio (SSMS). The goal was to
replicate EDA findings from Week 2 using structured queries
and extract additional business insights.

**Tool:** SQL Server Management Studio (SSMS)
**Database:** DecodeLabDB
**Dataset:** 1,200 rows · 14 columns · Jan 2023 – Jun 2025
**Internship:** Decode Lab | Training: TS Academy

---

## Database Setup
- Created database: `DecodeLabDB` in SQL Server
- Imported cleaned Excel dataset using SQL Server Import Wizard
- Table name: `dbo.Orders`

---

## Queries Written

### 1. Basic Data Exploration
```sql
-- View entire table
SELECT * FROM Orders;

-- View specific columns
SELECT OrderID, Product, TotalPrice
FROM Orders;

-- View first 10 rows
SELECT TOP(10) * FROM Orders;
```

### 2. Filtering with WHERE
```sql
-- Delivered orders only
SELECT OrderID, Product, TotalPrice
FROM Orders
WHERE OrderStatus = 'Delivered';

-- Orders above $1,000
SELECT OrderID, Product, TotalPrice
FROM Orders
WHERE TotalPrice > 1000;

-- Delivered orders above $1,000
SELECT OrderID, Product, TotalPrice
FROM Orders
WHERE OrderStatus = 'Delivered'
AND TotalPrice > 1000;

-- Orders with no coupon
SELECT OrderID, Product, CouponCode
FROM Orders
WHERE CouponCode = 'No Coupon';
```

### 3. Revenue by Product (GROUP BY)
```sql
SELECT Product,
       COUNT(OrderID) AS OrderCount,
       SUM(TotalPrice) AS TotalRevenue,
       ROUND(AVG(TotalPrice), 2) AS AvgOrderValue
FROM Orders
GROUP BY Product
ORDER BY TotalRevenue DESC;
```

### 4. Order Status Distribution
```sql
SELECT OrderStatus,
       COUNT(OrderID) AS OrderCount
FROM Orders
GROUP BY OrderStatus
ORDER BY OrderCount DESC;
```

### 5. Revenue by Payment Method
```sql
SELECT PaymentMethod,
       COUNT(OrderID) AS OrderCount,
       SUM(TotalPrice) AS TotalRevenue
FROM Orders
GROUP BY PaymentMethod
ORDER BY TotalRevenue DESC;
```

### 6. Sales by Referral Source
```sql
SELECT ReferralSource,
       COUNT(OrderID) AS OrderCount,
       SUM(Quantity) AS TotalQuantity
FROM Orders
GROUP BY ReferralSource
ORDER BY OrderCount DESC;
```

### 7. Coupon Usage Analysis
```sql
SELECT CouponCode,
       COUNT(OrderID) AS OrderCount,
       ROUND(AVG(TotalPrice), 2) AS AvgOrderValue
FROM Orders
GROUP BY CouponCode
ORDER BY OrderCount DESC;
```

### 8. Basic Statistics
```sql
SELECT ROUND(AVG(TotalPrice), 2) AS Mean,
       MAX(TotalPrice) AS Maximum,
       MIN(TotalPrice) AS Minimum,
       COUNT(OrderID) AS TotalOrders,
       SUM(TotalPrice) AS TotalRevenue
FROM Orders;
```

### 9. Revenue by Year
```sql
SELECT YEAR(Date) AS Year,
       COUNT(OrderID) AS OrderCount,
       SUM(TotalPrice) AS TotalRevenue
FROM Orders
GROUP BY YEAR(Date)
ORDER BY Year;
```

### 10. Payment Method by Year (HAVING)
```sql
SELECT YEAR(Date) AS Year,
       PaymentMethod,
       COUNT(OrderID) AS OrderCount
FROM Orders
GROUP BY YEAR(Date), PaymentMethod
ORDER BY Year, OrderCount DESC;
```

### 11. High Value Orders — Outliers
```sql
SELECT OrderID, Product, Quantity,
       UnitPrice, TotalPrice
FROM Orders
WHERE TotalPrice > 3330
ORDER BY TotalPrice DESC;
```

---

## Key SQL Findings

| Finding | Result |
|---|---|
| Total Revenue | $1,264,761.96 |
| Total Orders | 1,200 |
| Mean Order Value | $1,053.97 |
| Max Order | $3,456.40 |
| Min Order | $11.39 |
| No Coupon Orders | 309 |
| High Value Outliers | 8 orders above $3,330 |

**Payment Method Shift:**
- 2023: Cash was #1 (119 orders)
- 2024: Debit Card and Online Transfer took over
- Confirms a clear shift toward digital payments over time

**Validation:**
All SQL results matched Excel PivotTable findings from
Week 2 — confirming data integrity across tools.

---

## SQL Keywords Used
| Keyword | Purpose |
|---|---|
| SELECT | Choose columns to display |
| FROM | Specify the table |
| WHERE | Filter rows by condition |
| GROUP BY | Group rows for aggregation |
| HAVING | Filter grouped results |
| ORDER BY | Sort results |
| COUNT | Count rows |
| SUM | Add up values |
| AVG | Calculate average |
| MAX / MIN | Find highest/lowest value |
| ROUND | Round decimal places |
| YEAR() | Extract year from date |

---

## Tools Used
- SQL Server Management Studio (SSMS)
- SQL Server Express

---

## Next Step
SQL findings visualised in:
- Week 4: Power BI Dashboard

---

## Author
**Adesola Jegede**
Data Analytics Intern — Decode Lab
Student — TS Academy
🔗 [LinkedIn]([https://www.linkedin.com/in/your-linkedin-url](https://www.linkedin.com/in/jegede-adesola-562398244))
