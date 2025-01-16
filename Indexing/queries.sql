Q1: Problem: A table storing customer orders is experiencing slow query performance, particularly when filtering by customer name or order date.
Solution: Create indexes on the customer_name and order_date columns to speed up data retrieval for queries involving these columns.

Query: CREATE INDEX idx_customer_name ON customers (name);

CREATE INDEX 

                                           Table "public.customers"
   Column    |          Type          | Collation | Nullable |                    Default                     
-------------+------------------------+-----------+----------+------------------------------------------------
 customer_id | integer                |           | not null | nextval('customers_customer_id_seq'::regclass)
 name        | character varying(100) |           |          | 
 email       | character varying(100) |           |          | 
Indexes:
    "customers_pkey" PRIMARY KEY, btree (customer_id)
    "idx_customer_name" btree (name)


Query: CREATE INDEX idx_order_date ON orders (order_date);

 CREATE INDEX
                                     Table "public.orders"
    Column    |     Type      | Collation | Nullable |                 Default                  
--------------+---------------+-----------+----------+------------------------------------------
 order_id     | integer       |           | not null | nextval('orders_order_id_seq'::regclass)
 customer_id  | integer       |           |          | 
 order_date   | date          |           |          | 
 order_amount | numeric(10,2) |           |          | 
Indexes:
    "orders_pkey" PRIMARY KEY, btree (order_id)
    "idx_order_date" btree (order_date)


Q2: Problem: A table storing product information with frequent searches on product descriptions is causing slow response times.
Solution: Create a GIN index on the product_description column to efficiently handle full-text search queries.

Query: CREATE INDEX idx_order_description ON orders USING gin(to_tsvector('english', order_description));

CREATE INDEX
                                          Table "public.orders"
      Column       |       Type        | Collation | Nullable |                 Default                  
-------------------+-------------------+-----------+----------+------------------------------------------
 order_id          | integer           |           | not null | nextval('orders_order_id_seq'::regclass)
 customer_id       | integer           |           |          | 
 order_date        | date              |           |          | 
 order_amount      | numeric(10,2)     |           |          | 
 order_description | character varying |           |          | 
Indexes:
    "orders_pkey" PRIMARY KEY, btree (order_id)
    "idx_order_date" btree (order_date)
    "idx_order_description" gin (to_tsvector('english'::regconfig, order_description::text))

