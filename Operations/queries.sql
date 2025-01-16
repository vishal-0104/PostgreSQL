Q1: Problem: Calculate the total sales amount for each order by summing the product price and quantity for each order item.
Solution: Use the SUM() function with appropriate joins and calculations to determine the total sales amount.

Query: SELECT 
  order_id, 
  SUM(product_price * quantity) AS total_sales
FROM order_items
GROUP BY order_id;

 order_id | total_sales 
----------+-------------
        2 |      100.00
        1 |      130.00
(2 rows)


Q2: Problem: Find all customers who placed an order in the last 30 days.
Solution: Use the current_date function and the - operator to calculate the date 30 days ago and then filter the orders based on the order date.

Query: SELECT DISTINCT customer_id, order_date
FROM orders
WHERE order_date >= CURRENT_DATE - INTERVAL '30 days';

 customer_id | order_date 
-------------+------------
           2 | 2025-01-01
           3 | 2025-01-05
(2 rows)



