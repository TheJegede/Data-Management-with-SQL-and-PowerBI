# Data Management with SQL and PowerBI

A comprehensive repository showcasing data management, database design, and querying techniques using SQL. This project demonstrates practical implementation of relational databases, data warehouses, and complex SQL queries across various business scenarios.

## 📋 Table of Contents
- [Overview](#overview)
- [Repository Structure](#repository-structure)
- [Key Features](#key-features)
- [Technologies Used](#technologies-used)
- [Project Components](#project-components)
- [Use Cases](#use-cases)
- [Getting Started](#getting-started)
- [Contributing](#contributing)

## 🎯 Overview

This repository contains SQL scripts and database designs that demonstrate:
- **Database Creation and Management**: From scratch database setup with proper schema design
- **Relational Database Design**: Implementation of normalized database structures with proper relationships
- **Data Warehouse Implementation**: Star schema design and OLAP query patterns
- **Advanced SQL Queries**: Complex joins, aggregations, subqueries, and analytical queries
- **Real-world Business Scenarios**: Theater management, bike shop operations, pet store analytics, and more

## 📁 Repository Structure

```
Data-Management-with-SQL-and-PowerBI/
│
├── Creating database/
│   ├── Creating database (2).sql
│   ├── Creating tables.sql
│   ├── Dropping, creating satabase.sql
│   └── SQL
│
├── Representing and Quering a data warehouse/
│   ├── CREATE.sql
│   ├── Queries.sql
│   ├── paint question.sql
│   └── parts manufacturer.sql
│
├── Updating and reporting from a relational database/
│   ├── BikeShop_Create.sql
│   ├── Creating tables.sql
│   ├── Insertion, updating.sql
│   ├── Project3_BikeShop_Alters.sql
│   ├── city.sql
│   ├── customer.sql
│   ├── customertransaction.sql
│   └── employee.sql
│
├── Complex Relational Queries.sql
├── Creating a data warehouse database.sql
├── Creating complex relational database.sql
├── Data Warehouse Queries.sql
├── ERD Diagram.pdf
├── Relational Database creation and import.sql
└── Simple Relational Queries.sql
```

## ✨ Key Features

### 1. **Database Design & Creation**
- Schema design with proper normalization
- Table creation with constraints (Primary Keys, Foreign Keys)
- Database initialization and setup scripts

### 2. **Relational Database Operations**
- **Simple Queries**: Basic CRUD operations (Create, Read, Update, Delete)
- **Complex Queries**: Multi-table joins, nested subqueries, aggregations
- **Data Integrity**: Foreign key relationships and referential integrity

### 3. **Data Warehouse Implementation**
- Star schema design for analytical processing
- Dimension and fact table structures
- OLAP queries with ROLLUP for hierarchical aggregations
- Time-based analysis using date dimensions

### 4. **Real-World Business Applications**
- **Theater Management System**: Ticket sales, performances, memberships, donations
- **Bike Shop Database**: Customer transactions, inventory, employees
- **Pet Store Analytics**: Sales analysis by category, state, supplier orders
- **Parts Manufacturing**: Supply chain and inventory management

## 🛠️ Technologies Used

- **SQL** (MySQL/MariaDB syntax)
- **Database Design**: Entity-Relationship Diagrams (ERD)
- **Data Modeling**: Star Schema, Snowflake Schema
- **SQL Features**:
  - JOIN operations (INNER, LEFT, RIGHT)
  - Aggregate functions (SUM, COUNT, AVG)
  - GROUP BY with ROLLUP
  - Subqueries and CTEs
  - Window functions

## 📊 Project Components

### 1. Creating Database
Basic database operations including:
- Database creation and dropping
- Table creation with proper data types
- Establishing relationships between tables

### 2. Simple Relational Queries
Demonstrates fundamental SQL operations:
```sql
- INSERT, UPDATE, DELETE statements
- SELECT with WHERE clauses
- ORDER BY operations
- Basic table relationships
```

### 3. Complex Relational Queries
Advanced querying techniques on a theater management system:
- Finding subscribers who bought tickets with complete address information
- Calculating total donation values by sponsors
- Identifying members with unpaid dues
- Multi-table joins across 11+ tables
- Seat availability checking for specific performances

**Sample Query Highlights:**
- Total value of ticket sales for productions
- Subscriber information with geographic data
- Member participation tracking in productions
- Donation analysis by sponsor

### 4. Data Warehouse Implementation
**Pet Store Data Warehouse** with analytical queries:
- **Sales Analysis**: By animal category and state
- **Order Analytics**: Monthly trends and supplier performance
- **Shipping Cost Analysis**: By supplier and state
- **ROLLUP Aggregations**: Hierarchical totals and subtotals

**Key Metrics:**
- Total sales revenue: $32,308.18
- Top-selling category: Dogs
- Highest sales state for dogs: KY ($2,417.12)
- Peak order month: January (77 orders, $7,609.99)

### 5. Bike Shop Database
Comprehensive relational database featuring:
- Customer management with city relationships
- Employee records
- Transaction tracking
- Inventory and sales reporting
- ALTER statements for schema modifications

## 💼 Use Cases

### Theater Management
- Track performances, plays, and productions
- Manage member subscriptions and dues
- Record ticket sales and seat assignments
- Monitor donations and sponsorships

### Retail Operations (Bike Shop)
- Customer relationship management
- Transaction processing
- Employee management
- Geographic data (city-based operations)

### E-commerce Analytics (Pet Store)
- Sales performance by product category
- Geographic sales distribution
- Supplier order management
- Shipping cost optimization
- Temporal sales trends

## 🚀 Getting Started

### Prerequisites
- MySQL, MariaDB, or compatible SQL database server
- SQL client (MySQL Workbench, DBeaver, or command-line client)

### Installation Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/TheJegede/Data-Management-with-SQL-and-PowerBI.git
   cd Data-Management-with-SQL-and-PowerBI
   ```

2. **Set up databases**
   
   For basic database creation:
   ```bash
   mysql -u your_username -p < "Creating database/Dropping, creating satabase.sql"
   mysql -u your_username -p < "Creating database/Creating tables.sql"
   ```

   For data warehouse:
   ```bash
   mysql -u your_username -p < "Creating a data warehouse database.sql"
   ```

   For complex relational database:
   ```bash
   mysql -u your_username -p < "Creating complex relational database.sql"
   ```

3. **Run queries**
   
   Execute query files to explore the data:
   ```bash
   mysql -u your_username -p < "Simple Relational Queries.sql"
   mysql -u your_username -p < "Complex Relational Queries.sql"
   mysql -u your_username -p < "Data Warehouse Queries.sql"
   ```

### Database Setup Order

1. **Start with Basic Database Creation**
   - Navigate to `Creating database/` folder
   - Run database creation scripts first

2. **Build Relational Databases**
   - Use `Creating complex relational database.sql` for theater system
   - Use files in `Updating and reporting from a relational database/` for bike shop

3. **Set up Data Warehouse**
   - Execute `Creating a data warehouse database.sql`
   - Run analytical queries from `Data Warehouse Queries.sql`

4. **Explore ERD**
   - Review `ERD Diagram.pdf` for visual database structure

## 📈 Learning Outcomes

This repository demonstrates proficiency in:
- ✅ Database design and normalization
- ✅ SQL DDL (Data Definition Language) operations
- ✅ SQL DML (Data Manipulation Language) operations
- ✅ Complex multi-table queries
- ✅ Aggregate functions and grouping
- ✅ Subquery techniques
- ✅ Data warehouse design patterns
- ✅ OLAP query patterns with ROLLUP
- ✅ Real-world business problem solving
- ✅ Data integrity and constraint management

## 🤝 Contributing

Contributions, issues, and feature requests are welcome! Feel free to check the issues page or submit a pull request.

## 📧 Contact

**Taiwo Jegede** - [@TheJegede](https://github.com/TheJegede)

Project Link: [https://github.com/TheJegede/Data-Management-with-SQL-and-PowerBI](https://github.com/TheJegede/Data-Management-with-SQL-and-PowerBI)

---

⭐ Star this repository if you found it helpful!

## 📝 Notes

- All SQL scripts are written for MySQL/MariaDB
- Some scripts may require adjustments for other SQL dialects (PostgreSQL, SQL Server, Oracle)
- Large data files (city.sql, customer.sql, customertransaction.sql) contain substantial insert statements
- ERD diagram provides visual representation of database relationships

## 🔍 Additional Resources

- Review the ERD Diagram for understanding table relationships
- Each SQL file is well-commented with question numbers and explanations
- Query results and business insights are documented as SQL comments