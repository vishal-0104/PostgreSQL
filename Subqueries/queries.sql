Query: CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    salary NUMERIC(10, 2),
    department_id INT
);

CREATE TABLE
                                            Table "public.employees"
    Column     |          Type          | Collation | Nullable |                    Default                     
---------------+------------------------+-----------+----------+------------------------------------------------
 employee_id   | integer                |           | not null | nextval('employees_employee_id_seq'::regclass)
 name          | character varying(100) |           |          | 
 salary        | numeric(10,2)          |           |          | 
 department_id | integer                |           |          | 
Indexes:
    "employees_pkey" PRIMARY KEY, btree (employee_id)


Query: CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(100)
);

CREATE TABLE
                                              Table "public.departments"
     Column      |          Type          | Collation | Nullable |                      Default                       
-----------------+------------------------+-----------+----------+----------------------------------------------------
 department_id   | integer                |           | not null | nextval('departments_department_id_seq'::regclass)
 department_name | character varying(100) |           |          | 
Indexes:
    "departments_pkey" PRIMARY KEY, btree (department_id)


Query: CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date DATE
);

CREATE TABLE
                                  Table "public.orders"
   Column    |  Type   | Collation | Nullable |                 Default                  
-------------+---------+-----------+----------+------------------------------------------
 order_id    | integer |           | not null | nextval('orders_order_id_seq'::regclass)
 customer_id | integer |           |          | 
 order_date  | date    |           |          | 
Indexes:
    "orders_pkey" PRIMARY KEY, btree (order_id)


Query:  CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100)
);

CREATE TABLE
                                           Table "public.customers"
   Column    |          Type          | Collation | Nullable |                    Default                     
-------------+------------------------+-----------+----------+------------------------------------------------
 customer_id | integer                |           | not null | nextval('customers_customer_id_seq'::regclass)
 name        | character varying(100) |           |          | 
 email       | character varying(100) |           |          | 
Indexes:
    "customers_pkey" PRIMARY KEY, btree (customer_id)


Query: INSERT INTO departments (department_name) VALUES
('HR'),
('Sales'),
('IT'),
('Finance');

INSERT 0 4

 department_id | department_name 
---------------+-----------------
             1 | HR
             2 | Sales
             3 | IT
             4 | Finance
(4 rows)


Query: INSERT INTO employees (name, salary, department_id) VALUES
('A', 50000, 1),
('B', 60000, 2),
('C', 55000, 2),
('D', 70000, 3),
('E', 65000, 4);

INSERT 0 5

 employee_id | name |  salary  | department_id 
-------------+------+----------+---------------
           1 | A    | 50000.00 |             1
           2 | B    | 60000.00 |             2
           3 | C    | 55000.00 |             2
           4 | D    | 70000.00 |             3
           5 | E    | 65000.00 |             4
(5 rows)


Query: INSERT INTO customers (name, email) VALUES
('varun', 'varun@example.com'),
('abhinav', 'abhinav@example.com'),
('vishal', 'vishal@example.com'),
('priyanshu', 'priyanshu@example.com');

INSERT 0 4

 customer_id |   name    |         email         
-------------+-----------+-----------------------
           1 | varun     | varun@example.com
           2 | abhinav   | abhinav@example.com
           3 | vishal    | vishal@example.com
           4 | priyanshu | priyanshu@example.com
(4 rows)


Query: INSERT INTO orders (customer_id, order_date) VALUES
(1, '2023-01-10'),
(1, '2023-01-15'),
(2, '2023-02-20'),
(3, '2023-03-05'),
(3, '2023-03-10'),
(3, '2023-03-15'),
(4, '2023-04-01');

INSERT 0 7

 order_id | customer_id | order_date 
----------+-------------+------------
        1 |           1 | 2023-01-10
        2 |           1 | 2023-01-15
        3 |           2 | 2023-02-20
        4 |           3 | 2023-03-05
        5 |           3 | 2023-03-10
        6 |           3 | 2023-03-15
        7 |           4 | 2023-04-01
(7 rows)


Q1: How can you use a subquery to find employees who earn more than the average salary?

-- Theory: A subquery is a query nested inside another query. In this case, the subquery will compute the average salary from the employees table, and the outer query will then compare each employee's salary to that average.

Query: SELECT employee_id, name, salary
FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

 employee_id | name |  salary  
-------------+------+----------
           4 | D    | 70000.00
           5 | E    | 65000.00
(2 rows)


Q2: What is the difference between EXISTS and IN subqueries?
-- Theory: Checks if any rows satisfy a condition in the subquery.

Query: SELECT employee_id, name
FROM employees e
WHERE EXISTS (
    SELECT 1
    FROM departments d
    WHERE d.department_id = e.department_id
);

 employee_id | name 
-------------+------
           1 | A
           2 | B
           3 | C
           4 | D
           5 | E
(5 rows)

-- Theory: Checks if a value (or set of values) is present in a list returned by the subquery.

Query: SELECT employee_id, name
FROM employees
WHERE department_id IN (
    SELECT department_id
    FROM departments
);

 employee_id | name 
-------------+------
           1 | A
           2 | B
           3 | C
           4 | D
           5 | E
(5 rows)


Q3: How can you use a correlated subquery to find customers who have placed the most orders?
-- Theory: A correlated subquery is a subquery that references columns from the outer query, allowing for dynamic interaction between the two queries.

Query: SELECT customer_id
FROM customers c
WHERE (
    SELECT COUNT(*)
    FROM orders o
    WHERE o.customer_id = c.customer_id
) = (
    SELECT MAX(order_count)
    FROM (
        SELECT customer_id, COUNT(*) AS order_count
        FROM orders
        GROUP BY customer_id
    )
);

 customer_id 
-------------
           3
(1 row)


Q4: Can you use a subquery in the FROM clause? If so, how?
-- Theory: Yes, i can use a subquery in the FROM clause, and it is commonly referred to as a derived table. A subquery in the FROM clause acts as a temporary table that you can query from in the outer query.

Query: SELECT department_id, AVG(salary) AS avg_salary
FROM (
    SELECT department_id, salary
    FROM employees
)
GROUP BY department_id;

 department_id |     avg_salary     
---------------+--------------------
             3 | 70000.000000000000
             4 | 65000.000000000000
             2 | 57500.000000000000
             1 | 50000.000000000000
(4 rows)


Q5: How can you use a subquery to find the department with the highest average salary?

Query: SELECT department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY department_id
HAVING AVG(salary) = (
    SELECT MAX(avg_salary)
    FROM (
        SELECT department_id, AVG(salary) AS avg_salary
        FROM employees
        GROUP BY department_id
    )
);

 department_id |     avg_salary     
---------------+--------------------
             3 | 70000.000000000000
(1 row)


Q6: What are some common performance issues with subqueries?
-- Theory: Correlated subqueries: Evaluated for each row in the outer query, leading to poor performance on large datasets.
-- Large result sets: Subqueries returning many rows can slow down the query (e.g., using IN with large data).
-- Unoptimized execution: Lack of indexes on columns referenced in the subquery degrades performance.
-- Nested subqueries: Multiple layers of subqueries increase complexity and execution time.



Q7: How can you optimize a subquery to improve performance?
-- Theory: Replace IN with EXISTS or JOIN.

Query: SELECT c.customer_id
FROM customers c
JOIN (
    SELECT customer_id, COUNT(*) AS order_count
    FROM orders
    GROUP BY customer_id
) o ON c.customer_id = o.customer_id
WHERE o.order_count > 3;

 customer_id 
-------------
(0 rows)


Q8: Can you use a subquery within another subquery?
-- Theory: Yes, i can use a subquery within another subquery. This is known as a nested subquery. SQL allows subqueries to be nested at multiple levels, depending on the complexity of the query and the requirements of the task.

Query: SELECT employee_id
FROM employees
WHERE salary > (
    SELECT AVG(salary)
    FROM employees
    WHERE department_id = (
        SELECT department_id
        FROM departments
        WHERE department_name = 'Sales'
    )
);

 employee_id 
-------------
           2
           4
           5
(3 rows)


Q9: How can you use a subquery to find duplicate records in a table?
--Theory: To find duplicate records in a table using a subquery, the goal is to identify rows where certain columns (or combinations of columns) have the same values across multiple rows. Subqueries are an effective way to achieve this by leveraging aggregation and filtering techniques.

Query: SELECT employee_id, name
FROM employees e1
WHERE (
    SELECT COUNT(*)
    FROM employees e2
    WHERE e1.name = e2.name
) > 1;

 employee_id | name 
-------------+------
(0 rows)


Q10: What are some real-world examples of how subqueries are used in business applications?
--Theory: Subqueries are powerful tools for answering business-specific questions that require dynamic filtering, aggregation, and hierarchical data analysis.

Query: SELECT customer_id, name
FROM customers
WHERE (
    SELECT SUM(order_amount)
    FROM orders
    WHERE orders.customer_id = customers.customer_id
) > (
    SELECT AVG(order_amount)
    FROM orders
);

 customer_id |  name  
-------------+--------
           3 | vishal
(1 row)

