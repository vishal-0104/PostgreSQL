Q1: How do you create a stored procedure in PostgreSQLCREATE PROCEDURE

Query: CREATE PROCEDURE update_salary(t_employee_id INT, increment INT) 
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE employees
    SET salary = salary + increment
    WHERE employee_id = t_employee_id;
END;
$$;

CREATE PROCEDURE


Q2: How do you pass parameters to a stored procedure?
--Theory: Parameters are defined in the parentheses of the procedure declaration.

Q3: How do you return a result set from a stored procedure?

Query: CALL update_salary(1,1000);

CALL


Q4: What are the benefits of using stored procedures?

--Theory: Performance: Reduce network traffic by executing logic on the server.
--        Security: Encapsulate logic and hide data complexity.
--        Reusability: Centralize business logic for consistent use.
--        Maintenance: Make application changes without touching client-side code.
--        Transaction Handling: Manage complex transactions within the database.


Q5: What are the drawbacks of using stored procedures?

--Theory: Database Dependence: Tightly couples logic with the database, making migrations harder.
--        Version Control: Managing code changes is more complex than in external application code.
--        Debugging: Debugging stored procedures can be difficult compared to application code.
--        Limited Scalability: Complex procedures may impact database performance.


Q6: How do you debug a stored procedure?

--Theory: Raise Notices: Use RAISE NOTICE for logging and debugging.
--        Use Logs: Check the PostgreSQL logs for errors.
--        pgAdmin Debugger: Use the built-in debugger in pgAdmin to step through procedures.
--        Unit Testing: Write test cases to validate logic.


Q7: How do you grant permissions to a stored procedure?

--Theory: Use the GRANT statement to provide access.
Query: GRANT EXECUTE ON PROCEDURE update_salary TO role_name;

--To revoke access:
Query: REVOKE EXECUTE ON PROCEDURE update_salary FROM role_name;


Q8: How can you use stored procedures to improve application performance?
--Theory: Reduce Network Latency: Minimize data transfer between the application and the database.
--        Precompiled Execution Plans: Stored procedures use cached plans for faster execution.
--        Encapsulation: Simplify application logic by offloading data-intensive operations to the database.
--        Batch Processing: Execute multiple statements in a single call.


Q9: What are some common use cases for stored procedures?

--Theory: Data Transformation: Complex data processing tasks.
--        Batch Jobs: Scheduled tasks like data backups and aggregation.
--        Business Logic: Encapsulation of domain-specific rules.
--        Auditing and Logging: Automatically log user actions or changes.
--        Access Control: Manage data access through controlled logic.


Q10: How do you handle errors within a stored procedure?

--Theory: PostgreSQL provides the EXCEPTION block for error handling.

Query: CREATE PROCEDURE safe_update_salary(employee_id INT, increment NUMERIC)
LANGUAGE plpgsql
AS $$
BEGIN
    UPDATE employees
    SET salary = salary + increment
    WHERE employee_id = employee_id;

    RAISE NOTICE 'Salary updated successfully for employee %', employee_id;
EXCEPTION
    WHEN OTHERS THEN
        RAISE WARNING 'An error occurred: %', SQLERRM;
END;
$$;

CREATE PROCEDURE
