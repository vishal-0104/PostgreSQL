Q1: Insert three new employees into the "employees" table.
Query: INSERT INTO employees(employee_id, first_name, last_name, salary) VALUES (1, 'vishal', 'kanojia', 1010),(2,'abhinav', 'lather', 2020), (3, 'priyanshu', 'singh', 3030);

INSERT 0 3


Q2: Retrieve all employee records from the "employees" table.
Query: select * from employees;

 employee_id | first_name | last_name | salary 
-------------+------------+-----------+--------
           1 | vishal     | kanojia   |   1010
           2 | abhinav    | lather    |   2020
           3 | priyanshu  | singh     |   3030
(3 rows)


Q3: Retrieve only the first and last names of all employees.
Query: SELECT first_name, last_name FROM employees;

 first_name | last_name 
------------+-----------
 vishal     | kanojia
 abhinav    | lather
 priyanshu  | singh
(3 rows)


Q4: Update the salary of an employee with a specific employee_id.
Query: UPDATE employees SET salary = 70000 WHERE employee_id = 1;

UPDATE 1
 employee_id | first_name | last_name | salary 
-------------+------------+-----------+--------
           2 | abhinav    | lather    |   2020
           3 | priyanshu  | singh     |   3030
           1 | vishal     | kanojia   |  70000
(3 rows)


Q5: Delete the record of an employee with a specific employee_id.
Query: DELETE FROM staff WHERE employee_id = 2;

DELETE 1
 employee_id | first_name | last_name | salary 
-------------+------------+-----------+--------
           3 | priyanshu  | singh     |   3030
           1 | vishal     | kanojia   |  70000
(2 rows)


Q6: Retrieve all employees whose salary is greater than a certain amount.
Query: SELECT * FROM employees WHERE salary > 55000;

 employee_id | first_name | last_name | salary 
-------------+------------+-----------+--------
           1 | vishal     | kanojia   |  70000
(1 row)


Q7: Insert five new products into the "products" table.
Query: INSERT INTO products (product_id, product_name, price) VALUES (1, 'Product A', 25.99),(2, 'Product B', 15.49),(3, 'Product C', 45.00),(4, 'Product D', 60.00),(5, 'Product E', 75.00);

INSERT 0 5
 product_id | product_name | price 
------------+--------------+-------
          1 | Product A    | 25.99
          2 | Product B    | 15.49
          3 | Product C    | 45.00
          4 | Product D    | 60.00
          5 | Product E    | 75.00
(5 rows)


Q8: Update the price of a specific product.
Query: UPDATE products SET price = 50.00 WHERE product_id = 3;

UPDATE 1


Q9: Retrieve all products with a price between a certain range.
Query:SELECT * FROM products WHERE price BETWEEN 20 AND 60;

 product_id | product_name | price 
------------+--------------+-------
          1 | Product A    | 25.99
          4 | Product D    | 60.00
          3 | Product C    | 50.00
(3 rows)


Q10: Delete all products with a price below a certain threshold.
Query: DELETE FROM products WHERE price < 30;

DELETE 2
 product_id | product_name | price 
------------+--------------+-------
          4 | Product D    | 60.00
          5 | Product E    | 75.00
          3 | Product C    | 50.00
(3 rows)

