USE Petstore;

select count(*) from customer;
select count(*) from merchandise;
select count(*) from supplier;
select count(*) from orders;
select count(*) from sales;
select count(*) from employee;
select count(*) from datelookup;
select count(*) from animal;

-- Quesiton A,B AND C 
SELECT 
    COALESCE(a.CATEGORY, 'Total') AS Category,
    COALESCE(c.STATE, 'Total') AS State,
    SUM(SalePrice) as TheTotalSales,
    SUM((s.QUANTITY * s.SALEPRICE) + s.SALESTAX) AS TotalPrice,
    SUM(s.QUANTITY) AS TotalQuantity
FROM SALES s
JOIN ANIMAL a ON s.ANIMALID = a.ANIMALID
JOIN CUSTOMER c ON s.CUSTOMERID = c.CUSTOMERID
GROUP BY a.CATEGORY, c.STATE WITH ROLLUP
ORDER BY TotalPrice DESC;
-- Total amount of animal sales is 32308.1800
-- The category of animal with the most sales was Dog 
-- The state with the most sales for Dog was KY with 2417.1200
-- 


-- ORDERS Queries
-- D
SELECT dl.MONTH,
    COUNT(o.ORDERID) AS TotalOrders,
    SUM(o.COST) AS TotalCost
FROM ORDERS o
JOIN DATELOOKUP dl ON o.ORDERDATE = dl.DATEID
GROUP BY dl.MONTH
ORDER BY TotalOrders DESC
LIMIT 1;
-- JAN had the highest number of Orders with 77 orders. Total cost of 7609.9900

-- E
SELECT s.NAME AS Supplier,
    COUNT(o.ORDERID) AS TotalOrders,
    SUM(o.COST) AS TotalCost
FROM ORDERS o
JOIN SUPPLIER s ON o.SUPPLIERID = s.SUPPLIERID
JOIN DATELOOKUP dl ON o.ORDERDATE = dl.DATEID
WHERE dl.MONTH = 'JAN'
GROUP BY s.NAME
ORDER BY TotalOrders DESC, TotalCost DESC
LIMIT 1;
-- The supplier was Lamb with a TotalOrders of 13, and a total cost of 1400.3800

-- F 
SELECT s.NAME AS Supplier,
    AVG(o.SHIPPINGCOST) AS AverageShippingCost
FROM ORDERS o
JOIN SUPPLIER s ON o.SUPPLIERID = s.SUPPLIERID
GROUP BY s.NAME
ORDER BY AverageShippingCost DESC
LIMIT 1;
-- Dillard was the supplier with the highest average shipping cost

-- G
SELECT s.STATE AS State,
    AVG(o.SHIPPINGCOST) AS AverageShippingCost
FROM ORDERS o
JOIN SUPPLIER s ON o.SUPPLIERID = s.SUPPLIERID
GROUP BY s.STATE
ORDER BY AverageShippingCost DESC
LIMIT 1;
-- The state that had the highest average shipping cost was SC

-- H
SELECT dl.MONTH,
    AVG(o.SHIPPINGCOST) AS AverageShippingCost
FROM ORDERS o
JOIN DATELOOKUP dl ON o.ORDERDATE = dl.DATEID
JOIN SUPPLIER s ON o.SUPPLIERID = s.SUPPLIERID
WHERE s.STATE = 'SC'
GROUP BY dl.MONTH
ORDER BY AverageShippingCost DESC
LIMIT 1;
-- March had the highest number of average shipping cost.