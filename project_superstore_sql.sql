SELECT DISTINCT DATE_TRUNC ('year', "OrderDate") AS year
FROM public.mytable;

SELECT DISTINCT DATE_TRUNC ('year', "OrderDate") AS year, 
SUM("Sales") AS total_sales,
SUM("Profit") AS total_profit
FROM public.mytable
GROUP BY 1
ORDER BY 1;

SELECT date_part('year',"OrderDate") AS year,
	CASE
		WHEN date_part('month',"OrderDate") in (1,2,3) THEN 'Q1'
		WHEN date_part('month',"OrderDate") in (4,5,6) THEN 'Q2'
		WHEN date_part('month',"OrderDate") in (7,8,9) THEN 'Q3'
	ELSE 'Q4'
	END AS quater,
SUM("Sales") AS total_sales,
SUM("Profit") AS total_profit
FROM public.mytable
GROUP BY 1, quater
ORDER BY 1, quater;	


SELECT "City", ROUND((SUM("Profit")/SUM("Sales"))*100,2) AS profit_margin,
SUM("Sales") AS total_sales,
SUM("Profit") AS total_profit
FROM public.mytable
GROUP BY 1
ORDER BY 4 DESC
LIMIT 10;

SELECT "Discount", AVG("Sales") AS avg_sales
FROM public.mytable
GROUP BY 1
ORDER BY 1;


SELECT "Category", 
SUM("Sales") AS total_sales,
SUM("Profit") AS total_profit, 
ROUND((SUM("Profit")/SUM("Sales"))*100,2) AS profit_margin
FROM public.mytable
GROUP BY 1
ORDER BY 3 DESC;

SELECT "Region", "Category", 
SUM("Sales") AS total_sales,
SUM("Profit") AS total_profit, 
ROUND((SUM("Profit")/SUM("Sales"))*100,2) AS profit_margin
FROM public.mytable
GROUP BY 1,2
ORDER BY 4 DESC;

SELECT "State", "Category", 
SUM("Sales") AS total_sales,
SUM("Profit") AS total_profit, 
ROUND((SUM("Profit")/SUM("Sales"))*100,2) AS profit_margin
FROM public.mytable
GROUP BY 1,2
ORDER BY 4 DESC;

SELECT "State", "Category", 
SUM("Sales") AS total_sales,
SUM("Profit") AS total_profit, 
ROUND((SUM("Profit")/SUM("Sales"))*100,2) AS profit_margin
FROM public.mytable
GROUP BY 1,2
ORDER BY 4 ASC;

SELECT "State", "Category", "Sub_Category",
SUM("Sales") AS total_sales,
SUM("Profit") AS total_profit, 
ROUND((SUM("Profit")/SUM("Sales"))*100,2) AS profit_margin
FROM public.mytable
GROUP BY 1,2,3
ORDER BY 5 DESC;

SELECT "Sub_Category","ProductName",
SUM("Sales") AS total_sales,
SUM("Profit") AS total_profit, 
ROUND((SUM("Profit")/SUM("Sales"))*100,2) AS profit_margin
FROM public.mytable
GROUP BY 1,2
ORDER BY 4 DESC;

SELECT "Sub_Category","ProductName",
SUM("Sales") AS total_sales,
SUM("Profit") AS total_profit, 
ROUND((SUM("Profit")/SUM("Sales"))*100,2) AS profit_margin
FROM public.mytable
GROUP BY 1,2
ORDER BY 4 ASC;

SELECT "Sub_Category",
SUM("Sales") AS total_sales,
SUM("Profit") AS total_profit
FROM public.mytable
GROUP BY 1
ORDER BY 3 DESC;

SELECT COUNT( DISTINCT "CustomerID")
FROM public.mytable; -- 793

SELECT "Region",
COUNT( DISTINCT "CustomerID")
FROM public.mytable
GROUP BY 1
ORDER BY 2 DESC;

SELECT date_part('year',"OrderDate") AS year, "State", "City",
COUNT( DISTINCT "CustomerID")
FROM public.mytable
GROUP BY 1,2,3
ORDER BY 4 DESC;


SELECT "CustomerID",
SUM("Sales") AS total_sales,
SUM("Profit") AS total_profit
FROM public.mytable
GROUP BY 1
ORDER BY 2 DESC
LIMIT 15;

SELECT round(avg(extract(epoch FROM "ShipDate" - "OrderDate") / 86400), 1) AS avg_days
FROM public.mytable;

SELECT "ShipMode", round(avg(extract(epoch FROM "ShipDate" - "OrderDate") / 86400), 1) AS avg_days
FROM public.mytable
GROUP BY 1;








