DROP DATABASE Lab3;

CREATE DATABASE Lab3;
USE Lab3;

CREATE TABLE employees (
    employee_id INT NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    extension VARCHAR(50),
    email_address VARCHAR(100),
    other_details VARCHAR(100),
    CONSTRAINT PRIMARY KEY (employee_id)
);

CREATE TABLE Asset_Types (
	asset_type_code INT NOT NULL,
    asset_type_description VARCHAR(50),
    CONSTRAINT PRIMARY KEY (asset_type_code)
    );

CREATE TABLE IT_Assets (
	asset_id INT NOT NULL,
    asset_type_code INT NOT NULL,
    description VARCHAR(50),
    other_details VARCHAR(100),
    CONSTRAINT PRIMARY KEY (asset_id),
    FOREIGN KEY (asset_type_code) REFERENCES Asset_Types(asset_type_code)
    );

CREATE TABLE Employee_Assets (
	asset_id INT NOT NULL,
    employee_id INT NOT NULL,
    date_out DATE NOT NULL,
    date_returned DATE NULL,
    condition_out VARCHAR(50),
    condition_returned VARCHAR(50),
    other_details VARCHAR(100),
    CONSTRAINT PRIMARY KEY (date_out),
    CONSTRAINT FOREIGN KEY (employee_id) REFERENCES Employees(employee_id),
    CONSTRAINT FOREIGN KEY (asset_id) REFERENCES IT_Assets(asset_id)
);
    
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
  
select * from IT_Assets_inventory
