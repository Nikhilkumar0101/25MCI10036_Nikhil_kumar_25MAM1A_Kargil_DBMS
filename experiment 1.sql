CREATE TABLE Department (
    dept_id int PRIMARY KEY,
    dept_name VARCHAR(50) UNIQUE NOT NULL,
    location VARCHAR(50) NOT NULL
);

CREATE TABLE Employee (
    emp_id int PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    salary int CHECK (salary > 0),
    dept_id int,
    CONSTRAINT fk_dept FOREIGN KEY (dept_id)
    REFERENCES Department(dept_id)
);

CREATE TABLE Project (
    project_id int PRIMARY KEY,
    project_name VARCHAR(50) NOT NULL,
    dept_id int,
    CONSTRAINT fk_project_dept FOREIGN KEY (dept_id)
    REFERENCES Department(dept_id)
);

INSERT INTO Department VALUES (1, 'HR', 'Mumbai');
INSERT INTO Department VALUES (2, 'IT', 'Pune');
INSERT INTO Department VALUES (3, 'Finance', 'Delhi');
INSERT INTO Department VALUES (4, 'Marketing', 'Bangalore');
INSERT INTO Department VALUES (5, 'Operations', 'Chennai');


INSERT INTO Employee VALUES (101, 'Amit', 'amit@org.com', 40000, 2);
INSERT INTO Employee VALUES (102, 'Neha', 'neha@org.com', 35000, 1);
INSERT INTO Employee VALUES (103, 'Rohit', 'rohit@org.com', 50000, 2);
INSERT INTO Employee VALUES (104, 'Pooja', 'pooja@org.com', 38000, 3);
INSERT INTO Employee VALUES (105, 'Karan', 'karan@org.com', 42000, 4);
INSERT INTO Employee VALUES (106, 'Sneha', 'sneha@org.com', 36000, 5);
INSERT INTO Employee VALUES (107, 'Anjali', 'anjali@org.com', 47000, 2);


INSERT INTO Project VALUES (201, 'Payroll System', 1);
INSERT INTO Project VALUES (202, 'Web Portal', 2);
INSERT INTO Project VALUES (203, 'Accounting Software', 3);
INSERT INTO Project VALUES (204, 'Ad Campaign', 4);
INSERT INTO Project VALUES (205, 'Inventory System', 5);
INSERT INTO Project VALUES (206, 'Mobile App', 2);

Select * from Department;
Select * from Employee;
Select * from Project;

UPDATE Employee
SET salary = 45000
WHERE emp_id = 101;

DELETE FROM Project
WHERE project_id = 201;

CREATE ROLE report_user LOGIN PASSWORD 'report123';

GRANT SELECT ON Department TO report_user;
GRANT SELECT ON Employee TO report_user;
GRANT SELECT ON Project TO report_user;

REVOKE CREATE ON SCHEMA public FROM report_user;

ALTER TABLE Employee
ADD phone_number VARCHAR(15);

ALTER TABLE Employee
MODIFY emp_name VARCHAR(100);

DROP TABLE Project;



