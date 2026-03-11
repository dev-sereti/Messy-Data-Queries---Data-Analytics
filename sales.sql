/*
============================================================
POSTGRESQL DATA CLEANING PRACTICE DATABASE
============================================================

This script creates a messy dataset for practicing:

• SQL Data Cleaning
• Data Transformation
• Data Quality Checks
• Joins
• Aggregations
• Window Functions
• Data Engineering Pipelines

Tables Included:
1. customers
2. products
3. orders
4. order_items
5. employees

The data intentionally contains:
• duplicate records
• typos
• inconsistent casing
• null values
• invalid emails
• inconsistent date formats
• inconsistent city names
• missing values
============================================================
*/

------------------------------------------------------------
-- STEP 1: CREATE DATABASE
------------------------------------------------------------

CREATE DATABASE sql_practice_messy;

-- Connect to database
-- (Run separately if using pgAdmin)
-- \c sql_practice_messy;

------------------------------------------------------------
-- STEP 2: CREATE SCHEMA
------------------------------------------------------------

CREATE SCHEMA practice;

SET search_path TO practice;

------------------------------------------------------------
-- STEP 3: CUSTOMERS TABLE
------------------------------------------------------------

CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    phone VARCHAR(30),
    city VARCHAR(50),
    signup_date DATE
);

------------------------------------------------------------
-- STEP 4: INSERT MESSY CUSTOMER DATA
------------------------------------------------------------

INSERT INTO customers (first_name,last_name,email,phone,city,signup_date) VALUES
('John','Doe','john.doe@email.com','0712345678','New York','2022-01-10'),
('john','doe','JOHN.DOE@email.com','0712345678','new york','2022-01-10'), -- duplicate
('Mary','Smith','marysmith@email.com','0723456789','Los Angeles','2021-05-11'),
('Peter','Johnson','peter.j@email','0734567890','Chicago','2020-03-20'), -- invalid email
('Anne','Brown',NULL,'0745678901','Houston','2019-11-02'), -- missing email
('Mike','Davis','mike.davis@email.com',NULL,'Phoenix','2022-02-15'), -- missing phone
('Sara','Wilson','sara.wilson@email.com','0756789012','Chciago','2021-08-14'), -- typo city
('David','Lee',' david.lee@email.com ','0767890123','San Francisco','2022-04-22'), -- spaces
('Linda','Taylor','linda.taylor@email.com','0778901234','Los angeles','2023-01-01'),
('James','Anderson','j.anderson@email.com','0789012345','Seattle','2022-12-11'),
('Emily','Thomas','emily.thomas@email.com','0790123456','Seattle','2023-03-15'),
('Chris','Martin','cmartin@email.com','0701234567','Boston','2021-07-07'),
('Chris','Martin','cmartin@email.com','0701234567','Boston','2021-07-07'); -- duplicate

------------------------------------------------------------
-- STEP 5: PRODUCTS TABLE
------------------------------------------------------------

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price NUMERIC(10,2),
    created_at DATE
);

------------------------------------------------------------
-- INSERT MESSY PRODUCTS
------------------------------------------------------------

INSERT INTO products (product_name,category,price,created_at) VALUES
('Laptop','Electronics',1200,'2022-01-01'),
('laptop','electronics',1200,'2022-01-01'), -- duplicate
('Phone','Electronics',800,'2022-03-05'),
('Tablet','Electronics',NULL,'2022-05-10'), -- missing price
('Headphones','Electronics',150,'2022-06-10'),
('Office Chair','Furniture',300,'2021-09-10'),
('Desk','Furniture',450,'2021-10-01'),
('Monitor','Electronics',NULL,'2022-08-11'),
('Keyboard','electronics',50,'2022-07-01'),
('Mouse','Electronics',30,'2022-07-02'),
('Mouse ','Electronics',30,'2022-07-02'); -- trailing space

------------------------------------------------------------
-- STEP 6: ORDERS TABLE
------------------------------------------------------------

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_status VARCHAR(30),
    total_amount NUMERIC(10,2)
);

------------------------------------------------------------
-- INSERT MESSY ORDERS
------------------------------------------------------------

INSERT INTO orders (customer_id,order_date,order_status,total_amount) VALUES
(1,'2023-01-01','Completed',1500),
(2,'2023-01-02','completed',1500), -- casing
(3,'2023-01-03','Pending',800),
(4,'2023-01-04','Shipped',1200),
(5,'2023-01-05','Cancelled',NULL),
(6,'2023-01-06','Completed',900),
(7,'2023-01-07','completed ',900), -- space
(8,'2023-01-08','Processing',400),
(9,'2023-01-09','Completed',200),
(10,'2023-01-10','Returned',200),
(11,'2023-01-11','Completed',NULL),
(12,'2023-01-12','completed',300);

------------------------------------------------------------
-- STEP 7: ORDER ITEMS
------------------------------------------------------------

CREATE TABLE order_items (
    item_id SERIAL PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    unit_price NUMERIC(10,2)
);

------------------------------------------------------------
-- INSERT MESSY ORDER ITEMS
------------------------------------------------------------

INSERT INTO order_items (order_id,product_id,quantity,unit_price) VALUES
(1,1,1,1200),
(1,5,2,150),
(2,1,1,1200),
(2,5,2,150),
(3,2,1,800),
(4,1,1,1200),
(5,4,1,NULL),
(6,3,1,800),
(7,3,1,800),
(8,10,2,30),
(9,11,2,30),
(10,10,NULL,30),
(11,5,1,150),
(12,6,1,300);

------------------------------------------------------------
-- STEP 8: EMPLOYEES TABLE
------------------------------------------------------------

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department VARCHAR(50),
    salary NUMERIC(10,2),
    hire_date DATE
);

------------------------------------------------------------
-- INSERT MESSY EMPLOYEE DATA
------------------------------------------------------------

INSERT INTO employees (first_name,last_name,department,salary,hire_date) VALUES
('Alice','Walker','Sales',60000,'2019-01-01'),
('Bob','Hall','sales',60000,'2019-01-01'), -- casing
('Charlie','Allen','Finance',75000,'2020-05-10'),
('David','Young','IT',80000,'2018-07-21'),
('Eva','King','HR',65000,'2021-03-14'),
('Frank','Wright','IT',NULL,'2020-10-11'), -- missing salary
('Grace','Scott','Finance',72000,'2022-04-22'),
('Henry','Green','IT',80000,'2018-07-21'), -- duplicate salary/date
('Isabella','Adams','Marketing',70000,'2023-01-10'),
('Jack','Baker','marketing',70000,'2023-01-10'); -- casing

------------------------------------------------------------
-- END OF SCRIPT
------------------------------------------------------------