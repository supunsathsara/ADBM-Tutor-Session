### Question 1 (SQL Server)

#### 1.1 Opinion on "Windows Authentication is better than SQL Authentication"

**Opinion:** Agree

**Explanation:**
Windows Authentication is often considered better than SQL Authentication for several reasons:

1. **Security:** Windows Authentication uses Active Directory (AD) accounts which can leverage Windows security policies, such as password complexity, account lockout, and multi-factor authentication. This makes it inherently more secure.
2. **Centralized Management:** User accounts and permissions are managed centrally in Active Directory, simplifying user management and reducing administrative overhead.
3. **Single Sign-On (SSO):** Users can use their Windows credentials to access SQL Server without needing to remember a separate set of credentials, enhancing the user experience.
4. **Kerberos Protocol:** Windows Authentication can use the Kerberos security protocol, which is more secure than the NTLM protocol typically used by SQL Authentication.
5. **Reduced Attack Surface:** Since SQL Authentication requires storing and transmitting passwords, it increases the attack surface. Windows Authentication avoids this by using token-based authentication.

#### 1.2 Reason for Taking SQL Server Differential Backups

**Explanation:**
Differential backups are taken instead of full backups in certain situations because:

1. **Efficiency:** Differential backups only capture the data that has changed since the last full backup, making them much quicker to execute and reducing the backup window.
2. **Storage Savings:** They consume less storage space compared to full backups because they are smaller in size, storing only the changes rather than the entire database.
3. **Resource Utilization:** By minimizing the I/O and CPU resources needed for backups, differential backups can reduce the impact on the server’s performance, particularly during peak hours.
4. **Restore Time:** When restoring, using a full backup followed by the most recent differential backup can be faster than restoring multiple incremental backups, reducing the downtime.
5. **Backup Frequency:** For large databases, taking frequent full backups might be impractical. Differential backups allow for more frequent backups without the overhead of a full backup every time.

#### 1.3 Conditions for Selecting Clustered/Non-Clustered Indexes

**Clustered Index:**
1. **Primary Key:** Often used for the primary key of the table because it ensures that data is physically sorted in the order of the key.
2. **Range Queries:** Beneficial for columns frequently used in range queries (e.g., date ranges) because the data is physically stored in a contiguous block, making range retrieval faster.
3. **Unchanging Columns:** Ideal for columns that are not frequently updated, as changing the clustered key can cause data reorganization.

**Non-Clustered Index:**
1. **Secondary Keys:** Useful for columns frequently used in WHERE clauses, JOIN conditions, or as part of ORDER BY clauses but are not the primary key.
2. **Lookup Optimization:** Helps optimize searches for specific values without affecting the physical order of the rows.
3. **Multiple Indexing:** Allows multiple non-clustered indexes on a table, providing flexibility to optimize different types of queries.
4. **Filtered Indexes:** Non-clustered indexes can be filtered to include only a subset of rows, which can be very efficient for queries targeting specific subsets of data.
5. **Update Frequency:** Better suited for columns that are frequently updated, as non-clustered indexes do not require data reordering.

#### 1.4 Use of SQL Server Execution Plans in Real-World Situations

**Explanation:**
Execution plans are crucial for the following reasons:

1. **Query Optimization:** They provide insights into how SQL Server executes queries, allowing developers and DBAs to identify inefficient operations (e.g., table scans, missing indexes) and optimize them for better performance.
2. **Performance Tuning:** Execution plans help in pinpointing performance bottlenecks, such as expensive operations, by showing the cost associated with each part of the query.
3. **Index Recommendations:** They can suggest index improvements, helping to create or modify indexes that could make the query execution faster.
4. **Debugging:** Execution plans aid in debugging complex queries by breaking down the execution steps, making it easier to understand and fix issues.
5. **Baseline Comparison:** By comparing execution plans over time, one can track how query performance changes, identifying regressions or improvements after changes in the database schema, indexes, or query structure.

#### 1.5 Select Query to Display Names of All Constraints in Database NIBM

**Query:**
```sql
SELECT 
    CONSTRAINT_NAME 
FROM 
    INFORMATION_SCHEMA.TABLE_CONSTRAINTS 
WHERE 
    CONSTRAINT_CATALOG = 'NIBM';
```



### Question 2 (Oracle)

#### 2.1 PL/SQL Block to Compute Tax Amount Based on Employee Salary

**PL/SQL Block:**

```plsql
DECLARE
    CURSOR emp_cursor IS
        SELECT EMPLOYEE_ID, SALARY
        FROM EMPLOYEES;
    v_employee_id EMPLOYEES.EMPLOYEE_ID%TYPE;
    v_salary EMPLOYEES.SALARY%TYPE;
    v_tax_amount NUMBER;
BEGIN
    FOR emp_rec IN emp_cursor LOOP
        v_employee_id := emp_rec.EMPLOYEE_ID;
        v_salary := emp_rec.SALARY;

        IF v_salary IS NULL THEN
            v_tax_amount := 0;
        ELSIF v_salary BETWEEN 150000 AND 250000 THEN
            v_tax_amount := v_salary * 0.01;
        ELSIF v_salary BETWEEN 250001 AND 500000 THEN
            v_tax_amount := v_salary * 0.05;
        ELSIF v_salary > 500000 THEN
            v_tax_amount := v_salary * 0.10;
        ELSE
            v_tax_amount := 0;
        END IF;

        DBMS_OUTPUT.PUT_LINE('Employee ID: ' || v_employee_id || ' Tax Amount: ' || v_tax_amount);
    END LOOP;
END;
```
### 2.2 PL/SQL Block to Print Specified Output Using a FOR Loop

```sql
BEGIN
    DBMS_OUTPUT.PUT_LINE('Program started.');
    
    FOR i IN 1..3 LOOP
        FOR j IN 1..i LOOP
            DBMS_OUTPUT.PUT_LINE(i);
        END LOOP;
    END LOOP;

    DBMS_OUTPUT.PUT_LINE('Program completed.');
END;
```

### Question 3

#### 3.1 Recommendation for Using a Mobile App with a Mobile Database for a Salesman in a Remote Location

**Recommendation:**

Using a mobile app with a mobile database offers several advantages for a salesman working in a remote location:

1. **Offline Access:**
   - The salesman can access and update critical data even without an internet connection, ensuring uninterrupted workflow and data consistency.

2. **Real-Time Data Synchronization:**
   - When connectivity is available, data can be synchronized with the central database, ensuring that the latest information is available to all stakeholders.

3. **Increased Efficiency:**
   - Mobile apps streamline the sales process by providing quick access to customer data, product catalogs, and sales records, enabling the salesman to make informed decisions on the spot.

4. **Data Accuracy:**
   - Immediate data entry reduces the chances of errors associated with manual data recording and later transcription.

5. **Enhanced Customer Interaction:**
   - The salesman can provide instant responses to customer inquiries and process orders on-site, improving customer satisfaction and engagement.

6. **Productivity Tracking:**
   - The app can include features to track the salesman's activities, such as meetings and sales made, helping in performance evaluation and time management.

7. **Security:**
   - Mobile databases can incorporate encryption and other security measures to protect sensitive customer and sales data, which is crucial in remote or unsecured environments.

8. **Resource Optimization:**
   - Reduces the need for paper-based documentation, minimizing administrative overhead and errors associated with manual processes.

9. **Flexibility and Scalability:**
   - Mobile apps can be easily updated with new features and can scale to accommodate more data and users as the business grows.

10. **Competitive Advantage:**
    - Equipping sales teams with mobile technology can give a business a competitive edge by improving responsiveness and efficiency in the sales process.

By leveraging a mobile app with a mobile database, the salesman can maintain high productivity levels, ensure data integrity, and provide better service to customers, all of which contribute to overall business success.

#### 3.2 SQLite Query to Retrieve 4 Records Starting from CustomerID = 3

```sql
SELECT * 
FROM Customer 
WHERE CustomerID >= 3 
ORDER BY CustomerID 
LIMIT 4;
```


#### 3.3 SQL Commands for 'Employee' Table

##### 1. Create 'Employee' Table
```sql
CREATE TABLE Employee (
    Name VARCHAR(100),
    Age INT,
    Address VARCHAR(255),
    Salary DECIMAL(10, 2)
);
```

##### 2. Show Employees with Address Containing a '-' Sign

```sql
SELECT * 
FROM Employee 
WHERE Address LIKE '%-%';
```

##### 3. UShow Employees Whose Salary Contains '150'

```sql
SELECT * 
FROM Employee 
WHERE Salary LIKE '%150%';
```

##### 4. Show Employees Whose Age Contains '2'

```sql
SELECT * 
FROM Employee 
WHERE Age LIKE '%2%';
```

##### 5. Update the Salary with a 10% Increase for Employees Whose Name Ends with 'T'

```sql
UPDATE Employee 
SET Salary = Salary * 1.10 
WHERE Name LIKE '%T';
```

### Question 4 (MongoDB)

#### 4.1 Justification for Using MongoDB

The student proposed MongoDB as the suitable database management system for developing highly available and scalable internet applications. Here are five points justifying this choice:

1. **Horizontal Scale-Out Architecture:**
   - MongoDB supports sharding, a method for distributing data across multiple machines. This horizontal scaling allows for handling large volumes of data and high-throughput applications by adding more servers rather than upgrading existing ones.

2. **Flexible Schema:**
   - MongoDB uses a document-oriented data model, allowing for a flexible schema. This means that documents in a collection do not need to have the same set of fields, and data structures can evolve over time without requiring alterations to the existing data model.

3. **High Availability:**
   - MongoDB provides high availability through replica sets, which are groups of MongoDB servers that maintain the same data set, providing redundancy and automated failover. This ensures that the application remains available even if some servers fail.

4. **Support for Unstructured Data:**
   - MongoDB can store and manage unstructured or semi-structured data efficiently. This is particularly useful for applications that deal with varied and unpredictable data formats, such as social media content or log data.

5. **Developer Productivity:**
   - The document-based structure of MongoDB, along with its support for rich queries, indexing, and aggregation, makes it easier for developers to work with data in a natural, object-oriented manner. This reduces the impedance mismatch between the database and the application code.

#### 4.2 MongoDB Shell Commands for Given Dataset

**4.2.1 Create a Collection Called 'Book'**

```javascript
db.createCollection("Book");
```

**4.2.2 Add Two Objects to 'Book' Collection at Once***

```javascript
db.Book.insertMany([
    {"_id": 1, "title": "Unlocking Android", "isbn": "1933988673", "pageCount": 416, "Price": 5000},
    {"_id": 2, "title": "Android in Action, Second Edition", "isbn": "1935182722", "pageCount": 592, "Price": 2800.50}
]);
```

**4.2.3 Find All Objects with More Than 500 Pages**

```javascript
db.Book.find({ "pageCount": { $gt: 500 } });
```

**4.2.4 Find All Objects with More Than 500 Pages and Price Less Than 5000**

```javascript
db.Book.find({ "pageCount": { $gt: 500 }, "Price": { $lt: 5000 } });
```

**4.2.5Update the Price of the "Flex 3 in Action" Book to 8500**

```javascript
db.Book.updateOne(
    { "title": "Flex 3 in Action" },
    { $set: { "Price": 8500 } }
);
```

