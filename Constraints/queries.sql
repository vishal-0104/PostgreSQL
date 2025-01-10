Q1: Ensure that the price column in the products table is always greater than zero.
Query: ALTER TABLE products ADD CONSTRAINT check_price_positive CHECK (price > 0);

ALTER TABLE
                      Table "public.products"
    Column    |       Type        | Collation | Nullable | Default 
--------------+-------------------+-----------+----------+---------
 product_id   | integer           |           |          | 
 product_name | character varying |           |          | 
 price        | numeric           |           |          | 
Check constraints:
    "check_price_positive" CHECK (price > 0::numeric)


Q2: Prevent duplicate entries in the email column of the customers table.
Query: ALTER TABLE customers ADD CONSTRAINT unique_email UNIQUE (email);

ALTER TABLE
 customer_id |  name   |       email        
-------------+---------+--------------------
           1 | vishal  | vishal@example.com
           2 | abhinav | abhi@example.com
(2 rows)


Q3: Make sure that the age column in the employees table is always between 18 and 65.
Query: ALTER TABLE employees ADD CONSTRAINT age_range CHECK (age BETWEEN 18 AND 65);

ALTER TABLE
                     Table "public.employees"
   Column    |       Type        | Collation | Nullable | Default 
-------------+-------------------+-----------+----------+---------
 employee_id | integer           |           |          | 
 first_name  | character varying |           |          | 
 last_name   | character varying |           |          | 
 salary      | numeric           |           |          | 
 age         | integer           |           |          | 
Check constraints:
    "age_range" CHECK (age >= 18 AND age <= 65)


Q4: Enforce a constraint to prevent deleting a customer if they have any associated orders.
Query: ALTER TABLE orders ADD CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE RESTRICT;
ALTER TABLE
                                     Table "public.orders"
    Column    |     Type      | Collation | Nullable |                 Default                  
--------------+---------------+-----------+----------+------------------------------------------
 order_id     | integer       |           | not null | nextval('orders_order_id_seq'::regclass)
 customer_id  | integer       |           |          | 
 order_date   | date          |           |          | 
 total_amount | numeric(10,2) |           |          | 
Indexes:
    "orders_pkey" PRIMARY KEY, btree (order_id)
Foreign-key constraints:
    "fk_customer_id" FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE RESTRICT
    "orders_customer_id_fkey" FOREIGN KEY (customer_id) REFERENCES customers(customer_id)

