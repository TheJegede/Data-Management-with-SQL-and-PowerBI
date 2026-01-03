-- Question 3
-- Find the most popular paint color
WITH ColorPopularity AS (
    SELECT 
        p.ColorName,
        COUNT(b.SerialNumber) AS Count
    FROM Bicycle b
    JOIN Paint p ON b.PaintID = p.PaintID
    JOIN Purchase pu ON b.SerialNumber = pu.BicycleSerialNumber
    GROUP BY p.ColorName
),
MostPopularColor AS (
    SELECT 
        ColorName
    FROM ColorPopularity
    ORDER BY Count DESC
    LIMIT 1
),
-- Find the store that sells the most of this color
MostSellingStore AS (
    SELECT 
        s.StoreName,
        COUNT(pu.PurchaseID) AS Count
    FROM Purchase pu
    JOIN Bicycle b ON pu.BicycleSerialNumber = b.SerialNumber
    JOIN Paint p ON b.PaintID = p.PaintID
    JOIN Store s ON pu.StoreID = s.StoreID
    WHERE p.ColorName = (SELECT ColorName FROM MostPopularColor)
    GROUP BY s.StoreName
    ORDER BY Count DESC
    LIMIT 1
),
-- Find the store that sells the least of this color
LeastSellingStore AS (
    SELECT 
        s.StoreName,
        COUNT(pu.PurchaseID) AS Count
    FROM Purchase pu
    JOIN Bicycle b ON pu.BicycleSerialNumber = b.SerialNumber
    JOIN Paint p ON b.PaintID = p.PaintID
    JOIN Store s ON pu.StoreID = s.StoreID
    WHERE p.ColorName = (SELECT ColorName FROM MostPopularColor)
    GROUP BY s.StoreName
    ORDER BY Count ASC
    LIMIT 1
)
SELECT 
    (SELECT ColorName FROM MostPopularColor) AS MostPopularColor,
    (SELECT StoreName FROM MostSellingStore) AS MostSellingStore,
    (SELECT StoreName FROM LeastSellingStore) AS LeastSellingStore;

 -- The most popular paint
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
-- 

-- 3b. For the least-popular paint color:
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

-- i. What store sells the most of this color?
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
-- The store that sells the least of this are plenty.

