-- https://pastebin.com/tQJpVQ3A

-- Create customers table
CREATE TABLE customers (
    customer_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    email VARCHAR2(100),
    total_purchase NUMBER,
    loyalty_points NUMBER
);

-- Create employees table
CREATE TABLE employees (
    employee_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    salary NUMBER,
    annual_sales NUMBER
);

-- Insert statements for customers table
INSERT INTO customers (customer_id, first_name, last_name, email, total_purchase, loyalty_points)
VALUES (101, 'John', 'Doe', 'john.doe@example.com', 12000, 240);

INSERT INTO customers (customer_id, first_name, last_name, email, total_purchase, loyalty_points)
VALUES (102, 'Jane', 'Smith', 'jane.smith@example.com', 8000, 80);

INSERT INTO customers (customer_id, first_name, last_name, email, total_purchase, loyalty_points)
VALUES (103, 'Michael', 'Johnson', 'michael.johnson@example.com', 3000, 30);

INSERT INTO customers (customer_id, first_name, last_name, email, total_purchase, loyalty_points)
VALUES (104, 'Emily', 'Davis', 'emily.davis@example.com', 500, 2.5);

INSERT INTO customers (customer_id, first_name, last_name, email, total_purchase, loyalty_points)
VALUES (105, 'Daniel', 'Wilson', 'daniel.wilson@example.com', 15000, 300);

-- Insert statements for employees table
INSERT INTO employees (employee_id, first_name, last_name, salary, annual_sales)
VALUES (201, 'Alice', 'Brown', 70000, 110000);

INSERT INTO employees (employee_id, first_name, last_name, salary, annual_sales)
VALUES (202, 'Robert', 'Taylor', 60000, 90000);

INSERT INTO employees (employee_id, first_name, last_name, salary, annual_sales)
VALUES (203, 'Jessica', 'Anderson', 50000, 60000);

INSERT INTO employees (employee_id, first_name, last_name, salary, annual_sales)
VALUES (204, 'David', 'Thomas', 45000, 30000);

INSERT INTO employees (employee_id, first_name, last_name, salary, annual_sales)
VALUES (205, 'Sarah', 'Moore', 80000, 125000);
