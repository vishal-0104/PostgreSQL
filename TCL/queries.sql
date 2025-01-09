Q1: Create a transaction to insert two new employees and update the salary of an existing employee.
Query: BEGIN;
BEGIN

Query: INSERT INTO employees  (employee_id, first_name, last_name, salary) VALUES(4, 'Varun', 'Kumar', 50000),(5, 'Aman', 'Kumar', 62000);
INSERT 0 2

Query: UPDATE employees SET salary = 75000 WHERE employee_id = 4;
UPDATE 1
 employee_id | first_name | last_name | salary 
-------------+------------+-----------+--------
           5 | Aman       | Kumar     |  62000
           4 | Varun      | Kumar     |  75000
(2 rows)


Q2: Commit the transaction to save the changes.
Query: COMMIT;
COMMIT


Q3: Create a transaction to delete a product and insert a new product.
Query: BEGIN;
BEGIN

Query: DELETE FROM products WHERE product_id = 2;
DELETE 1

Query:  INSERT INTO products (product_id, product_name, price) VALUES (3,'jeans',3000);
INSERT 0 1
 product_id | product_name | price 
------------+--------------+-------
          1 | t-shirt      |  1000
          3 | jeans        |  3000
(2 rows)


Q4: Rollback the transaction to undo the changes.
Query: ROLLBACK; 
ROLLBACK


Q5: Create a transaction to update the price of a product and insert a new
Query: BEGIN;
BEGIN

Query: UPDATE products SET price = 70.00 WHERE product_id = 3;
UPDATE 1

Query: INSERT INTO products (product_id, product_name, price) VALUES (5, 'jacket', 4000);
INSERT 0 1

Query:  COMMIT;
COMMIT
