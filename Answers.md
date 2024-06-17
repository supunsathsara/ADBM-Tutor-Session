1. Write a PL/SQL block that fetches and displays the email addresses of all customers.

    ```sql
    BEGIN
        FOR rec IN (SELECT email FROM customers) LOOP
            DBMS_OUTPUT.PUT_LINE('Customer Email: ' || rec.email);
        END LOOP;
    END;
    /
    ```

2. Write a PL/SQL block that calculates and displays the total number of customers.
    
    ```sql
    DECLARE
    v_total_customers NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_total_customers FROM customers;
        DBMS_OUTPUT.PUT_LINE('Total Number of Customers: ' || v_total_customers);
    END;
    / 
    ```

3. Write a PL/SQL block that updates the email address of a customer given their customer ID. If there is no customer, print “No Customer Found”.

    ```sql
     DECLARE
        v_customer_id NUMBER := 101; -- Replace with the customer ID to update
        v_new_email VARCHAR2(100) := 'new.email@example.com'; -- Replace with the new email address
    BEGIN
        UPDATE customers
        SET email = v_new_email
        WHERE customer_id = v_customer_id;

        IF SQL%ROWCOUNT = 0 THEN
            DBMS_OUTPUT.PUT_LINE('No customer found with ID ' || v_customer_id);
        ELSE
            DBMS_OUTPUT.PUT_LINE('Email updated successfully for customer ID ' || v_customer_id);
        END IF;
    END;
    /   
    ```

4. Write a PL/SQL function that accepts a customer ID and returns the customer's full name (first name + last name).

    ```sql
    CREATE OR REPLACE FUNCTION get_customer_full_name (
        cus_id IN NUMBER
    ) RETURN VARCHAR2 IS
        v_first_name customers.first_name%TYPE;
        v_last_name customers.last_name%TYPE;
        v_full_name VARCHAR2(101);
    BEGIN
        SELECT first_name, last_name INTO v_first_name, v_last_name
        FROM customers
        WHERE customer_id = cus_id;

        v_full_name := v_first_name || ' ' || v_last_name;
        RETURN v_full_name;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 'No such customer';
        WHEN OTHERS THEN
            RETURN 'An error occurred';
    END get_customer_full_name;
    /

    -- Example call to the function
    DECLARE
        full_name VARCHAR2(101);
    BEGIN
        full_name := get_customer_full_name(101);
        DBMS_OUTPUT.PUT_LINE('Customer Full Name: ' || full_name);
    END;
    /
    ```

5. Write a PL/SQL procedure that gives a bonus to employees based on their annual sales:
    - 10% bonus if sales are greater than 100000.
    - 5% bonus if sales are between 50000 and 100000.
    - 2% bonus if sales are less than 50000.

    The procedure should update the employee's salary with the bonus and print the new salary.

    ```sql
    CREATE OR REPLACE PROCEDURE give_bonus IS
        CURSOR employee_cursor IS
            SELECT employee_id, salary, annual_sales
            FROM employees
            FOR UPDATE OF salary;

        v_employee_id employees.employee_id%TYPE;
        v_salary employees.salary%TYPE;
        v_annual_sales employees.annual_sales%TYPE;
        v_bonus NUMBER;
    BEGIN
        OPEN employee_cursor;

        LOOP
            FETCH employee_cursor INTO v_employee_id, v_salary, v_annual_sales;
            EXIT WHEN employee_cursor%NOTFOUND;

            IF v_annual_sales > 100000 THEN
                v_bonus := v_salary * 0.10;
            ELSIF v_annual_sales BETWEEN 50000 AND 100000 THEN
                v_bonus := v_salary * 0.05;
            ELSE
                v_bonus := v_salary * 0.02;
            END IF;

            v_salary := v_salary + v_bonus;

            UPDATE employees
            SET salary = v_salary
            WHERE CURRENT OF employee_cursor;

            DBMS_OUTPUT.PUT_LINE('Employee ID: ' || v_employee_id || ', New Salary: ' || v_salary);
        END LOOP;

        CLOSE employee_cursor;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('An error occurred.');
    END give_bonus;
    /

    -- Example call to the procedure
    BEGIN
        give_bonus;
    END;
    /
    ```

6. Write a PL/SQL function that accepts a customer's email and returns the customer's record using %ROWTYPE. If the customer does not exist, return an appropriate message.

    ```sql
    CREATE OR REPLACE FUNCTION get_customer_record (
        cus_email IN customers.email%TYPE
    ) RETURN customers%ROWTYPE IS
        v_customer_record customers%ROWTYPE;
    BEGIN
        SELECT * INTO v_customer_record
        FROM customers
        WHERE email = cus_email;

        RETURN v_customer_record;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('No such customer');
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('An error occurred');
    END get_customer_record;
    /

    -- Example call to the function
    DECLARE
        v_customer customers%ROWTYPE;
    BEGIN
        v_customer := get_customer_record('
        DBMS_OUTPUT.PUT_LINE('Customer ID: ' || v_customer.customer_id);
        DBMS_OUTPUT.PUT_LINE('Customer Name: ' || v_customer.first_name || ' ' || v_customer.last_name);
        DBMS_OUTPUT.PUT_LINE('Customer Email: ' || v_customer.email);
    END;
    /
    ```

7. Write a PL/SQL procedure that gives a performance bonus to employees based on their annual sales using %ROWTYPE. The bonus rules are:

    - 10% bonus if sales are greater than 100000.
    - 5% bonus if sales are between 50000 and 100000.
    - 2% bonus if sales are less than 50000.

    The procedure should update the employee's salary with the bonus and print the new salary.

    ```sql
    CREATE OR REPLACE PROCEDURE give_performance_bonus IS
        CURSOR employee_cursor IS
            SELECT *
            FROM employees
            FOR UPDATE OF salary;

        v_employee employees%ROWTYPE;
        v_bonus NUMBER;
    BEGIN
        OPEN employee_cursor;

        LOOP
            FETCH employee_cursor INTO v_employee;
            EXIT WHEN employee_cursor%NOTFOUND;

            IF v_employee.annual_sales > 100000 THEN
                v_bonus := v_employee.salary * 0.10;
            ELSIF v_employee.annual_sales BETWEEN 50000 AND 100000 THEN
                v_bonus := v_employee.salary * 0.05;
            ELSE
                v_bonus := v_employee.salary * 0.02;
            END IF;

            v_employee.salary := v_employee.salary + v_bonus;

            UPDATE employees
            SET salary = v_employee.salary
            WHERE CURRENT OF employee_cursor;

            DBMS_OUTPUT.PUT_LINE('Employee ID: ' || v_employee.employee_id || ', New Salary: ' || v_employee.salary);
        END LOOP;

        CLOSE employee_cursor;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('An error occurred.');
    END give_performance_bonus;
    /

    -- Example call to the procedure
    BEGIN
        give_performance_bonus;
    END;
    /
    ```