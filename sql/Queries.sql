/*Total Revenue*/

SELECT SUM(total_price) AS Total_Revenue from pizza_sales;

/*Average Order Value*/

SELECT SUM(total_price) / COUNT(DISTINCT order_id) as Avg_Order_Value from pizza_sales

/*Total Pizza Sold*/

SELECT  SUM(quantity) AS Total_Pizza_Sold from pizza_sales

/*Total Orders*/

SELECT COUNT(DISTINCT order_id) AS Total_orders from pizza_sales

/*Average pizzas per order*/

SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) / CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Avg_Pizzas_per_order from pizza_sales

/*DAILY TREND FOR TOTAL ORDERS-*/

SELECT DATENAME(DW, order_date) as order_day, COUNT(DISTINCT order_id) AS Total_orders from pizza_sales 
GROUP BY DATENAME(DW,order_date)

/*MONTHLY TREND FOR TOTAL ORDERS-*/

SELECT DATENAME(MONTH, order_date) AS Month_name, COUNT(DISTINCT order_id) AS Total_Order FROM pizza_sales 
GROUP BY DATENAME(MONTH, order_date) ORDER BY Total_Order DESC

/*PERCENTAGE OF SALES BY PIZZA CATEGORY-*/
SELECT pizza_category, sum(total_price) * 100 / (SELECT sum(total_price) AS Total_Sales_percentage from pizza_sales) from pizza_sales 
GROUP BY pizza_category

/*PERCENTAGE SALES BY PIZZA CATEGORY-*/

SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size
ORDER BY pizza_size

/*TOTAL PIZZA SOLD BY PIZZA CATEGORY-*/

SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
WHERE MONTH(order_date) = 2
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC

/*Top 5 Pizzas by Revenue*/

SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC

/*Bottom 5 Pizzas by Revenue*/

SELECT Top 5 pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC

/*Top 5 Pizzas by Quantity*/

SELECT Top 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold DESC

/*Bottom 5 Pizzas by Quantity*/

SELECT TOP 5 pizza_name, SUM(quantity) AS Total_Pizza_Sold
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Pizza_Sold ASC

/*Top 5 Pizzas by Total Orders*/

SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders DESC

/*Bottom 5 Pizzas by Total Orders*/

SELECT Top 5 pizza_name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Orders ASC






