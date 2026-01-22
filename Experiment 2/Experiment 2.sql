-- Create table
CREATE TABLE employee_details (
    emp_id SERIAL PRIMARY KEY,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary NUMERIC(10,2),
    experience INT,
    joining_date DATE
);

-- Insert sample data
INSERT INTO employee_details (emp_name, department, salary, experience, joining_date) VALUES
('Amit', 'IT', 65000, 5, '2019-06-10'),
('Neha', 'HR', 42000, 3, '2021-02-15'),
('Rohan', 'Finance', 58000, 6, '2018-09-20'),
('Priya', 'IT', 72000, 7, '2017-01-05'),
('Kunal', 'Marketing', 45000, 4, '2020-07-12'),
('Sneha', 'HR', 48000, 5, '2019-11-18'),
('Vikram', 'Finance', 80000, 10, '2015-03-25');
SELECT * FROM employee_details

-- Employees with salary greater than 50000
SELECT * 
FROM employee_details
WHERE salary > 50000;

-- Employees from IT department
SELECT emp_name, department, salary
FROM employee_details
WHERE department = 'IT';

-- Sort employees by salary (ascending)
SELECT emp_name, department, salary
FROM employee_details
ORDER BY salary ASC;

-- Sort employees by experience (descending)
SELECT emp_name, department, experience
FROM employee_details
ORDER BY experience DESC;

-- Average salary per department
SELECT department, AVG(salary) AS avg_salary
FROM employee_details
GROUP BY department;

-- Number of employees in each department
SELECT department, COUNT(emp_id) AS employee_count
FROM employee_details
GROUP BY department;

-- Departments with average salary greater than 50000
SELECT department, AVG(salary) AS avg_salary
FROM employee_details
GROUP BY department
HAVING AVG(salary) > 50000;

-- Departments having more than or equal to 2 employees
SELECT department, COUNT(emp_id) AS employee_count
FROM employee_details
GROUP BY department
HAVING COUNT(emp_id) >= 2;


