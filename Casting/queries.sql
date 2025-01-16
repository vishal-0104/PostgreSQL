Q1: Problem: A table stores birthdates as strings in the format 'YYYY-MM-DD'. You need to calculate the age of customers.
Solution: Cast the birthdate column to a date type and then use date functions to calculate the age.

Query:  SELECT customer_id,name,
       EXTRACT(YEAR FROM AGE(CAST(birthdate AS DATE))) AS age
FROM customers;

 customer_id |   name    | age 
-------------+-----------+-----
           1 | varun     |  21
           2 | abhinav   |  20
           3 | vishal    |  22
           4 | priyanshu |  21
(4 rows)


Q2: Problem: A column stores a boolean value as 'Y' or 'N'. You need to perform logical operations on this column.
Solution: Cast the 'Y' and 'N' values to boolean (TRUE/FALSE) using CASE expressions or custom functions.

Query: SELECT 
    user_id, 
    username, 
    is_active,
    CASE 
        WHEN is_active = 'Y' THEN 'TRUE'
        ELSE 'FALSE'
    END AS is_active_bool
FROM users;

 user_id | username | is_active | is_active_bool 
---------+----------+-----------+----------------
       1 | Vishal   | Y         | TRUE
       2 | Varun    | N         | FALSE
       3 | Abhinav  | Y         | TRUE
(3 rows)

