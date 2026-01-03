-- Question 4

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

-- b
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