Q1: Grant the SELECT privilege on the "employees" table to a specific user.
Query: CREATE ROLE user1 WITH LOGIN PASSWORD 'firstUser';

CREATE ROLE

Query: CREATE ROLE user2 WITH LOGIN PASSWORD 'password2';

CREATE ROLE

Query: CREATE ROLE insert_group;
 
CREATE ROLE

Main Query: GRANT SELECT ON employees TO user1;

GRANT


Q2: Grant the INSERT privilege on the "employees" table to a group of users.
Query: GRANT insert_group TO user2;

GRANT ROLE

Main Query: GRANT INSERT ON employees TO insert_group;

GRANT


Q3: Revoke the UPDATE privilege on the "employees" table from a specific user.

Main Query: REVOKE UPDATE ON employees FROM user1;

REVOKE



Q4: Grant all privileges on the "products" table to a specific role.
Query: CREATE ROLE CEO WITH LOGIN PASSWORD 'HeadOfCompany';

CREATE ROLE

Main Query: GRANT ALL PRIVILEGES ON products TO CEO;

GRANT



Q5: Revoke the DELETE privilege on the "products" table from all users.
Main Query: REVOKE DELETE ON products FROM PUBLIC;

REVOKE

Q6: Grant the SELECT and INSERT privileges on the "departments" table to a specific user.
Query: CREATE ROLE Mentor WITH LOGIN PASSWORD 'Mentor123';

CREATE ROLE

Main Query: GRANT SELECT, INSERT on departments TO Mentor;

GRANT


Q7: Revoke all privileges on the "departments" table from a specific role
Query: CREATE ROLE Student WITH LOGIN PASSWORD 'Student123';

CREATE ROLE

Main Query: REVOKE ALL PRIVILEGES ON departments FROM Student;

REVOKE



Q8: Grant the USAGE privilege on a specific schema to a user.
Query: CREATE SCHEMA AllTables;

CREATE SCHEMA

Query: ALTER TABLE products SET SCHEMA AllTables;

ALTER TABLE

Query: ALTER TABLE departments SET SCHEMA AllTables;

ALTER TABLE

Query: ALTER TABLE employees SET SCHEMA AllTables;

ALTER TABLE

Main Query: GRANT USAGE ON SCHEMA AllTables TO CEO;

GRANT



Q9: Revoke the USAGE privilege on a specific schema from a group of users.
Main Query: REVOKE USAGE ON SCHEMA AllTables FROM user1, user2, Student;

REVOKE


Q10: Grant the CONNECT privilege to a new user.
Query: CREATE ROLE new_user WITH LOGIN PASSWORD 'newUser123';

CREATE ROLE

Main Query: GRANT CONNECT ON DATABASE company TO new_user;

GRANT