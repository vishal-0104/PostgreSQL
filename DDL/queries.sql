Q1: Create a database named "company" to store employee information.
Query: CREATE DATABASE company;

CREATE DATABASE
                                                List of databases
   Name    |  Owner   | Encoding | Locale Provider | Collate | Ctype | Locale | ICU Rules |   Access privileges   
-----------+----------+----------+-----------------+---------+-------+--------+-----------+-----------------------
 company   | postgres | UTF8     | libc            | C       | C     |        |           | 
 postgres  | postgres | UTF8     | libc            | C       | C     |        |           | 
 template0 | postgres | UTF8     | libc            | C       | C     |        |           | =c/postgres          +
           |          |          |                 |         |       |        |           | postgres=CTc/postgres
 template1 | postgres | UTF8     | libc            | C       | C     |        |           | =c/postgres          +
           |          |          |                 |         |       |        |           | postgres=CTc/postgres
(4 rows)

Q2: Create a table named "employees" with columns for employee_id (integer), first_name (varchar), last_name (varchar), and salary (decimal).
Query: CREATE TABLE employees(employee_id integer, first_name varchar, last_name varchar, salary decimal);

CREATE TABLE
           List of relations
 Schema |   Name    | Type  |  Owner   
--------+-----------+-------+----------
 public | employees | table | postgres
(1 row)

Q3: Add a new column named "department" to the "employees" table.
Query: ALTER TABLE employees ADD department varchar;

ALTER TABLE
                     Table "public.employees"
   Column    |       Type        | Collation | Nullable | Default 
-------------+-------------------+-----------+----------+---------
 employee_id | integer           |           |          | 
 first_name  | character varying |           |          | 
 last_name   | character varying |           |          | 
 salary      | numeric           |           |          | 
 department  | character varying |           |          | 

Q4: Modify the "salary" column in the "employees" table to allow for NULL values.
Query: ALTER TABLE employees ALTER salary SET NOT NULL;

ALTER TABLE
                     Table "public.employees"
   Column    |       Type        | Collation | Nullable | Default 
-------------+-------------------+-----------+----------+---------
 employee_id | integer           |           |          | 
 first_name  | character varying |           |          | 
 last_name   | character varying |           |          | 
 salary      | numeric           |           | not null | 
 department  | character varying |           |          | 

Q5: Rename the "employees" table to "staff".
Query: ALTER TABLE employees RENAME TO staff;

ALTER TABLE
         List of relations
 Schema | Name  | Type  |  Owner   
--------+-------+-------+----------
 public | staff | table | postgres
(1 row)

Q6: Drop the "department" column from the "staff" table.
Query: ALTER TABLE staff DROP COLUMN department ;

ALTER TABLE
                       Table "public.staff"
   Column    |       Type        | Collation | Nullable | Default 
-------------+-------------------+-----------+----------+---------
 employee_id | integer           |           |          | 
 first_name  | character varying |           |          | 
 last_name   | character varying |           |          | 
 salary      | numeric           |           | not null | 

Q7: Create a table named "departments" with columns for department_id (integer) and department_name (varchar).
Query: CREATE TABLE departments(department_id integer, department_name varchar);

CREATE TABLE
                      Table "public.departments"
     Column      |       Type        | Collation | Nullable | Default 
-----------------+-------------------+-----------+----------+---------
 department_id   | integer           |           |          | 
 department_name | character varying |           |          | 

Q8: Create a database named "inventory" to store product information.
Query: CREATE DATABASE inventory;

CREATE DATABASE
                                                List of databases
   Name    |  Owner   | Encoding | Locale Provider | Collate | Ctype | Locale | ICU Rules |   Access privileges   
-----------+----------+----------+-----------------+---------+-------+--------+-----------+-----------------------
 company   | postgres | UTF8     | libc            | C       | C     |        |           | 
 inventory | postgres | UTF8     | libc            | C       | C     |        |           | 
 postgres  | postgres | UTF8     | libc            | C       | C     |        |           | 
 template0 | postgres | UTF8     | libc            | C       | C     |        |           | =c/postgres          +
           |          |          |                 |         |       |        |           | postgres=CTc/postgres
 template1 | postgres | UTF8     | libc            | C       | C     |        |           | =c/postgres          +
           |          |          |                 |         |       |        |           | postgres=CTc/postgres
(5 rows)

Q9: Create a table named "products" with columns for product_id (integer), product_name (varchar), and price (decimal).
Query: CREATE TABLE products(product_id integer, product_name varchar, price decimal);

CREATE TABLE
                      Table "public.products"
    Column    |       Type        | Collation | Nullable | Default 
--------------+-------------------+-----------+----------+---------
 product_id   | integer           |           |          | 
 product_name | character varying |           |          | 
 price        | numeric           |           |          | 

Q10: Drop the "inventory" database and all its associated tables.
Query: DROP DATABASE inventory ;

DROP DATABASE
                                                List of databases
   Name    |  Owner   | Encoding | Locale Provider | Collate | Ctype | Locale | ICU Rules |   Access privileges   
-----------+----------+----------+-----------------+---------+-------+--------+-----------+-----------------------
 company   | postgres | UTF8     | libc            | C       | C     |        |           | 
 postgres  | postgres | UTF8     | libc            | C       | C     |        |           | 
 template0 | postgres | UTF8     | libc            | C       | C     |        |           | =c/postgres          +
           |          |          |                 |         |       |        |           | postgres=CTc/postgres
 template1 | postgres | UTF8     | libc            | C       | C     |        |           | =c/postgres          +
           |          |          |                 |         |       |        |           | postgres=CTc/postgres
(4 rows)

