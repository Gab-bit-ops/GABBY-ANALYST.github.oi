create database orders;

use orders;

CREATE TABLE ORDERS (
    REF_NO CHAR(14) NOT NULL,
    ORD_DTE DATE NOT NULL DEFAULT '1990-01-01',
    CUST_NAME VARCHAR(50) NOT NULL,
    CATEGORY VARCHAR(20) NOT NULL,
    PRODUCT VARCHAR(20) NOT NULL,
    SALES DECIMAL(18, 5),
    PROFIT DECIMAL(18, 5)
);

INSERT INTO ORDERS VALUES
 ('CA-2012-124891', '2012-07-31', 'Rick Hansen', 'Technology', 'Accessories', 2309.65, 762.1845), 
('CA-2014-135909', '2014-10-14', 'Jane Waco', 'Office Supplies', 'Binders', 5083.96, 1906.485), 
 ('CA-2012-116638', '2012-01-28', 'Joseph Holt', 'Furniture', 'Tables', 4297.644, -1862.3124), 
 ('CA-2014-143567', '2014-03-11', 'Thomas Boland', 'Technology', 'Accessories', 2249.91, 517.4793), 
 ('CA-2011-154627', '2011-10-29', 'Sue Ann Reed', 'Technology', 'Phones', 2735.952, 341.994), 
 ('CA-2013-159016', '2013-03-11', 'Karen Ferguson', 'Technology', 'Phones', 4158.912, 363.9048),  
 ('CA-2012-139731', '2012-10-15', 'Joel Eaton', 'Furniture', 'Chairs', 2453.43, -350.49), 
 ('CA-2011-168494', '2011-12-12', 'Nora Preis', 'Furniture', 'Tables', 3610.848, 135.4068),  
 ('CA-2011-160766', '2011-09-14', 'Darrin Martin', 'Technology', 'Machines', 2799.96, 1371.9804), 
 ('US-2014-168116', '2014-11-05', 'Grant Thornton', 'Technology', 'Machines', 7999.98, -3839.9904),  
 ('CA-2011-116904', '2011-09-23', 'Sanjit Chand', 'Office Supplies', 'Binders', 9449.95, 4630.4755),  
 ('US-2012-163825', '2012-06-16', 'Lena Creighton', 'Office Supplies', 'Binders', 3050.376, 1143.891), 
 ('US-2014-135013', '2014-07-25', 'Harold Ryan', 'Technology', 'Copiers', 2399.96, 839.986),
 ('CA-2012-111829', '2012-03-19', 'Fred Hopkins', 'Technology', 'Copiers', 3149.93, 1480.4671), 
 ('CA-2014-129021', '2014-08-24', 'Patrick Brill', 'Technology', 'Phones', 4367.896, 327.5922), 
 ('CA-2012-114811', '2012-11-08', 'Keith Dawkins', 'Technology', 'Machines', 4643.8, 2229.024), 
 ('CA-2013-143805', '2013-12-02', 'Jonathan Doherty', 'Office Supplies', 'Appliances', 2104.55, 694.5015), 
 ('CA-2012-145352', '2012-03-16', 'Christopher Martinez', 'Office Supplies', 'Binders', 6354.95, 3177.475), 
 ('CA-2014-138289', '2014-01-17', 'Andy Reiter', 'Office Supplies', 'Binders', 5443.96, 2504.2216),
 ('CA-2014-118892', '2014-08-18', 'Tom Prescott', 'Furniture', 'Chairs', 4416.174, -630.882),  
 ('US-2012-163825', '2012-06-16', 'Lena Creighton', 'Office Supplies', 'Binders', 3050.376, 1143.891), 
 ('CA-2012-114811', '2012-11-08', 'Keith Dawkins', 'Technology', 'Machines', 4643.8, 2229.024);


------------ QUESTIONS AND ANSWERS ------------------------

-------------- 1. Retrieve all records from the ORDERS table.

	 Select * FROM ORDERS;
 
-------------- 2. Display REF_NO, CUST_NAME, PRODUCT, SALES for all orders.

	 Select REF_NO, CUST_NAME, PRODUCT, SALES 
	 from ORDERS;
 
-------------- 3. List all orders where SALES is greater than 5000.
	Select *
	FROM ORDERS
	WHERE SALES > "5000";

-------------- 4. Show all orders where CATEGORY = 'Furniture'.
	Select *
	FROM ORDERS
	WHERE CATEGORY = "Furniture";

-------------- 5. Retrieve all orders where ORD_DTE is after 2013-01-01.
	Select *
	FROM ORDERS
	WHERE ORD_DTE > " 2013-01-01";


-------------- 6. Get all customers whose names start with 'A'.

	Select *
	FROM ORDERS
	WHERE CUST_NAME LIKE  'A%';

-------------- 7. List all orders of products containing the word ‘Table’.
	Select *
    FROM ORDERS
	WHERE PRODUCT like 'Table%';
    
-------------- 8. Show the top 10 highest SALES orders.
	SELECT SALES
    FROM ORDERS 
    ORDER by  SALES DESC
    LIMIT 10;
-------------- 9. Retrieve orders sorted by ORD_DTE descending.

	SELECT * 
    FROM ORDERS
    ORDER BY ORD_DTE DESC;


-------------- 10. Find the total SALES.
	SELECT ROUND(SUM(SALES), 2) AS SUM_OF_SALES
    FROM ORDERS;
    
    
-------------- 11. Find the total PROFIT.
	SELECT ROUND(SUM(PROFIT), 2) AS SUM_OF_SALES
    FROM ORDERS;
-------------- 12. Count how many orders belong to each CATEGORY.
		SELECT DISTINCT(CATEGORY), COUNT(*) AS COUNT
        FROM ORDERS
        GROUP BY CATEGORY;
	
-------------- 13. Find the average SALES by CATEGORY.
	SELECT CATEGORY, ROUND(avg(SALES),2) AS AVG_SALES
        FROM ORDERS
        GROUP BY CATEGORY;
        
-------------- 14. Show the maximum and minimum SALES per PRODUCT.

	SELECT PRODUCT, ROUND(MAX(SALES),2) AS MAX_SALES
    FROM ORDERS
    GROUP BY PRODUCT;
    
    	SELECT PRODUCT, ROUND(MIN(SALES),2) AS MIN_SALES
		FROM ORDERS
		GROUP BY PRODUCT;


-------------- 15. Display CATEGORY, total SALES, and total PROFIT grouped by CATEGORY.

	Select 
    CATEGORY, 
    ROUND(SUM(SALES), 2) AS SUM_OF_SALES, 
    ROUND(SUM(PROFIT), 2) AS SUM_OF_PROFIT
    FROM ORDERS
    GROUP BY CATEGORY;
    
-------------- 16. Find the number of orders per CUSTOMER.

	SELECT  CUST_NAME, COUNT(*) AS PER_ORDERS
    FROM ORDERS
    GROUP BY  CUST_NAME
    ORDER BY COUNT(*) DESC;

-------------- 17.Find the total sales per month (use MONTH or EXTRACT function).

	SELECT (MONTH(ORD_DTE)) AS MONTH,
    ROUND(SUM(SALES), 2) AS TOTAL_SALES
    FROM ORDERS
    GROUP BY MONTH(ORD_DTE)
    ORDER BY MONTH DESC;
	


-------------- 18. Retrieve orders made in the year 2013.
		SELECT 
        YEAR(ORD_DTE) AS YEAR, COUNT(*) AS COUNT
        FROM ORDERS
        WHERE YEAR(ORD_DTE) = 2013
        GROUP BY YEAR;
        
-------------- 19. Find day-wise sales summary.

	SELECT DAY(ORD_DTE) AS DAY, MONTH(ORD_DTE) AS MONTH,
    ROUND(SUM(SALES), 2) SUM_SALES
    FROM ORDERS
    GROUP BY DAY, MONTH;
    
-------------- 20. Get orders placed in the last 30 days from today.

	SELECT MAX(ORD_DTE) 
    FROM ORDERS;
    
	SELECT * FROM ORDERS
    WHERE ORD_DTE > (SELECT MAX(ORD_DTE) FROM ORDERS) - INTERVAL 30 DAY;
    
	
-------------- 21.Extract and display year, month, day from ORD_DTE.
		SELECT YEAR(ORD_DTE) AS YEAR, 
        MONTH(ORD_DTE) AS MONTH,
        DAY(ORD_DTE) AS DAY 
        FROM ORDERS;