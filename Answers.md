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
