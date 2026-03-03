-- step 0
Create table employee(
emp_id serial primary key,
emp_name varchar(50),
experience int,
performance_score int,
salary int
);

insert into employee (emp_name, experience, performance_score, salary) values
('Rahul', 2, 6, 30000),
('Anita', 5, 8, 50000),
('Vikas', 1, 5, 25000),
('Neha', 7, 9, 70000),
('Aman', 3, 6, 35000),
('Pooja', 10, 10, 90000);

select * from employee;

-- step 1
DO $$
DECLARE
    emp_rec RECORD;
    emp_cursor CURSOR FOR
        SELECT emp_id, emp_name, salary FROM employee;
BEGIN
    OPEN emp_cursor;
    LOOP
        FETCH emp_cursor INTO emp_rec;
        EXIT WHEN NOT FOUND;
        RAISE NOTICE 'ID: %, Name: %, Salary: %',
                     emp_rec.emp_id,
                     emp_rec.emp_name,
                     emp_rec.salary;
    END LOOP;
    CLOSE emp_cursor;
END $$;

-- Step 2
DO $$
DECLARE
    emp_rec RECORD;
    increment_amount INT;
	emp_cursor CURSOR FOR
		SELECT emp_id, experience, performance_score, salary
		FROM employee;
BEGIN
    OPEN emp_cursor;
    LOOP
        FETCH emp_cursor INTO emp_rec;
        EXIT WHEN NOT FOUND;

        -- Dynamic calculation
        increment_amount :=
            emp_rec.experience * emp_rec.performance_score * 500;

        UPDATE employee
        SET salary = salary + increment_amount
        WHERE emp_id = emp_rec.emp_id;

        RAISE NOTICE 'Emp ID % salary increased by %',
                     emp_rec.emp_id,
                     increment_amount;
    END LOOP;
    CLOSE emp_cursor;
END $$;

-- Step 3
DO $$
DECLARE
    emp_rec RECORD;
    emp_found BOOLEAN := FALSE;
	emp_cursor CURSOR FOR
        SELECT * FROM employee WHERE experience > 20; 
BEGIN
    OPEN emp_cursor;

    LOOP
        FETCH emp_cursor INTO emp_rec;
		EXIT WHEN NOT FOUND;

        emp_found := TRUE;

        RAISE NOTICE 'Employee: %, Experience: %',
                     emp_rec.emp_name,
                     emp_rec.experience;
    END LOOP;

    CLOSE emp_cursor;

    IF emp_found = FALSE THEN
        RAISE NOTICE 'No employees found for given criteria.';
    END IF;

EXCEPTION
    WHEN OTHERS THEN
        RAISE NOTICE 'Error occurred: %', SQLERRM;
END $$;