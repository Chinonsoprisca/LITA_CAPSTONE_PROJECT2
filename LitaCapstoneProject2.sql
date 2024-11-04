CREATE DATABASE LitaProject2

SELECT * FROM [dbo].[ProjectCustomerData]

-----Retrieve the total number of customers from each region---------
SELECT Region, COUNT(Customer_ID) AS TotalCustomers
FROM [dbo].[ProjectCustomerData]
GROUP BY Region
ORDER BY 2 DESC

----Find the most popular subscription type by the number of customers-----
SELECT TOP 1 SubscriptionType AS MostPopularSubscriptionType, COUNT(Customer_ID) AS NumberOfCustomers
FROM [dbo].[ProjectCustomerData]
GROUP BY SubscriptionType
ORDER BY 2 DESC

---Find customers who canceled their subscription within 6 months----
SELECT * FROM [dbo].[ProjectCustomerData]
WHERE DATEDIFF(Month, SubscriptionStart, SubscriptionEnd) <= 6
AND Canceled = 'TRUE'

-----Calculate the average subscription duration for all customers-------
SELECT AVG(SubscriptionDuration) AS AverageSubscriptionDuration
FROM [dbo].[ProjectCustomerData] 

----Find customers with subscriptions longer than 12 months----
SELECT *FROM [dbo].[ProjectCustomerData] 
WHERE DATEDIFF(Month, SubscriptionStart, SubscriptionEnd) >12

----Calculate total revenue by subscription type-----
SELECT SubscriptionType, SUM(Revenue) AS TotalRevenue
FROM [dbo].[ProjectCustomerData]
GROUP BY SubscriptionType
ORDER BY 2 DESC

----Find the top 3 regions by subscription cancellations------
SELECT TOP 3 Region AS TopRegions, COUNT(Canceled)
FROM ProjectCustomerData
GROUP BY Region
ORDER BY 2 DESC

----Find the total number of active and canceled subscriptions------
SELECT 
(CASE
WHEN Canceled = 'FALSE' THEN 'Active' ELSE 'Canceled' END) AS SubscriptionStatus, 
COUNT(Canceled) AS TotalCount
FROM [dbo].[ProjectCustomerData]
GROUP BY Canceled
ORDER BY 2 DESC


-----------------Exploration----------------------------------
SELECT COUNT(*) AS Active FROM [dbo].[ProjectCustomerData]  
WHERE Canceled = 'FALSE' 

SELECT COUNT(*) AS Canceled  FROM [dbo].[ProjectCustomerData]  
WHERE Canceled = 'TRUE' 

SELECT
COUNT(CASE WHEN Canceled = 'FALSE' THEN 1 ELSE 0 END) AS Active,
COUNT(CASE WHEN Canceled = 'TRUE' THEN 1 ELSE 0 END) AS Canceled
FROM [dbo].[ProjectCustomerData]
GROUP BY Canceled

SELECT Canceled, COUNT(Canceled)
FROM [dbo].[ProjectCustomerData]
GROUP BY Canceled

SELECT * FROM [dbo].[ProjectCustomerData]
WHERE SubscriptionEnd >= GETDATE()-------To
----------------------------------------------------------