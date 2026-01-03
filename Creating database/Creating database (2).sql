CREATE DATABASE csci5000lab4;

USE csci5000lab4;

CREATE TABLE Persons (
	PersonID INT NOT NULL,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(50),
    CONSTRAINT PRIMARY KEY (PersonID)
);

CREATE TABLE Phones (
	PhoneID INT NOT NULL,
    PersonID INT NOT NULL,
    AreaCode INT,
    PhoneNumber VARCHAR(50),
	CONSTRAINT PRIMARY KEY (PhoneID),
    FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)    
);

CREATE TABLE Address (
	AddressID INT NOT NULL,
    PersonID INT NOT NULL,
    Street VARCHAR(50),
    City VARCHAR(20),
    State VARCHAR(20),
    ZipCode VARCHAR(12),
    CONSTRAINT PRIMARY KEY (AddressID),
    FOREIGN KEY (PersonID) REFERENCES Persons(PersonID)
);

INSERT INTO Persons (PersonID, FirstName, LastName, Email) VALUES (1, 'Taiwo', 'Jegede', 'taiwo@gmail.com');
INSERT INTO Persons (PersonID, FirstName, LastName, Email) VALUES (2, 'Kehinde', 'Jagun', 'kehindejay@gmail.com');
INSERT INTO Persons (PersonID, FirstName, LastName, Email) VALUES (3, 'Idowu', 'Aderibigbe', 'idowuadegmail.com');
INSERT INTO Persons (PersonID, FirstName, LastName, Email) VALUES (4, 'Alaba', 'Julius', 'juliusalaba@gmail.com');
INSERT INTO Persons (PersonID, FirstName, LastName, Email) VALUES (5, 'Justin', 'Woodlake', 'justinwood@gmail.com');

INSERT INTO Phones (PhoneID, PersonID, AreaCode, PhoneNumber) VALUES (1, 1, 423, '423.476.1024');
INSERT INTO Phones (PhoneID, PersonID, AreaCode, PhoneNumber) VALUES (2, 2, 423, '423.457.5065');
INSERT INTO Phones (PhoneID, PersonID, AreaCode, PhoneNumber) VALUES (3, 3, 423, '423.432.3721');
INSERT INTO Phones (PhoneID, PersonID, AreaCode, PhoneNumber) VALUES (4, 4, 423, '423.339.3910');
INSERT INTO Phones (PhoneID, PersonID, AreaCode, PhoneNumber) VALUES (5, 5, 423, '423.327.1469');

INSERT INTO Address (AddressID, PersonID, Street, City, State, ZipCode) VALUES (1, 1, '128 Elm Street', 'Johnson City', 'TN', '37601');
INSERT INTO Address (AddressID, PersonID, Street, City, State, ZipCode) VALUES (2, 2, '468 Maple Avenue', 'Johnson City', 'TN', '37615');
INSERT INTO Address (AddressID, PersonID, Street, City, State, ZipCode) VALUES (3, 3, '1312 Seminole Dr', 'Johnson City', 'TN', '37604');
INSERT INTO Address (AddressID, PersonID, Street, City, State, ZipCode) VALUES (4, 4, '714 Pine Road', 'Johnson City', 'TN', '37659');
INSERT INTO Address (AddressID, PersonID, Street, City, State, ZipCode) VALUES (5, 5, '429 Cedar Drive', 'Johnson City', 'TN', '37660');

SELECT * FROM Persons;
SELECT * FROM Phones;
SELECT * FROM Address;

UPDATE Persons
SET LastName = 'Timberlake'
WHERE PersonID=5;

DELETE FROM Address
WHERE AddressID = 5;

INSERT INTO Address (AddressID, PersonID, Street, City, State, ZipCode) VALUES (5, 5, '429 Cedar Drive', 'Johnson City', 'TN', '37660');

DELETE FROM Phones
WHERE PhoneID = 5;

SELECT * FROM Persons
WHERE PersonID = 5;

SELECT * FROM Persons
ORDER BY PersonID DESC;
