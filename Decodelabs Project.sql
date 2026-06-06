--VIEW ENTIRE TABLE
USE DecodeLabDB
GO
SELECT *
FROM Orders;

--VIEW SPECIFIC COLUMNS
USE DecodeLabDB
GO
SELECT OrderID, Product, TotalPrice
FROM Orders;

--VIEW FIRST 10 ROWS
USE DecodeLabDB
GO
SELECT TOP(10) *
FROM Orders;

--FILTER DELIVERED ORDERS
USE DecodeLabDB
GO
SELECT OrderID, Product, TotalPrice
FROM Orders
WHERE OrderStatus = 'Delivered';

--FILTER ORDERS ABOVE $1000
USE DecodeLabDB
GO
SELECT OrderID, Product, TotalPrice
FROM Orders
WHERE TotalPrice > 1000;

--FILTER DELIVERED ORDERS ABOVE $1000
USE DecodeLabDB
GO
SELECT OrderID, Product, TotalPrice
FROM Orders
WHERE OrderStatus = 'Delivered'
AND TotalPrice > 1000;

--FILTER ORDERS WITH NO COUPON
USE DecodeLabDB
GO
SELECT OrderID, Product, CouponCode
FROM Orders
WHERE CouponCode = 'No Coupon';

--REVENUE BY PRODUCT
USE DecodeLabDB
GO
SELECT Product,
       COUNT(OrderID) AS OrderCount,
       SUM(TotalPrice) AS TotalRevenue,
       ROUND(AVG(TotalPrice), 2) AS AvgOrderValue
FROM Orders
GROUP BY Product
ORDER BY TotalRevenue DESC;

--ORDER STATUS DISTRIBUTION
USE DecodeLabDB
GO
SELECT OrderStatus,
       COUNT(OrderID) AS OrderCount
FROM Orders
GROUP BY OrderStatus
ORDER BY OrderCount DESC;

--REVENUE BY PAYMENT METHOD
USE DecodeLabDB
GO
SELECT PaymentMethod,
       COUNT(OrderID) AS OrderCount,
       SUM(TotalPrice) AS TotalRevenue
FROM Orders
GROUP BY PaymentMethod
ORDER BY TotalRevenue DESC;

--SALES BY REFERRAL SOURCE
USE DecodeLabDB
GO
SELECT ReferralSource,
       COUNT(OrderID) AS OrderCount,
       SUM(Quantity) AS TotalQuantity
FROM Orders
GROUP BY ReferralSource
ORDER BY OrderCount DESC;

--COUPON USAGE ANALYSIS
USE DecodeLabDB
GO
SELECT CouponCode,
       COUNT(OrderID) AS OrderCount,
       ROUND(AVG(TotalPrice), 2) AS AvgOrderValue
FROM Orders
GROUP BY CouponCode
ORDER BY OrderCount DESC;

--BASIC STATISTICS
USE DecodeLabDB
GO
SELECT ROUND(AVG(TotalPrice), 2) AS Mean,
       MAX(TotalPrice) AS Maximum,
       MIN(TotalPrice) AS Minimum,
       COUNT(OrderID) AS TotalOrders,
       SUM(TotalPrice) AS TotalRevenue
     FROM Orders;

--TOTAL QUANTITY
USE DecodeLabDB
GO
SELECT SUM(Quantity) AS TotalQuantity
FROM Orders;

--PRODUCTS WITH REVENUE ABOVE $180,000
USE DecodeLabDB
GO
SELECT Product,
       SUM(TotalPrice) AS TotalRevenue
FROM Orders
GROUP BY Product
HAVING SUM(TotalPrice) > 180000
ORDER BY TotalRevenue DESC;

--PAYMENT METHODS WITH MORE THAN 240 ORDERS
USE DecodeLabDB
GO
SELECT PaymentMethod,
       COUNT(OrderID) AS OrderCount
FROM Orders
GROUP BY PaymentMethod
HAVING COUNT(OrderID) > 240;

--ORDERS BY YEAR
USE DecodeLabDB
GO
SELECT YEAR(Date) AS Year,
       COUNT(OrderID) AS OrderCount,
       SUM(TotalPrice) AS TotalRevenue
FROM Orders
GROUP BY YEAR(Date)
ORDER BY Year;

--PAYMENT METHOD PREFERENCE BY YEAR
USE DecodeLabDB
GO
SELECT YEAR(Date) AS Year,
       PaymentMethod,
       COUNT(OrderID) AS OrderCount
FROM Orders
GROUP BY YEAR(Date), PaymentMethod
ORDER BY Year, OrderCount DESC;

--HIGH VALUE ORDERS ABOVE $3,300
USE DecodeLabDB
GO
SELECT OrderID, Product, Quantity, UnitPrice, TotalPrice
FROM Orders
WHERE TotalPrice > 3330
ORDER BY TotalPrice DESC;

