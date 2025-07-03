-- Kultra Mega Stores (KMS) Case Study SQL Script
-- Author: [Your Name]
-- Date: [Today's Date]

-- Note: Load your CSV into a database table named 'Orders' before running these queries

----------------------------------------------------
-- Case Scenario I
----------------------------------------------------

-- 1. Product category with the highest sales
SELECT [Product Category], SUM(Sales) AS TotalSales
FROM Orders
GROUP BY [Product Category]
ORDER BY TotalSales DESC;

-- 2. Top 3 and Bottom 3 regions in terms of sales
SELECT Region, SUM(Sales) AS TotalSales
FROM Orders
GROUP BY Region
ORDER BY TotalSales DESC;

-- 3. Total sales of Appliances in Ontario
SELECT SUM(Sales) AS AppliancesSalesOntario
FROM Orders
WHERE [Product Category] = 'Appliances' AND Province = 'Ontario';

-- 4. Bottom 10 customers by sales
SELECT [Customer Name], SUM(Sales) AS TotalSales
FROM Orders
GROUP BY [Customer Name]
ORDER BY TotalSales ASC
LIMIT 10;

-- 5. Shipping method with the highest total shipping cost
SELECT [Ship Mode], SUM([Shipping Cost]) AS TotalShippingCost
FROM Orders
GROUP BY [Ship Mode]
ORDER BY TotalShippingCost DESC;

----------------------------------------------------
-- Case Scenario II
----------------------------------------------------

-- 6. Most valuable customers (Top 5) and their typical purchases
SELECT [Customer Name], SUM(Sales) AS TotalSales
FROM Orders
GROUP BY [Customer Name]
ORDER BY TotalSales DESC
LIMIT 5;

-- Products bought by most valuable customer
SELECT DISTINCT [Product Name]
FROM Orders
WHERE [Customer Name] = 'TopCustomerName';

-- 7. Small business customer with highest sales
SELECT [Customer Name], SUM(Sales) AS TotalSales
FROM Orders
WHERE [Customer Segment] = 'Small Business'
GROUP BY [Customer Name]
ORDER BY TotalSales DESC
LIMIT 1;

-- 8. Corporate customer with most orders (2009-2012)
SELECT [Customer Name], COUNT([Order ID]) AS OrderCount
FROM Orders
WHERE [Customer Segment] = 'Corporate'
GROUP BY [Customer Name]
ORDER BY OrderCount DESC
LIMIT 1;

-- 9. Most profitable consumer customer
SELECT [Customer Name], SUM(Profit) AS TotalProfit
FROM Orders
WHERE [Customer Segment] = 'Consumer'
GROUP BY [Customer Name]
ORDER BY TotalProfit DESC
LIMIT 1;

-- 10. Customers who returned items (assuming a 'Returned' column exists)
SELECT DISTINCT [Customer Name], [Customer Segment]
FROM Orders
WHERE Returned = 'Yes';

-- 11. Shipping cost vs. order priority analysis
SELECT [Ship Mode], [Order Priority], SUM([Shipping Cost]) AS TotalShippingCost, COUNT([Order ID]) AS TotalOrders
FROM Orders
GROUP BY [Ship Mode], [Order Priority]
ORDER BY [Order Priority], [Ship Mode];
