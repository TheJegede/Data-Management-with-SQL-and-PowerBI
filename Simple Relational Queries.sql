-- DROP DATABASE csci5000lab4;
CREATE DATABASE csci5000lab4;
USE csci5000lab4;

CREATE TABLE Persons (
	PersonID INT NOT NULL,
    FirstName VARCHAR(20),
    LastName VARCHAR(20),
    Email VARCHAR(50),
    CONSTRAINT PRIMARY KEY (PersonID)
);

CREATE TABLE Phones (
	PhoneID INT NOT NULL,
    PersonID INT NOT NULL,
    AreaCode INT,
    PhoneNumber VARCHAR(13),
	CONSTRAINT PRIMARY KEY (PhoneID),
    FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)    
);

CREATE TABLE Address (
	AddressID INT NOT NULL,
    PersonID INT NOT NULL,
    Street VARCHAR(50),
    City VARCHAR(20),
    State VARCHAR(20),
    ZipCode VARCHAR(7),
    CONSTRAINT PRIMARY KEY (AddressID),
    FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
);

INSERT INTO Persons (PersonID, FirstName, LastName, Email) VALUES (1, 'Taiwo', 'Jegede', 'taiwo@gmail.com');
INSERT INTO Persons (PersonID, FirstName, LastName, Email) VALUES (2, 'Kim', 'Car De-shane', 'kehindejay@gmail.com');
INSERT INTO Persons (PersonID, FirstName, LastName, Email) VALUES (3, 'Kanye', 'East', 'idowuadegmail.com');
INSERT INTO Persons (PersonID, FirstName, LastName, Email) VALUES (4, 'Martin', 'Luther-Price', 'juliusalaba@gmail.com');
INSERT INTO Persons (PersonID, FirstName, LastName, Email) VALUES (5, 'Justin', 'Woodlake', 'justinwood@gmail.com');

INSERT INTO Phones (PhoneID, PersonID, AreaCode, PhoneNumber) VALUES (1, 1, 423, '423.476.1024');
INSERT INTO Phones (PhoneID, PersonID, AreaCode, PhoneNumber) VALUES (2, 2, 423, '423.457.5065');
INSERT INTO Phones (PhoneID, PersonID, AreaCode, PhoneNumber) VALUES (3, 3, 423, '423.432.3721');
INSERT INTO Phones (PhoneID, PersonID, AreaCode, PhoneNumber) VALUES (4, 4, 423, '423.339.3910');
INSERT INTO Phones (PhoneID, PersonID, AreaCode, PhoneNumber) VALUES (5, 5, 423, '423.327.1469');

INSERT INTO Address (AddressID, PersonID, Street, City, State, ZipCode) VALUES (1, 4, '128 Seminole Dr', 'Johnson City', 'TN', '37601');
INSERT INTO Address (AddressID, PersonID, Street, City, State, ZipCode) VALUES (2, 3, '468 Buc Ridge', 'Johnson City', 'TN', '37615');
INSERT INTO Address (AddressID, PersonID, Street, City, State, ZipCode) VALUES (3, 5, '1312 Seminole Dr', 'Johnson City', 'TN', '37604');
INSERT INTO Address (AddressID, PersonID, Street, City, State, ZipCode) VALUES (4, 1, '714 Colony Park', 'Johnson City', 'TN', '37659');
INSERT INTO Address (AddressID, PersonID, Street, City, State, ZipCode) VALUES (5, 2, '429 N. Franklin Rd', 'Johnson City', 'TN', '37660');

SELECT * FROM Persons;
SELECT * FROM Phones;
SELECT * FROM Address;

UPDATE Persons
SET LastName = 'Timberlake', Email = 'justintimberlake@gmail.com'
WHERE PersonID=5;

DELETE FROM Address
WHERE AddressID = 5;

INSERT INTO Address (AddressID, PersonID, Street, City, State, ZipCode) VALUES (5, 5, 'N. Franklin Rd', 'Johnson City', 'TN', '37601');

DELETE FROM Phones
WHERE PhoneID = 5;

SELECT * FROM Persons
WHERE PersonID = 5;

SELECT * FROM Persons
ORDER BY PersonID DESC;
