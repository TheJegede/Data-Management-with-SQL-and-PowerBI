-- ##########################################################
--  CSCI 5000 - Data Management
-- 
--  Student Name:   Taiwo Jegede 
--  Student Enumber: E00755963
--  Student Email:   JEGEDETB@ETSU.EDU
-- 
-- ##########################################################

use bikeshop;
-- SELECT COUNT(*) FROM CUSTOMERTRANSACTION;
-- ##########################################################
--  PART 1: MODIFYING DATA
-- ----------------------------------------------------------
--  1: Jody Hagan Name Change
UPDATE Customer
SET Lastname='Hagan-Williams'
WHERE CUSTOMERID = 364;
-- The result I got: 1 row(s) affected Rows matched: 1  Changed: 1  Warnings: 0

-- ----------------------------------------------------------
--  2: Beatrix Schuba Retirement
UPDATE employee
SET DATERELEASED = '2024-04-30'
WHERE employeeid= 34192;
-- The result i got: 1 row(s) affected Rows matched: 1  Changed: 1  Warnings: 0

-- ----------------------------------------------------------
--  3: Adding yourself as an employee and taking over
--      Dennis Reid's Bicycles.
INSERT INTO employee (EMPLOYEEID, TAXPAYERID, LASTNAME, FIRSTNAME, HOMEPHONE, ADDRESS, DATEHIRED, CURRENTMANAGER, SALARYGRADE, SALARY, TITLE, WORKAREA)
VALUES (99999, '123-45-6789', 'Jegede', 'Taiwo', '(423) 676-1023', '1313 Seminole Dr', '2024-02-01', 'Susan Stenheim', 16, 40000.00, 'Purchasing Assistant', 'Purchase');
-- The result i got: 1 row(s) affected, 1 warning(s): 1366 Incorrect integer value: 'Susan Stenheim' for column 'CURRENTMANAGER' at row 1 
-- The currentmanager column is an integer and i am trying to input a Text. 


-- ----------------------------------------------------------
--  4: Joan Carter to Nadine Cole Mountain Bike Transfer
UPDATE Bicycle
SET CustomerID = 272, CUSTOMNAME = 'Nadine Cole'
WHERE CustomerID = 101 AND MODELTYPE = 'Mountain';
-- The result i got: 1 row(s) affected Rows matched: 1  Changed: 1  Warnings: 0

-- ----------------------------------------------------------
--  5: Delete Cro-moly True Temper Triangular Tube
DELETE FROM tubematerial
WHERE Tubeid = 240;

-- The result i got: Error Code: 1451. Cannot delete or update a parent row: a foreign key constraint fails (`bikeshop`.`biketubes`, CONSTRAINT `biketubes_ibfk_2` FOREIGN KEY (`TUBEID`) REFERENCES `tubematerial` (`TUBEID`))
-- Why: The Tubematerial table is referenced in two different tables, so i cannot delete it here first, i first have to delete it from those tables first.



-- ##########################################################
--  PART 2: REPORTING FROM THE DATA

-- ----------------------------------------------------------
--  1: Model Type Report
SELECT modeltype, COUNT(*) AS Count, AVG(Listprice) as AvgListPrice,
	AVG(saleprice) as AvgSalePrice, AVG(listprice - saleprice) as Difference
FROM bicycle
GROUP BY modeltype
ORDER BY Count DESC;
-- 7 row(s) returned

-- ----------------------------------------------------------
--  2: Mountain Bike Customer Report
-- select * from customer;
-- select * from customertransaction;
-- select * from bicycle;
SELECT
    c.LASTNAME AS CustomerLastName,
    c.FIRSTNAME AS CustomerFirstName,
    COUNT(b.Modeltype) AS MountainBikesPurchased,
    AVG(b.SALEPRICE + b.SALESTAX + b.Shipprice) AS AverageCost,
    SUM(b.SALEPRICE + b.SALESTAX + b.Shipprice) AS TotalCost
FROM CUSTOMER c
INNER JOIN Bicycle b ON b.CUSTOMERID = c.CUSTOMERID
WHERE b.ModelType = 'Mountain'
GROUP BY c.LASTNAME, c.FIRSTNAME
ORDER BY MountainBikesPurchased DESC,CustomerLastName ASC, CustomerFirstName ASC;
-- 5207 row(s) returned

-- ----------------------------------------------------------
--  3: Outstanding Balance Report
SELECT DISTINCT C.LASTNAME AS Lastname, C.FIRSTNAME as Firstname, C.ADDRESS, 
		CI.CITY, CI.STATE, SUM(CT.AMOUNT) as TotalAmountOwed, CI.ZIPCODE, C.PHONE
FROM CUSTOMER C
INNER JOIN CITY CI ON C.CITYID = CI.CITYID
INNER JOIN CUSTOMERTRANSACTION CT ON C.CUSTOMERID = CT.CUSTOMERID
WHERE CT.AMOUNT < 0
GROUP BY 1,2,3,4,5,7,8
ORDER BY Lastname, Firstname;
-- 18496 row(s) returned

-- ----------------------------------------------------------
--  4: Employee Bike Tracking Report
SELECT	B.SERIALNUMBER SERIALNUMBER, 
		B.MODELTYPE ModelType, 
        P.COLORNAME Color, 
        CONCAT(E.FIRSTNAME, ' ', E.LASTNAME) Painter,
		c.CATEGORY Category, 
        SUM(Bi.QUANTITY) TotalQuantity, 
        SUM(c.LISTPRICE * Bi.QUANTITY) AS TotalListPrice
FROM Bicycle B
JOIN Paint P ON B.PAINTID = p.PAINTID
JOIN Employee E ON E.EMPLOYEEID = B.PAINTER
JOIN BikeParts Bi ON B.SERIALNUMBER = Bi.SERIALNUMBER
JOIN Component C ON c.COMPONENTID = Bi.COMPONENTID
WHERE B.EMPLOYEEID = 99999
GROUP BY SERIALNUMBER, MODELTYPE, Color, Category
ORDER BY SERIALNUMBER, Category;
-- The result i got: 0 row(s) returned
-- The reason why i got 0 rows was because we could not filter by employeeid of 99999 because we could not update it above in the first part of the project.

-- ----------------------------------------------------------
--  5: Customers without Transactions Report
-- SELECT * FROM customertransaction;

SELECT CONCAT(c.FirstName, ' ', c.Lastname) as Name, c.Address, 
		ci.City, ci.State, Transactiondate, b.SERIALNUMBER, 
        b.modeltype, b.listprice
FROM Customer as C
INNER JOIN City ci ON c.CITYID = ci.CITYID
LEFT OUTER JOIN Customertransaction CT ON CT.Customerid = C.Customerid
LEFT OUTER JOIN Bicycle b ON b.Customerid = C.Customerid
WHERE CT.Customerid IS NULL
ORDER BY b.Listprice DESC;
-- The result i got: 6 row(s) returned 
