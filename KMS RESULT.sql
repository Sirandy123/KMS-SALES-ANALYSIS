SELECT * FROM [DBO].[KMS Sql Case Study_083603]
ALTER TABLE [KMS Sql Case Study_083603]
DROP COLUMN Product_Base_Margin

....CASE SCENERIO 1.....

....PRODUCT CATEGORY WITH HIGH SALES...

SELECT TOP 1 PRODUCT_CATEGORY, SUM(SALES) AS TOTAL_SALES
FROM [KMS Sql Case Study_083603]
GROUP BY PRODUCT_CATEGORY
ORDER BY TOTAL_SALES DESC

.... TOP 3 REGIONS IN TERMS OF SALES....

SELECT TOP 3 Region, SUM(SALES) AS Total_Sales
FROM [KMS Sql Case Study_083603]
GROUP BY REGION 
ORDER BY Total_Sales DESC

.... BOTTOM 3 REGION IN TERMS OF SALES....

SELECT TOP 3 Region, SUM(SALES) AS Total_Sales
FROM [KMS Sql Case Study_083603]
GROUP BY REGION 
ORDER BY Total_Sales ASC

....TOTAL SALES OF APPLIANCES IN ONTARIO...

SELECT Region AS Region,
Product_Sub_Category, 
SUM(SALES) AS TOTAL_SALES
FROM [KMS Sql Case Study_083603]
WHERE Product_Sub_Category = 'Appliances'
 AND Region = 'ONTARIO'
 GROUP BY Region, Product_Sub_Category


...ADVISE TO KMS ON WHAT TO DO TO INCREASE REVENUE FROM BOTTOM 10 CUSTOMER..... 

..1. Imrove customers experience for office supplies category:Review the delivery feedback and timeline for office supplies order and evaluate if delay or damages have affected customer 
....retention
..2. Re-engage inactive customer: check their experiences and treat delivery concern 
..3. Automate shipping relevance: Align shipping method with product type. Carryout a rule based shipping reasoning where product category and order priority dictates the most suitable
..shipping method.

...SHIPPING MODE WITH HIGHEST SHIPPING COST...

Select TOP 1 Ship_mode , Shipping_cost
FROM [KMS Sql Case Study_083603]
ORDER BY Shipping_cost DESC

...SHIPPING MODE WITH LOWEST SHIPPING COST...

Select TOP 1 Ship_mode , Shipping_cost
FROM [KMS Sql Case Study_083603]
ORDER BY Shipping_cost ASC

...CASE SCENERIO 2....

...MOST VALUABLE CUSTOMER AND THE PRODUCT THEY PURCHASE...

SELECT Customer_name, Customer_Segment, Product_Category, Product_Sub_Category, Product_Name,
SUM(SALES) AS TOTAL_SPENT
FROM [KMS Sql Case Study_083603]
GROUP BY Customer_name, Customer_Segment, Product_Category, Product_Sub_Category, Product_Name
ORDER BY TOTAL_SPENT DESC

...SMALL BUSINESS CUSTOMER THAT HAD THE HIGHEST SALES....

SELECT TOP 1 CUstomer_Name, Customer_Segment,  SUM(SALES) AS TOTAL_SALES
FROM [KMS Sql Case Study_083603]
WHERE Customer_Segment = 'Small Business'
group by Customer_Name, Customer_Segment
ORDER BY TOTAL_SALES DESC

....COROPORATE CUSTOMER WITH THE MOST NUMBER OF ORDERS IN 2009 - 2012....

SELECT TOP 2 Customer_Segment AS Customer_Segment, Customer_Name, 
COUNT(Order_Quantity) AS TOTAL_ORDERS
FROM  [KMS Sql Case Study_083603]
WHERE Customer_Segment = 'Corporate'
AND YEAR(Order_Date) BETWEEN 2009 AND 2012
GROUP BY Customer_Segment, Customer_Name
ORDER BY TOTAL_ORDERS DESC


....MOST PROFITABLE CUSTOMER...

SELECT TOP 1 Customer_Segment AS Customer_Segment, Customer_Name,
SUM(Profit) AS TOTAL_PROFIT
FROM  [KMS Sql Case Study_083603]
WHERE Customer_Segment = 'Consumer'
GROUP BY Customer_Segment, Customer_Name
ORDER BY TOTAL_PROFIT DESC


ALTER TABLE [KMS Sql Case Study_083603]
ADD REVENUE MONEY;

UPDATE [KMS Sql Case Study_083603]
SET REVENUE = UNIT_PRICE * ORDER_QUANTITY

SELECT TOP 10
  Order_ID, Customer_name, Customer_Segment, Region, province, Product_Category, Product_Sub_Category, Product_Name, Product_Container
  FROM [KMS Sql Case Study_083603]
  WHERE REVENUE IS NOT NULL
  ORDER BY REVENUE ASC

  ...CUSTOMER THAT RETURNED ITEMS AND THE SEGMENT THEY BELONG TO ....
  
  SELECT DISTINCT 
  ORDER_ID, CUSTOMER_NAME, CUSTOMER_SEGMENT
  FROM [KMS Sql Case Study_083603]


SELECT * FROM [dbo].[KMS Sql Case Study_083603]

...A. The delivery truck thou been eceonomical is at risk for late delivery and disfigure which could cause customers discontentment, Saving on cost at the expense of service quality
...B. The goods under low quality should be delivererd through delivery truck so as to minimize shipping cost for non urgent order

....MY ADVICE ....

....Use express air for urgent and some high priority orders
....Use regular air for priority orders 
....Delivery truck for low priority orders
This will help the company spend appropriately on shipping cost base on order priority

