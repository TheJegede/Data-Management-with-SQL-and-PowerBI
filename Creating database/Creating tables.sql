-- DROP DATABASE Lab3;

CREATE DATABASE Lab3;
USE Lab3;

CREATE TABLE employees (
    employee_id INT NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    extension VARCHAR(50),
    email_address VARCHAR(30),
    other_details VARCHAR(100),
    CONSTRAINT PRIMARY KEY (employee_id)
);

CREATE TABLE Asset_Types (
	asset_type_code INT NOT NULL,
    asset_type_description VARCHAR(20),
    CONSTRAINT PRIMARY KEY (asset_type_code)
    );

CREATE TABLE IT_Assets (
	asset_id INT NOT NULL,
    asset_type_code INT NOT NULL,
    description VARCHAR(25),
    other_details VARCHAR(100),
    CONSTRAINT PRIMARY KEY (asset_id),
    FOREIGN KEY (asset_type_code) REFERENCES Asset_Types(asset_type_code)
    );
    
-- DROP TABLE Employee_Assets;

CREATE TABLE Employee_Assets (
	asset_id INT NOT NULL,
    employee_id INT NOT NULL,
    date_out DATE NOT NULL,
    date_returned DATE,
    condition_out VARCHAR(50),
    condition_returned VARCHAR(50),
    other_details VARCHAR(100),
    CONSTRAINT PRIMARY KEY (date_out, employee_id, asset_id),
    CONSTRAINT FOREIGN KEY (employee_id) REFERENCES Employees(employee_id),
    CONSTRAINT FOREIGN KEY (asset_id) REFERENCES IT_Assets(asset_id)
);

-- SELECT * FROM Employee_Assets;
    
CREATE TABLE IT_Assets_Inventory (
	it_asset_inventory_id INT NOT NULL,
    asset_id INT NOT NULL, 
    inventory_date DATE,
    number_assigned INT,
    number_in_stock INT,
    other_details VARCHAR(100),
    CONSTRAINT PRIMARY KEY (it_asset_inventory_id),
    CONSTRAINT FOREIGN KEY (asset_id) REFERENCES IT_Assets(asset_id)
    );
  
SELECT * FROM employees;
SELECT * FROM Asset_Types;
SELECT * FROM IT_Assets;
SELECT * FROM Employee_Assets;
SELECT * FROM IT_Assets_Inventory;
