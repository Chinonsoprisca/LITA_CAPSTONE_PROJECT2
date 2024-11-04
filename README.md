# LITA_CAPSULE_PROJECT2
This is the documentation of my Data Analysis Bootcamp Project2, with @INCUBATOR HUB

## Project Title
Customer Subscription Service Segmentation 
 
[Project Overview](#project-overview)

[Data Source](#data-source)

[Tools Used](#tools-used)

[Data Cleaning and Preparations](#data-cleaning-and-preparations)

[Exploratory Data Analysis](#exploratory-data-analysis)

[Data Analysis](#data-analysis)

[Data Visualization](#data-visualization)


### Project Overview
---
Customer Segmentation for a Subscription Service: This project involves analyzing customer data for a subscription service to identify
segments and trends. The goal is to understand customer behavior, track subscription types,
and identify key trends in cancellations and renewals. The final deliverable is a Power BI
dashboard that presents this analysis. 

### Data Source
---
The data used is Lita_Capsule_Dataset (CustomerData), which was shared by Ladies In Tech Africa (LITA) through LMS, to be downloaded by her enrolled Data Analysis Students for the Lita_Capsule_Project.

### Tools Used
---
- Microsoft Excel [Download Here]() 
  1. For Data Cleaning
  2. For Analysis
  3. For Visualization
     
- SQL - Structured Query Language for Querying of Data

- Power BI - Power Business Intelligence for Data Visualization

- Github for
  1. Portfolio Building
  2. Project Submission 

### Data Cleaning and Preparations
---
................................
1. Data loading and Inspection
2. Verifying blank cells and Data Consistency
3. Data Cleaning and Formatting

### Exploratory Data Analysis
---
.....................................
_Excel_
-Find subscription patterns
-What is the average subscription duration 
-Identify most popular subscription types


### Data Analysis
---
..........code

```SQL
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
```
### Data Visualization



|Heading1|Heading2|Heading3|
|--------|--------|--------|
|Table1|Table2|Table3|

