USE bikeshopdw;

SELECT COUNT(*) FROM purchase;

-- Question 1. Find the average purchase list price and sale price by state.
SELECT
    a.State,
    AVG(p.ListPrice) AS AvgListPrice,
    AVG(p.SalePrice) AS AvgSalePrice
FROM Purchase p
JOIN Store s ON p.StoreID = s.StoreID
JOIN Address a ON s.AddressID = a.AddressID
GROUP BY a.State
ORDER BY AvgListPrice DESC;

-- Question 2. Find the average purchase list price and sale price by store.
SELECT 
    s.StoreName,
    AVG(p.ListPrice) AS AvgListPrice,
    AVG(p.SalePrice) AS AvgSalePrice
FROM 
    Purchase p
JOIN 
    Store s ON p.StoreID = s.StoreID
GROUP BY 
    s.StoreName
ORDER BY 2 DESC;

-- Question 2a. For stores in Tennessee, how many stores are above the state average, and how many are below the state average?
WITH StateAverage AS (
    SELECT 
        AVG(p.ListPrice) AS AvgListPrice
    FROM Purchase p
    JOIN Store s ON p.StoreID = s.StoreID
    JOIN Address a ON a.AddressID = s.AddressID
    WHERE a.State = 'TN'
),
StoreAverages AS (
    SELECT 
        s.StoreName,
        AVG(p.ListPrice) AS StoreAvgListPrice
    FROM Purchase p
    JOIN Store s ON p.StoreID = s.StoreID
    JOIN Address a ON a.AddressID = s.AddressID
    WHERE a.State = 'TN'
    GROUP BY s.StoreName
)
SELECT 
    SUM(CASE WHEN StoreAvgListPrice > (SELECT AvgListPrice FROM StateAverage) THEN 1 ELSE 0 END) AS StoresAboveAverage,
    SUM(CASE WHEN StoreAvgListPrice < (SELECT AvgListPrice FROM StateAverage) THEN 1 ELSE 0 END) AS StoresBelowAverage
FROM StoreAverages;
-- From the output, the stores that are above average are 19, and the ones below average are 18.

-- 2c. Here, we get where Tennessee stores sit nationally.
WITH StateAverage AS (
    SELECT 
        a.State,
        AVG(p.ListPrice) AS AvgListPrice,
        AVG(p.SalePrice) AS AvgSalePrice,
        RANK() OVER (ORDER BY AVG(p.ListPrice) DESC) AS ListPriceRank
    FROM Purchase p
    JOIN Store s ON p.StoreID = s.StoreID
    JOIN Address a ON s.AddressID = a.AddressID
    GROUP BY a.State
)
SELECT 
    State,
    AvgListPrice,
    AvgSalePrice,
    ListPriceRank
FROM StateAverage
WHERE State = 'TN';
-- Tennessee had an AvgListprice of 2569.23461538 and ranks 34 out of 52.
-----

-- Question 3
-- 3A. Find the most popular paint color
SELECT 
    p.ColorName,
    COUNT(b.SerialNumber) AS Count
FROM Bicycle b
JOIN Paint p ON b.PaintID = p.PaintID
JOIN Purchase pu ON b.SerialNumber = pu.BicycleSerialNumber
GROUP BY p.ColorName
ORDER BY Count DESC
LIMIT 1;

-- The stores that sell the most of Arctic White
SELECT 
    s.StoreName,
    COUNT(pu.PurchaseID) AS Count
FROM Purchase pu
JOIN Bicycle b ON pu.BicycleSerialNumber = b.SerialNumber
JOIN Paint p ON b.PaintID = p.PaintID
JOIN Store s ON pu.StoreID = s.StoreID
WHERE p.ColorName = 'Arctic White'
GROUP BY s.StoreName
ORDER BY Count DESC
LIMIT 1;
-- The stores that sell the most of Arctic White is Walk-In with 1386

-- The stores that sell the least of Arctic White
SELECT 
    s.StoreName,
    COUNT(pu.PurchaseID) AS Count
FROM Purchase pu
JOIN Bicycle b ON pu.BicycleSerialNumber = b.SerialNumber
JOIN Paint p ON b.PaintID = p.PaintID
JOIN Store s ON pu.StoreID = s.StoreID
WHERE p.ColorName = 'Arctic White'
GROUP BY s.StoreName
HAVING Count = 1
ORDER BY Count ASC;
-- From the result i got, we see that there are actually
-- many stores with count as 1, that means that a lot of stores acutally have one of Arctic White.

-- 3b. For the least-popular paint color
SELECT
    p.ColorName,
    COUNT(b.SerialNumber) AS Count
FROM Bicycle b
JOIN Paint p ON b.PaintID = p.PaintID
JOIN Purchase pu ON b.SerialNumber = pu.BicycleSerialNumber
GROUP BY p.ColorName
ORDER BY Count ASC
LIMIT 1;
-- The least popular paint color is Candy stripe with a count of 489

-- B(i). What store sells the most of this color?
SELECT 
    s.StoreName,
    COUNT(pu.PurchaseID) AS Count
FROM Purchase pu
JOIN Bicycle b ON pu.BicycleSerialNumber = b.SerialNumber
JOIN Paint p ON b.PaintID = p.PaintID
JOIN Store s ON pu.StoreID = s.StoreID
WHERE p.ColorName = 'Candy Stripe'
GROUP BY s.StoreName
ORDER BY Count DESC
LIMIT 1;
-- The store that sells the most of this is Walk-In with 255

-- B(ii) What store sells the least of this color?
SELECT 
    s.StoreName,
    COUNT(pu.PurchaseID) AS Count
FROM Purchase pu
JOIN Bicycle b ON pu.BicycleSerialNumber = b.SerialNumber
JOIN Paint p ON b.PaintID = p.PaintID
JOIN Store s ON pu.StoreID = s.StoreID
WHERE p.ColorName = 'Candy Stripe'
GROUP BY s.StoreName
ORDER BY Count ASC;
-- The store that sells the least of Candy Stripe are plenty Like we had with Arctic White also.

-- ----------
-- QUESTION 4
-- Most popular part manufacturer
SELECT 
    DISTINCT p.ManufacturerName,
    COUNT(c.ComponentID) AS Count
FROM Component c
JOIN Part p ON c.PartID = p.PartID
WHERE c.ComponentID IS NOT NULL
GROUP BY p.ManufacturerName
ORDER BY Count DESC
LIMIT 1;
-- The most popular parts Manufacturer is Shimano (USA)

-- A
-- State Selling the Most of the Most Popular Manufacturer’s Parts
SELECT 
    a.State,
    COUNT(*) AS Count
FROM Part p
JOIN Component c ON c.PartID = p.PartID
JOIN Bicycle b ON b.SerialNumber = C.BicycleSerialNumber
JOIN Purchase pu ON b.SerialNumber = pu.BicycleSerialNumber
JOIN Store s ON pu.StoreID = s.StoreID
JOIN Address a ON s.AddressID = a.AddressID
WHERE p.ManufacturerName = 'Shimano (USA)'
GROUP BY a.State WITH ROLLUP
ORDER BY Count DESC;
-- State Selling the Most of the Most Popular Manufacturer’s Parts is CA with a count of 10715

-- B
SELECT 
    a.State,
    COUNT(*) AS Count
FROM Part p
JOIN Component c ON c.PartID = p.PartID
JOIN Bicycle b ON b.SerialNumber = C.BicycleSerialNumber
JOIN Purchase pu ON b.SerialNumber = pu.BicycleSerialNumber
JOIN Store s ON pu.StoreID = s.StoreID
JOIN Address a ON s.AddressID = a.AddressID
WHERE p.ManufacturerName = 'Shimano (USA)'
GROUP BY a.State WITH ROLLUP
ORDER BY Count ASC;
-- State Selling the Least of the Most Popular Manufacturer’s Parts is DELAWARE (DE) with 32. 

-- Question 4c - 
WITH MostPopularManufacturer AS (
    SELECT 
        p.ManufacturerName
    FROM Component c
    JOIN Part p ON c.PartID = p.PartID
    GROUP BY p.ManufacturerName
    ORDER BY COUNT(c.ComponentID) DESC
    LIMIT 1
)
SELECT 
    s.StoreName,
    COUNT(*) AS Count
FROM Part p
JOIN Component c ON c.PartID = p.PartID
JOIN Bicycle b ON b.SerialNumber = C.BicycleSerialNumber
JOIN Purchase pu ON b.SerialNumber = pu.BicycleSerialNumber
JOIN Store s ON pu.StoreID = s.StoreID
JOIN Address a ON s.AddressID = a.AddressID
WHERE p.ManufacturerName = 'Shimano (USA)'
AND s.StoreName NOT IN ('Walk-In', 'Direct Sales')
GROUP BY s.StoreName
ORDER BY Count DESC
LIMIT 1;
-- After we rightly ignore Walk-In and Direct Sales, the next store that sells the most part was
-- 	BUDGET PRO BICYCLES	with 588 records.
