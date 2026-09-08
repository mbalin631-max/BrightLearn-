CREATE CATALOG IF NOT EXISTS wholesale;

CREATE SCHEMA IF NOT EXISTS electronic;

--THE PRODUCTS TABLE
CREATE TABLE IF NOT EXISTS products (product_id INT, product_name STRING, price INT);
INSERT INTO products VALUES (1, 'Laptop', 1200), (2 , 'Phone', 800), (3, 'Keyboard', 45), (4, 'Monitor', 300), (5, 'Mouse', 25);

SELECT * FROM products;

--Question1: Classify each product by price into the three tiers below.
SELECT product_name, price,
CASE
    WHEN price > 1000 THEN 'Expensive'
    WHEN price BETWEEN 100 AND 1000 THEN 'Mid-range'
    WHEN price < 100 THEN 'Budget'
END AS price_category
FROM products;CREATE SCHEMA IF NOT EXISTS electronic;

--THE ORDERS TABLE
CREATE TABLE IF NOT EXISTS orders (order_id INT, customer_name STRING, amount DECIMAL);
INSERT INTO orders VALUES (1, 'Alice', 150.00), (2 , 'Bob', 560.00), (3, 'Charlie', 999.99), (4, 'Diana', 45.50), (5, 'Ethan', 1200.00);

SELECT * FROM orders;

--Question2: Label each order by its value.
SELECT customer_name, amount,
CASE
    WHEN amount >= 1000 THEN 'High value'
    WHEN amount BETWEEN 500 AND 999.99 THEN 'Medium value'
    WHEN amount < 500 THEN 'Low value'
END AS order_value_category
FROM orders;


--THE EMPLOYEES TABLE 
CREATE TABLE IF NOT EXISTS employees (emp_id INT, emp_name STRING, department STRING, salary INT);
INSERT INTO employees VALUES (1, 'John', 'IT', 85000), (2 , 'Sara', 'HR', 60000), (3, 'Mark', 'IT', 75000), (4, 'Lucy', 'Finance', 95000), (5, 'Tom', 'HR', 55000);

SELECT * FROM employees;

--Question3: Categorize each employee's position level using both department & salary.
SELECT emp_name, department, salary,
CASE
    WHEN department = 'IT' AND salary > 80000 THEN 'Senior IT'
    WHEN department = 'HR' AND salary > 55000 THEN 'Experience HR'
    ELSE 'Staff'
END AS position_level
FROM employees;

--THE STUDENTS TABLE
CREATE TABLE IF NOT EXISTS students (student_id INT, student_name STRING, score INT);
INSERT INTO students VALUES (1, 'Anna', 92), (2 , 'Ben', 76), (3, 'Cara', 59), (4, 'David', 83), (5, 'Ella', 68);

SELECT * FROM students;

--Question4: Assign each student a letter grade based on their score.
SELECT student_name, score,
CASE
    WHEN score >= 90 THEN 'A'
    WHEN score BETWEEN 80 AND 89 THEN 'B'
    WHEN score BETWEEN 70 AND 79 THEN 'C'
    WHEN score BETWEEN 60 AND 69 THEN 'D'
    WHEN score < 60 THEN 'F'
END AS grade
FROM students;

--THE DELIVERIES TABLE
CREATE TABLE IF NOT EXISTS deliveries (delivery_id INT, delivery_time_minutes INT);
INSERT INTO deliveries VALUES (1, 45), (2 , 80), (3, 30), (4, 65), (5, 100);

SELECT * FROM deliveries;

--Question5: Label delivery performance based on the time taken
SELECT delivery_id, delivery_time_minutes,
CASE
    WHEN delivery_time_minutes <= 30 THEN 'Fast'
    WHEN delivery_time_minutes BETWEEN 31 AND 60 THEN 'On Time'
    WHEN delivery_time_minutes > 60 THEN 'Late'
END AS performance
FROM deliveries;

--THE TICKETS TABLE
CREATE TABLE IF NOT EXISTS tickets (ticket_id INT, issue_type STRING, priority INT);
INSERT INTO tickets VALUES (1, 'Login issue', 1), (2 , 'Server down', 3), (3, 'Slow system', 2), (4, 'Email error', 2), (5, 'Password reset', 1);

SELECT * FROM tickets;

--Question6: Convert the numeric priority into a readable label.
SELECT issue_type, priority,
CASE
    WHEN priority = 3 THEN 'High'
    WHEN priority = 2 THEN 'Medium'
    WHEN priority = 1 THEN 'Low'
END AS priority_label
FROM tickets;

--THE ATTENDANCE TABLE
CREATE TABLE IF NOT EXISTS attendance (student_id INT, days_present INT, total_days INT);
INSERT INTO attendance VALUES (1, 45, 50), (2, 30, 50), (3, 48, 50), (4, 25, 50), (5, 50,50);

SELECT * FROM attendance;

--Question7: Calculate attendance percentage and classify the result
SELECT student_id, (days_present/total_days)*100 AS attendance_percentage,
CASE
    WHEN (days_present/total_days)*100 >= 90 THEN 'Excellent'
    WHEN (days_present/total_days)*100 BETWEEN 75 AND 89 THEN 'Good'
    WHEN (days_present/total_days)*100 < 75 THEN 'Needs Improvement'
END AS attendance_status
FROM attendance;

--THE PRODUCTS INVENTORY TABLE
CREATE TABLE IF NOT EXISTS products_inventory (product_id INT, stock_quantity INT);
INSERT INTO products_inventory VALUES (1, 5), (2, 0), (3, 25), (4, 10), (5, 3);

SELECT* FROM products_inventory;

--Question8: Label the stock status of each product
SELECT product_id, stock_quantity,
CASE
    WHEN stock_quantity = 0 THEN 'Out of Stock'
    WHEN stock_quantity BETWEEN 1 AND 5  THEN 'Low Stock'
    WHEN stock_quantity > 5 THEN 'In Stock'
    END AS stock_status
FROM products_inventory;

--THE CLASSES TABLE 
CREATE TABLE IF NOT EXISTS classes (class_id INT, subject STRING, enrolled_students INT);
INSERT INTO classes VALUES (1, 'Math', 30), (2, 'English', 25), (3, 'Science', 15), (4, 'Art', 5), (5, 'History', 20);

SELECT* FROM classes;

--Question9: Classify each class by the number of enrolled students
SELECT subject, enrolled_students,
CASE
    WHEN enrolled_students >= 25 THEN 'Large'
    WHEN enrolled_students BETWEEN 10 AND 24 THEN 'Medium'
    WHEN enrolled_students < 10 THEN 'Small'
END AS class_size_category
FROM classes;

--THE PAYMENTS TABLE
CREATE TABLE IF NOT EXISTS payments (payments_id INT, amount DECIMAL, payment_method STRING);
INSERT INTO payments VALUES (1, 50.00, 'Card'), (2, 200.00, 'Cash'), (3, 150.00, 'Card'), (4, 75.00, 'PayPal'), (5, 300.00, 'Cash');

SELECT* FROM payments;

--Question10: Apply a discount flag based on the payment method and amount.
SELECT payments_id, payment_method, amount,
CASE
    WHEN payment_method = 'Cash' AND amount >= 200 THEN 'Eligible for Discount'
    ELSE 'Not Eligible'
    END AS discount_eligibility
FROM payments;
