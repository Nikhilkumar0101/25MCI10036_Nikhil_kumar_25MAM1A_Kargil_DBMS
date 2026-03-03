-- Step 0
CREATE TABLE departments (
    dept_id SERIAL PRIMARY KEY,
    dept_name VARCHAR(50)
);

CREATE TABLE employees (
    emp_id SERIAL PRIMARY KEY,
    emp_name VARCHAR(50),
    status VARCHAR(10),        
    salary INT,
    dept_id INT REFERENCES departments(dept_id)
);

INSERT INTO departments (dept_name) VALUES
('HR'),
('IT'),
('Finance'),
('Sales');

INSERT INTO employees (emp_name, status, salary, dept_id) VALUES
('Rahul', 'ACTIVE', 50000, 2),
('Anita', 'ACTIVE', 60000, 3),
('Vikas', 'INACTIVE', 40000, 2),
('Neha', 'ACTIVE', 70000, 4),
('Aman', 'ACTIVE', 45000, 1),
('Pooja', 'INACTIVE', 30000, 1);

SELECT * FROM departments;
SELECT * FROM employees;

-- Step 1
CREATE VIEW active_employees AS
SELECT emp_id, emp_name, salary
FROM employees
WHERE status = 'ACTIVE';

SELECT * FROM active_employees;

-- Step 2
CREATE VIEW employee_department_view AS
SELECT 
    e.emp_id,
    e.emp_name,
    d.dept_name,
    e.salary
FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id;

SELECT * FROM employee_department_view;

-- Step 3
CREATE VIEW department_statistics AS
SELECT
    d.dept_name,
    COUNT(e.emp_id) AS total_employees,
    AVG(e.salary) AS avg_salary,
    MAX(e.salary) AS max_salary
FROM departments d
LEFT JOIN employees e
ON d.dept_id = e.dept_id
GROUP BY d.dept_name;

SELECT * FROM department_statistics;