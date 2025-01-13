1. Customer Order Analysis
Scenario: You have two tables: customers and orders.
Problem: Identify customers who have not placed any orders.
Solution: Use a LEFT JOIN to retrieve all customers and their corresponding orders. Filter for customers where the order_id is NULL.

Query: SELECT 
    c.customer_id,
    c.customer_name,
    c.email
FROM 
    customers c
LEFT JOIN 
    orders o
ON 
    c.customer_id = o.customer_id
WHERE 
    o.order_id IS NULL;

 customer_id | customer_name |       email       
-------------+---------------+-------------------
           3 | Charlie       | charlie@email.com
(1 row)


2. Product Inventory Tracking
Scenario: You have tables: products, inventories, and warehouses.
Problem: Determine which products are not currently stocked in any warehouse.
Solution: Use a combination of LEFT JOIN and RIGHT JOIN to identify products that have no corresponding entries in the inventories table.

Query:  SELECT 
     p.product_id,
     p.product_name
 FROM 
     products p
 LEFT JOIN 
     inventories i
 ON 
     p.product_id = i.product_id
 WHERE 
     i.inventory_id IS NULL
 
 UNION
 
 SELECT 
     p.product_id,
     p.product_name
 FROM 
     inventories i
 RIGHT JOIN 
     products p
 ON 
     p.product_id = i.product_id
 WHERE 
     i.inventory_id IS NULL;

 product_id | product_name 
------------+--------------
          3 | Tablet
          4 | Headphones
(2 rows)


3. Employee Performance Analysis
Scenario: You have tables: employees, departments, and sales.
Problem: Find the top-performing department based on total sales.
Solution: Use INNER JOIN to combine employee, department, and sales data. Group the results by department and calculate the total sales for each department.

Query: SELECT 
    d.department_id,
    d.department_name,
    SUM(s.sale_amount) AS total_sales
FROM 
    departments d
INNER JOIN 
    employees e
ON 
    d.department_id = e.department_id
INNER JOIN 
    sales s
ON 
    e.employee_id = s.employee_id
GROUP BY 
    d.department_id, d.department_name
ORDER BY 
    total_sales DESC;

 department_id | department_name | total_sales 
---------------+-----------------+-------------
             2 | Clothing        |     1500.00
             1 | Electronics     |     1500.00
             3 | Furniture       |      700.00
(3 rows)


4. Website User Activity
Scenario: You have tables: users, sessions, and page_views.
Problem: Identify users who have never logged in to the website.
Solution: Use a LEFT JOIN to connect users with their sessions. Filter for users with no corresponding sessions.

Query: SELECT 
     u.user_id,
     u.user_name,
     u.email
 FROM 
     users u
 LEFT JOIN 
     sessions s
 ON 
     u.user_id = s.user_id
 WHERE 
     s.session_id IS NULL;
 CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    email VARCHAR(150) UNIQUE NOT NULL );

 user_id | user_name |    email    
---------+-----------+-------------
       4 | D         | d@email.com
       3 | C         | c@email.com
(2 rows)


5. Social Media Engagement
Scenario: You have tables: users, posts, and likes.
Problem: Find the most popular post (the one with the most likes).
Solution: Use INNER JOIN to connect posts with their likes. Group the results by post and count the number of likes for each post.

Query: SELECT 
     p.post_id,
     p.post_content,
     COUNT(l.like_id) AS like_count
 FROM 
     posts p
 LEFT JOIN 
     likes l
 ON 
     p.post_id = l.post_id
 GROUP BY 
     p.post_id, p.post_content
 ORDER BY 
     like_count DESC;

 post_id | post_content | like_count 
---------+--------------+------------
       2 | Post by B    |          3
       1 | Post by A    |          2
       3 | Post by C    |          0
(3 rows)

6. E-commerce Order Fulfillment
Scenario: You have tables: orders, order_items, and products.
Problem: Determine which products are frequently ordered together.
Solution: Use INNER JOIN to connect orders with their items and products. Analyze the frequency of product pairs within the same order.

Query: SELECT 
     p1.product_name AS product_1,
     p2.product_name AS product_2,
     COUNT(*) AS pair_count
 FROM 
     order_items oi1
 INNER JOIN 
     order_items oi2
 ON 
     oi1.order_id = oi2.order_id AND oi1.product_id < oi2.product_id
 INNER JOIN 
     products p1
 ON 
     oi1.product_id = p1.product_id
 INNER JOIN 
     products p2
 ON 
     oi2.product_id = p2.product_id
 GROUP BY 
     p1.product_name, p2.product_name
 ORDER BY 
     pair_count DESC;

 product_1  | product_2  | pair_count 
------------+------------+------------
 Laptop     | Tablet     |          1
 Smartphone | Headphones |          1
 Laptop     | Smartphone |          1
 Smartphone | Tablet     |          1
 Laptop     | Laptop     |          1
(5 rows)


7. Financial Transaction Analysis
Scenario: You have tables: accounts, transactions, and customers.
Problem: Find customers with suspicious transaction activity (e.g., large or unusual amounts).
Solution: Use INNER JOIN to connect accounts, transactions, and customers. Analyze transaction data to identify patterns or anomalies.

Query: SELECT 
    c.customer_id,
    c.customer_name,
    t.transaction_id,
    t.transaction_date,
    t.transaction_type,
    t.amount,
    a.account_type,
    a.balance
FROM 
    customers c
INNER JOIN 
    accounts a
ON 
    c.customer_id = a.customer_id
INNER JOIN 
    transactions t
ON 
    a.account_id = t.account_id
WHERE 
    t.amount > 10000 
OR 
    t.transaction_date IN (
SELECT 
    t1.transaction_date
FROM 
    transactions t1
INNER JOIN 
    transactions t2
ON 
    t1.account_id = t2.account_id
WHERE 
    t1.transaction_id <> t2.transaction_id
    AND ABS(EXTRACT(EPOCH FROM (t1.transaction_date - t2.transaction_date))) < 300 
)
  OR 
    c.customer_id IN (
SELECT 
    c2.customer_id
FROM 
    customers c2
INNER JOIN 
    accounts a2
ON 
    c2.customer_id = a2.customer_id
INNER JOIN 
    transactions t3
ON 
    a2.account_id = t3.account_id
GROUP BY 
    c2.customer_id
HAVING 
    COUNT(t3.transaction_id) > 10 
)
ODER BY 
    t.transaction_date DESC, t.amount DESC;

 customer_id | customer_name | transaction_id |  transaction_date   | transaction_type |  amount  | account_type | balance  
-------------+---------------+----------------+---------------------+------------------+----------+--------------+----------
           3 | Charlie       |             11 | 2025-01-12 12:00:00 | debit            | 19500.00 | Savings      | 20000.00
(1 row)


8. Healthcare Patient Monitoring
Scenario: You have tables: patients, appointments, and diagnoses.
Problem: Identify patients who have not been seen by a doctor in the past year.
Solution: Use a LEFT JOIN to connect patients with their appointments. Filter for patients with no appointments within the specified time frame.

Query: SELECT 
    p.patient_id,
    p.patient_name
FROM 
    patients p
LEFT JOIN 
    appointments a
ON 
    p.patient_id = a.patient_id
WHERE 
    a.appointment_date IS NULL
OR a.appointment_date < CURRENT_DATE - INTERVAL '1 year';

 patient_id | patient_name 
------------+--------------
          1 | priyanshu
          1 | priyanshu
          2 | abhinav
          3 | varun
          4 | vishal
(5 rows)


9. Educational Student Performance
Scenario: You have tables: students, courses, and grades.
Problem: Find students who are failing a particular course.
Solution: Use INNER JOIN to connect students, courses, and grades. Filter for students with grades below a certain threshold.

Query: SELECT 
    s.student_id,
    s.student_name,
    c.course_name,
    g.grade
FROM students s
INNER JOIN grades g 
ON s.student_id = g.student_id
INNER JOIN courses c 
ON g.course_id = c.course_id
WHERE g.grade < 50;

 student_id | student_name | course_name | grade 
------------+--------------+-------------+-------
          2 | B            | Mathematics | 45.00
          3 | C            | Mathematics | 30.00
(2 rows)


10. Supply Chain Management
Scenario: You have tables: suppliers, products, and orders.
Problem: Determine which suppliers have not shipped any orders in the last quarter.
Solution: Use a combination of LEFT JOIN and RIGHT JOIN to identify suppliers with no corresponding orders within the specified time period.

Query: SELECT 
    s.supplier_id,
    s.supplier_name
FROM 
    suppliers s
LEFT JOIN 
    products3 p
ON 
    s.supplier_id = p.supplier_id
LEFT JOIN 
    orders3 o
ON 
    p.product_id = o.product_id
WHERE 
    o.order_id IS NULL
    OR o.order_date NOT BETWEEN DATE '2023-10-01' AND DATE '2023-12-31'

UNION

SELECT 
    s.supplier_id,
    s.supplier_name
FROM 
    orders3 o
RIGHT JOIN 
    products3 p
ON 
    o.product_id = p.product_id
RIGHT JOIN 
    suppliers s
ON 
    p.supplier_id = s.supplier_id
WHERE 
    o.order_id IS NULL
    OR o.order_date NOT BETWEEN DATE '2023-10-01' AND DATE '2023-12-31'; 

 supplier_id | supplier_name 
-------------+---------------
           3 | Supplier C
           4 | Supplier D
           2 | Supplier B
(3 rows)

