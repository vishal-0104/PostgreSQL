Q1: Problem: Ensure that the updated_at timestamp column is automatically updated whenever a row in the products table is modified.
Solution: Create a BEFORE UPDATE trigger on the products table that updates the updated_at column with the current timestamp.

Query: CREATE OR REPLACE FUNCTION update_timestamp()
RETURNS TRIGGER AS $$
BEGIN
  NEW.updated_at = CURRENT_TIMESTAMP;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION

Query: CREATE TRIGGER update_orders_timestamp
BEFORE UPDATE ON orders
FOR EACH ROW
EXECUTE FUNCTION update_timestamp();
CREATE TRIGGER

Query: select * from update_timestamp();

UPDATE 1
 order_id | customer_id |         updated_at         
----------+-------------+----------------------------
        1 |           2 | 2025-01-16 14:17:46.346099
(1 row)

Q2: Problem: Prevent users from deleting orders with associated shipments.
Solution: Create a BEFORE DELETE trigger on the orders table that checks for the existence of related shipments and raises an error if any are found.

CREATE TABLE

                                Table "public.orderss"
    Column     |  Type   | Collation | Nullable |               Default               
---------------+---------+-----------+----------+-------------------------------------
 id            | integer |           | not null | nextval('orderss_id_seq'::regclass)
 customer_name | text    |           | not null | 
 order_date    | date    |           | not null | 
Indexes:
    "orderss_pkey" PRIMARY KEY, btree (id)
Referenced by:
    TABLE "shipments" CONSTRAINT "shipments_order_id_fkey" FOREIGN KEY (order_id) REFERENCES orderss(id)
Triggers:
    prevent_order_deletion_trigger BEFORE DELETE ON orderss FOR EACH ROW EXECUTE FUNCTION prevent_order_deletion()

CREATE TABLE

                                  Table "public.shipments"
    Column     |  Type   | Collation | Nullable |                  Default                   
---------------+---------+-----------+----------+--------------------------------------------
 ship_id       | integer |           | not null | nextval('shipments_ship_id_seq'::regclass)
 order_id      | integer |           | not null | 
 shipment_date | date    |           | not null | 
Indexes:
    "shipments_pkey" PRIMARY KEY, btree (ship_id)
Foreign-key constraints:
    "shipments_order_id_fkey" FOREIGN KEY (order_id) REFERENCES orderss(id)

Query: CREATE OR REPLACE FUNCTION prevent_order_deletion()
RETURNS TRIGGER AS $$
BEGIN

  IF EXISTS (SELECT 1 FROM shipments WHERE order_id = OLD.id) THEN

    RAISE EXCEPTION 'Cannot delete order with associated shipments';
  END IF;


  RETURN OLD;
END;
$$ LANGUAGE plpgsql;

CREATE FUNCTION

                                List of functions
 Schema |          Name          | Result data type | Argument data types | Type 
--------+------------------------+------------------+---------------------+------
 public | prevent_order_deletion | trigger          |                     | func
(1 row)


Query:  CREATE TRIGGER prevent_order_deletion_trigger
BEFORE DELETE ON orderss
FOR EACH ROW
EXECUTE FUNCTION prevent_order_deletion();

CREATE TRIGGER


Query: INSERT INTO orderss (customer_name, order_date) VALUES
('Vishal', '2025-01-01'),
('Abhinav', '2025-01-05');

INSERT 0 2


Query: INSERT INTO shipments (order_id, shipment_date) VALUES
(1, '2025-01-02');

INSERT 0 1


Query: DELETE FROM orderss WHERE id = 2;

DELETE 1



