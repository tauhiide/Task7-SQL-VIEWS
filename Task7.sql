# Creating sample database for views demo.
CREATE DATABASE IF NOT EXISTS internship_task7;
USE internship_task7;

# Setting up departments and employees tables for joins.
CREATE TABLE IF NOT EXISTS departments (
    dept_id INT PRIMARY KEY AUTO_INCREMENT,
    dept_name VARCHAR(50) NOT NULL,
    location VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS employees (
    emp_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    dept_id INT,
    hire_date DATE,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);

# Adding sample data for testing views.
INSERT INTO departments (dept_name, location) VALUES 
('HR', 'New Delhi'),
('IT', 'Mumbai'),
('Finance', 'Calcutta');

INSERT INTO employees (first_name, last_name, salary, dept_id, hire_date) VALUES 
('Jahnvi', 'Doekle', 60000.00, 1, '2023-01-15'),
('July', 'Smitha', 75000.00, 2, '2022-05-20'),
('Alize', 'Johnson', 80000.00, 2, '2021-03-10'),
('Babita', 'Banargee', 55000.00, 3, '2024-02-01'),
('Charoo', 'Davi', 62000.00, 1, '2023-07-05');

# ANSWERING INTERVIEW QUESTIONS WITH THE HELP OF QUERIES
# Simple view for employee names and salary.
# Q1: View is a virtual table from SELECT.
CREATE VIEW employee_overview AS
SELECT emp_id, CONCAT(first_name, ' ', last_name) AS full_name, salary
FROM employees;
# Usage: SELECT * FROM employee_overview;

# Complex view with join and filter.
# Q6: Views abstract data, secure, reusable.
CREATE VIEW dept_employee_details AS
SELECT e.emp_id, e.first_name, e.last_name, e.salary, d.dept_name, d.location
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
WHERE e.salary > 60000.00;
# Usage: SELECT * FROM dept_employee_details;

# View hiding sensitive data.
# Q8: Secure by limiting column access.
CREATE VIEW public_employee_info AS
SELECT emp_id, first_name, last_name, dept_id
FROM employees;
# Usage: Grant SELECT on this, not base table.

# Testing view updates.
# Q2: Simple views updatable, complex not.


# UPDATE employee_overview SET salary = 65000.00 WHERE emp_id = 1; Works.
# UPDATE dept_employee_details SET salary = 80000; Fails due to join.

# Materialized view simulation.
# Q3: Stores data physically, unlike views.
CREATE TABLE materialized_employee AS SELECT * FROM employee_overview;
# Refresh: TRUNCATE TABLE materialized_employee; INSERT INTO materialized_employee SELECT * FROM employee_overview;

# View vs table.
# Q4: Table stores data, view is virtual query.
# Example: employees vs employee_overview.

# Dropping a view.
# Q5: Use DROP VIEW.
# DROP VIEW IF EXISTS public_employee_info;
# Recreated for demo.

# Indexed views.
# Q7: Only materialized views can be indexed.
CREATE INDEX idx_salary ON materialized_employee(salary);

# View limitations.
# Q9: Complex views not updatable, no direct index.
# Example: UPDATE dept_employee_details fails.

# WITH CHECK OPTION demo.
# Q10: Enforces WHERE in updates/inserts.
CREATE VIEW high_earners AS
SELECT * FROM employees WHERE salary > 70000.00
WITH CHECK OPTION;

# INSERT INTO high_earners (first_name, last_name, salary, dept_id, hire_date) VALUES ('Test', 'User', 60000.00, 1, '2025-01-01'); Fails.

# Aggregated view for reports.
CREATE VIEW dept_salary_summary AS
SELECT d.dept_name, AVG(e.salary) AS avg_salary, COUNT(e.emp_id) AS num_employees
FROM departments d
LEFT JOIN employees e ON d.dept_id = e.dept_id
GROUP BY d.dept_name;

 
