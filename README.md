# PL/SQL Revision Guide for ADBM Module

## Introduction to PL/SQL

PL/SQL (Procedural Language/Structured Query Language) is Oracle Corporation's procedural extension for SQL and the Oracle relational database. PL/SQL allows the creation of powerful scripts, enabling complex business logic directly within the database.

### Importance of PL/SQL

- **Integration with SQL:** PL/SQL extends SQL with procedural constructs, making it easier to create complex business logic.
- **Performance:** PL/SQL can execute multiple SQL statements in a single block, reducing network traffic and improving performance.
- **Portability:** Code written in PL/SQL can be ported across different platforms with minimal changes.
- **Error Handling:** PL/SQL has robust error handling features, which help in managing exceptions effectively.
- **Modularity:** PL/SQL supports the development of modular code with procedures, functions, packages, and triggers.

## Key Concepts in PL/SQL

### Blocks

A PL/SQL program is made up of blocks, which can be anonymous or named (procedures, functions). Each block consists of:

- **Declaration Section:** Variables, constants, and other objects are declared here.
- **Execution Section:** Contains the executable statements.
- **Exception Handling Section:** Handles runtime errors or exceptions.

```sql
DECLARE
    -- Declarations
BEGIN
    -- Executable Statements
EXCEPTION
    -- Exception Handling Statements
END;
/
```

### Procedures
A procedure is a subprogram that performs a specific action. It can accept parameters but does not return a value.

Example:
```sql
CREATE OR REPLACE PROCEDURE greet_customer (customer_name IN VARCHAR2) IS
BEGIN
    DBMS_OUTPUT.PUT_LINE('Hello, ' || customer_name || '!');
END greet_customer;
/
```

### Functions
A function is a subprogram that returns a single value. It can accept parameters and must have a return clause.

Example:
```sql
CREATE OR REPLACE FUNCTION calculate_bonus (salary IN NUMBER) RETURN NUMBER IS
    bonus NUMBER;
BEGIN
    bonus := salary * 0.10;
    RETURN bonus;
END calculate_bonus;
/

```

### Differences Between Procedures and Functions
- Return Value: A function must return a value, whereas a procedure does not.
- Usage in SQL: Functions can be used in SQL statements, while procedures cannot.
- Purpose: Functions generally perform computations and return results, whereas procedures perform actions.

### Cursors
Cursors are used to fetch multiple rows from a query. They can be explicit or implicit.

Example:
```sql
DECLARE
    CURSOR customer_cursor IS
        SELECT customer_id, first_name, last_name FROM customers;
    customer_rec customer_cursor%ROWTYPE;
BEGIN
    OPEN customer_cursor;
    LOOP
        FETCH customer_cursor INTO customer_rec;
        EXIT WHEN customer_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Customer ID: ' || customer_rec.customer_id || ', Name: ' || customer_rec.first_name || ' ' || customer_rec.last_name);
    END LOOP;
    CLOSE customer_cursor;
END;
/
```




