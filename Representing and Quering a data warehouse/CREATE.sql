CREATE SCHEMA IF NOT EXISTS bikeshopdw;

USE bikeshopdw;

/* ===========================
UNCOMMENT THE BLOCK BELOW IF YOUR TABLES HAVE DATA!!!!!!
============================== */

-- -------------------------

-- SET foreign_key_checks = 0;

-- DELETE IGNORE FROM Purchase;
-- DELETE IGNORE FROM Component;
-- DELETE IGNORE FROM Employee;
-- DELETE IGNORE FROM Customer;
-- DELETE IGNORE FROM Store; 
-- DELETE IGNORE FROM Bicycle;
-- DELETE IGNORE FROM Paint;
-- DELETE IGNORE FROM Model;
-- DELETE IGNORE FROM Address;
-- DELETE IGNORE FROM Part;

-- SET foreign_key_checks = 1;

-- -------------------------

DROP TABLE IF EXISTS Purchase;
DROP TABLE IF EXISTS Component;
DROP TABLE IF EXISTS Employee;
DROP TABLE IF EXISTS Customer;
DROP TABLE IF EXISTS Store;
DROP TABLE IF EXISTS Bicycle;
DROP TABLE IF EXISTS Paint;
DROP TABLE IF EXISTS Model;
DROP TABLE IF EXISTS Address;
DROP TABLE IF EXISTS Part;

CREATE TABLE Model (
  ModelID INT NOT NULL,
  ModelName VARCHAR(50) NOT NULL,
  PRIMARY KEY (ModelID)  
);

CREATE TABLE Paint (
  PaintID INT NOT NULL,
  ColorName VARCHAR(50),
  ColorStyle VARCHAR(50),
  ColorList VARCHAR(50),
  DateIntroduced DATE, 
  PRIMARY KEY (PaintID)
);

CREATE TABLE Address (
  AddressID INT NOT NULL,
  Address VARCHAR(50),
  City VARCHAR(50),
  State VARCHAR(50),
  ZIP VARCHAR(50),
  Country VARCHAR(50),
  PRIMARY KEY (AddressID)
);

CREATE TABLE Bicycle (
  SerialNumber INT NOT NULL,
  ModelID INT,
  PaintID INT,
  FrameSize INT,
  PRIMARY KEY (SerialNumber),
  FOREIGN KEY (ModelID) REFERENCES Model(ModelID),
  FOREIGN KEY (PaintID) REFERENCES Paint(PaintID)
);

CREATE TABLE Customer (
  CustomerID INT NOT NULL,
  CustomerName VARCHAR(101),
  Phone VARCHAR(50),
  AddressID INT,
  PRIMARY KEY (CustomerID),
  FOREIGN KEY (AddressID) REFERENCES Address(AddressID)  
);

CREATE TABLE Store (
  StoreID INT NOT NULL,
  StoreName VARCHAR(50),
  Phone VARCHAR(50),
  AddressID INT,
  PRIMARY KEY (StoreID),
  FOREIGN KEY (AddressID) REFERENCES Address(AddressID)
);

CREATE TABLE Part (
  PartID INT NOT NULL,
  PartName VARCHAR(50),
  ManufacturerName VARCHAR(50),
  Description VARCHAR(100),
  ListPrice DECIMAL(38,4),
  EstimatedCost DECIMAL(38,4),
  PRIMARY KEY (PartID)
);

CREATE TABLE Employee (
  EmployeeID INT NOT NULL,
  EmployeeName VARCHAR(101),
  HomePhone VARCHAR(50),
  AddressID INT,
  HireDate DATE,
  PRIMARY KEY (EmployeeID),
  FOREIGN KEY (AddressID) REFERENCES Address(AddressID)
);

CREATE TABLE Component (
  ComponentID INT NOT NULL,
  BicycleSerialNumber INT,
  EmployeeID INT,
  PartID INT,
  Quantity INT,
  Cost DECIMAL(38,4),
  DateInstalled DATE,
  PRIMARY KEY (ComponentID),
  FOREIGN KEY (BicycleSerialNumber) REFERENCES Bicycle(SerialNumber),
  FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
  FOREIGN KEY (PartID) REFERENCES Part(PartID)
);

CREATE TABLE Purchase (
  PurchaseID INT NOT NULL,
  BicycleSerialNumber INT,
  CustomerID INT, 
  StoreID INT,
  EmployeeID INT,
  ListPrice DECIMAL(38,4),
  SalePrice DECIMAL(38,4),
  SalesTax DECIMAL(38,4),
  ShipPrice DECIMAL(38,4),
  OrderDate DATE,
  StartDate DATE,
  ShipDate DATE,
  PRIMARY KEY (PurchaseID),
  FOREIGN KEY (BicycleSerialNumber) REFERENCES Bicycle(SerialNumber),
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
  FOREIGN KEY (StoreID) REFERENCES Store(StoreID),
  FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);
