# LITA_CAPSTONE_PROJECT2
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
The data used is Lita_Capstone_Dataset (CustomerData), which was shared by Ladies In Tech Africa (LITA) through LMS, to be downloaded by her enrolled Data Analysis Students for the Lita_Capstone_Project.

### Tools Used
---
- Microsoft Excel 
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
1. Data loading and Inspection
2. Verifying blank cells and Data Consistency
3. Data Cleaning and Formatting

### Exploratory Data Analysis
---
- Find subscription patterns
- What is the average subscription duration 
- Identify most popular subscription types


### Data Analysis
---

![Screenshot 2024-11-04 142307](https://github.com/user-attachments/assets/d5957d11-5c35-4040-90f2-b513702c938a)

![Screenshot 2024-11-04 140007](https://github.com/user-attachments/assets/6d35b1b8-4b00-4c7f-a256-75eb11fb8dfb)

![Screenshot 2024-11-04 141906](https://github.com/user-attachments/assets/ec17f651-af49-494d-af44-8dc0d6ed350e)

![Screenshot 2024-11-04 142206](https://github.com/user-attachments/assets/8d0761c5-7708-4622-9805-870403f13cf1)


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

![Screenshot 2024-11-04 140033](https://github.com/user-attachments/assets/bc64564d-28c8-40d9-98e5-953f829e253d)

![Screenshot 2024-11-04 141822](https://github.com/user-attachments/assets/0240e8a5-72b0-4ff8-90c4-750d6d202f8e)

![Screenshot 2024-11-04 141931](https://github.com/user-attachments/assets/372eba41-f15b-4f64-a1e9-6068fba79e9f)

![Screenshot 2024-11-04 224646](https://github.com/user-attachments/assets/b8184400-b6aa-4f30-85fc-c1cb3c94bfbf)

### Findings and Recommendations
- Basic is the most popular subscription type 
- Premium and Standard subscription types are only known in the South and West Regions respectively, while Basic is known in two regions (East and North).
- Less than 50% canceled their Basic subscriptions, while more than 50% canceled their Premium and Standard subscriptions, could it be that Premium and Standard does not meet customers satisfaction expectations?
- East generates highest revenue.

- The company should create a means of getting feedback from the customers, to know the actual reasons for their high cancelations, especially for Premium and Standard subscription types.
- Basic subscription type should be introduced/extended to South and West regions, since it has less cancelations and generates more revenue in the East.
