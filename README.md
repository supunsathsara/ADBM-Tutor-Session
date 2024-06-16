
# Advanced Database Management (ADBM) Module Revision Guide

This revision guide covers key concepts and topics related to the Advanced Database Management (ADBM) module. It includes summaries, examples, and explanations of important concepts in SQL, PL/SQL, and MongoDB.

## Table of Contents

- [PL/SQL Revision Guide for ADBM Module](#plsql-revision-guide-for-adbm-module)
- [MongoDB Revision Guide for ADBM Module](#mongodb-revision-guide-for-adbm-module)

---

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

### IF-ELSE Statements
The IF-ELSE statement is used to conditionally execute a block of code based on a condition.

Example:
```sql
DECLARE
    age NUMBER := 20;
BEGIN

    IF age >= 18 THEN
        DBMS_OUTPUT.PUT_LINE('You are an adult.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('You are a minor.');
    END IF;

END;
/
```

### Loops
Loops are used to execute a block of code repeatedly until a certain condition is met.

#### WHILE Loop
The WHILE loop executes a block of code as long as a condition is true.

Example:
```sql
DECLARE
    counter NUMBER := 1;
BEGIN
    WHILE counter <= 5 LOOP
        DBMS_OUTPUT.PUT_LINE('Counter: ' || counter);
        counter := counter + 1;
    END LOOP;
END;
/
```

#### FOR Loop
The FOR loop is used to iterate over a range of values.

Example:
```sql
DECLARE
    counter NUMBER; 
BEGIN

    FOR counter IN 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE('Counter: ' || counter);
    END LOOP;

END;
/
```

When using a FOR loop, the counter variable is automatically incremented.

To exit a loop, you can use the `EXIT` statement.
Example:
```sql
DECLARE
    counter NUMBER;
BEGIN
        FOR counter IN 1..10 LOOP
            IF counter = 5 THEN
                EXIT;
            END IF;
            DBMS_OUTPUT.PUT_LINE('Counter: ' || counter);
        END LOOP;
    
    END;
    /
```

To Exit when a condition is met, you can use the `EXIT WHEN` statement.
Example:
```sql
DECLARE
    counter NUMBER;
BEGIN
    FOR counter IN 1..10 LOOP
        EXIT WHEN counter = 5;
        DBMS_OUTPUT.PUT_LINE('Counter: ' || counter);
    END LOOP;
END;
/
```

### Arrays
Arrays in PL/SQL are called collections. When working with arrays you need to remember the following:
- Collections are indexed from 1.
- Collections can be nested.
- Collections can be of different types.


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

### Different Types of Cursors

- **Implicit Cursor:** Automatically created by Oracle when executing a SQL statement. It is used for single-row queries.
- **Explicit Cursor:** Defined by the programmer for more complex queries that return multiple rows.

#### Cursor Attributes
- `%FOUND`: Returns TRUE if the cursor has fetched a row.
- `%NOTFOUND`: Returns TRUE if the cursor has not fetched a row.
- `%ROWCOUNT`: Returns the number of rows fetched so far.

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
- `%ROWTYPE` is used to define a record variable that matches the structure of the cursor. 
- `%NOTFOUND` is used to exit the loop when all rows have been fetched.


### Exception Handling
PL/SQL provides robust error handling mechanisms to manage exceptions that may occur during program execution.

Example:
```sql
BEGIN
    -- Code that may raise exceptions
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('No data found.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('An error occurred.');
END;
/
```

### Important Exception Types
- **NO_DATA_FOUND:** Raised when a SELECT INTO statement returns no rows.
- **TOO_MANY_ROWS:** Raised when a SELECT INTO statement returns multiple rows.
- **ZERO_DIVIDE:** Raised when division by zero occurs.
- **OTHERS:** Handles all other exceptions not explicitly handled.

<hr>

# MongoDB Revision Guide for ADBM Module

### Understanding MongoDB Query Structure

#### 1. Basic Structure of a MongoDB Query

- **db.collection.method(query, update, options)**
  - `db`: Refers to the database object.
  - `collection`: The collection within the database where the operation is performed.
  - `method`: The action you want to perform (e.g., find, insert, update, delete).
  - `query`: Specifies the criteria to match documents.
  - `update`: Specifies how to modify the matched documents (used in update operations).
  - `options`: Additional parameters to customize the operation (optional).

#### 2. Creating a Collection

Creating a collection in MongoDB is usually implicit, meaning it is created when you first insert a document. However, you can explicitly create a collection using:
```js
db.createCollection("collectionName");
```
#### 3. Inserting Documents

- Insert a Single Document:
```js
  db.collection.insertOne({
    field1: "value1",
    field2: "value2"
  });
```
- Insert Multiple Documents:
```js
  db.collection.insertMany([
    { field1: "value1", field2: "value2" },
    { field1: "value3", field2: "value4" }
  ]);
  ```

#### 4. Retrieving Documents

- Find All Documents:
```js
  db.collection.find();
```
- Find Documents with Criteria:
```js
  db.collection.find({ field: "value" });
```
- Find with Logical Operators:
```js
  db.collection.find({ field: { $gt: 100 } });  // greater than 100
  db.collection.find({ field: { $lt: 100 } });  // less than 100
  db.collection.find({ field: { $in: [value1, value2] } });  // in array of values
```
#### 5. Updating Documents

- Update a Single Document:
```js
  db.collection.updateOne(
    { queryField: "queryValue" }, // query to match the document
    { $set: { fieldToUpdate: "newValue" } } // update operation
  );
  ```

- Update Multiple Documents:
```js
  db.collection.updateMany(
    { queryField: "queryValue" }, // query to match documents
    { $set: { fieldToUpdate: "newValue" } } // update operation
  );
  ```

- Common Update Operators:
  - `$set`: Set the value of a field.
  - `$inc`: Increment the value of a field.
  - `$push`: Add an element to an array.
  - `$pull`: Remove an element from an array.

#### 6. Deleting Documents

- Delete a Single Document:
```js
  db.collection.deleteOne({ field: "value" });
```

- Delete Multiple Documents:
```js
  db.collection.deleteMany({ field: "value" });
```
