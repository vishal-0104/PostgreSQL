Q1: Retrieve the names of all customers from the city of 'New York'.
Query: SELECT name FROM customers WHERE city = 'New York';

   name    
-----------
 priyanshu
(1 row)


Q2: Find all orders placed after a specific date.
Query: SELECT * FROM orders WHERE order_date > '2025-01-01';

 order_id | customer_id | order_date | total_amount 
----------+-------------+------------+--------------
        7 |           2 | 2025-01-02 |       200.00
        8 |           1 | 2025-01-03 |       150.00
        9 |           2 | 2025-01-04 |        50.00
       10 |           2 | 2025-01-05 |       300.00
(4 rows)


Q3: List all products with a price between $50 and $100.
Query: SELECT * FROM products WHERE price BETWEEN 50 AND 100;

 product_id | product_name | price 
------------+--------------+-------
          3 | jeans        | 70.00
(1 row)


Q4: Join the customers and orders tables to display customer information for each order.
Query: SELECT customers.name, orders.order_id, orders.total_amount FROM customers JOIN orders ON customers.customer_id = orders.customer_id;

  name   | order_id | total_amount 
---------+----------+--------------
 vishal  |        6 |       100.00
 abhinav |        7 |       200.00
 vishal  |        8 |       150.00
 abhinav |        9 |        50.00
 abhinav |       10 |       300.00
(5 rows)


Q5: Group orders by customer and calculate the total amount spent by each customer.
Query: SELECT customer_id, SUM(total_amount) AS total_spent FROM orders GROUP BY customer_id;

 customer_id | total_spent 
-------------+-------------
           2 |      550.00
           1 |      250.00
(2 rows)


Q6: Sort the results of a query by a specific column in ascending or descending order.
Query: SELECT * FROM products ORDER BY price DESC;

 product_id | product_name | price 
------------+--------------+-------
          5 | jacket       |  4000
          1 | t-shirt      |  1000
          3 | jeans        | 70.00
(3 rows)


Q7: Limit the number of rows returned by a query to a specific value.
Query: SELECT * FROM products LIMIT 10;

 product_id | product_name | price 
------------+--------------+-------
          1 | t-shirt      |  1000
          3 | jeans        | 70.00
          5 | jacket       |  4000
(3 rows)

