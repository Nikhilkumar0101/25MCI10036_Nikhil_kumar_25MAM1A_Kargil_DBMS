-- For loop - Simple Iteration
DO $$
DECLARE
    i INT;
BEGIN
    FOR i IN 1..5 LOOP
        RAISE NOTICE 'Iteration number: %', i;
    END LOOP;
END $$;

-- For loop with query
create table employees(
emp_id int,
emp_name text,
salary numeric(10,2)
);

INSERT INTO employees VALUES
(1, 'Amit', 42000),
(2, 'Neha', 55000),
(3, 'Rahul', 48000),
(4, 'Priya', 62000);

DO $$
DECLARE
    rec RECORD;
BEGIN
    FOR rec IN SELECT emp_id, emp_name FROM employees LOOP
        RAISE NOTICE 'Employee ID: %, Name: %', rec.emp_id, rec.emp_name;
    END LOOP;
END $$;

-- While loop
DO $$
DECLARE
    counter INT := 1;
BEGIN
    WHILE counter <= 5 LOOP
        RAISE NOTICE 'Counter value: %', counter;
        counter := counter + 1;
    END LOOP;
END $$;

-- Loop with Exit When
DO $$
DECLARE
    x INT := 1;
BEGIN
    LOOP
        RAISE NOTICE 'Value: %', x;
        x := x + 1;

        EXIT WHEN x > 5;
    END LOOP;
END $$;

-- Salary increment using for loop
DO $$
DECLARE
    rec RECORD;
BEGIN
    FOR rec IN SELECT emp_id FROM employees LOOP
        UPDATE employees
        SET salary = salary + 1000
        WHERE emp_id = rec.emp_id;
    END LOOP;
END $$;

SELECT * FROM employees;

-- Combining loop with if conditiion
DO $$
DECLARE
    rec RECORD;
BEGIN
    FOR rec IN SELECT emp_name, salary FROM employees LOOP
        IF rec.salary >= 50000 THEN
            RAISE NOTICE '% is a High Salary Employee', rec.emp_name;
        ELSE
            RAISE NOTICE '% is a Low Salary Employee', rec.emp_name;
        END IF;
    END LOOP;
END $$;

