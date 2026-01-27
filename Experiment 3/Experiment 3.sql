CREATE TABLE SCHEMA_ANALYSIS(
	report_id INT PRIMARY KEY,
    entity_name VARCHAR(50) NOT NULL,
    violation_count INT NOT NULL
);

INSERT INTO SCHEMA_ANALYSIS VALUES
(1, 'User_Schema', 0),
(2, 'Order_Schema', 2),
(3, 'Payment_Schema', 3),
(4, 'Inventory_Schema', 1),
(5, 'Audit_Schema', 10);

SELECT * FROM SCHEMA_ANALYSIS;

SELECT *,
CASE 
    WHEN violation_count = 0 THEN 'NO VIOLATION'
    WHEN violation_count BETWEEN 1 AND 2 THEN 'MINOR VIOLATION'
    ELSE 'CRITICAL VIOLATION'
END AS VIOLATION_CATEGORY
FROM SCHEMA_ANALYSIS;

ALTER TABLE SCHEMA_ANALYSIS
ADD COLUMN approval_status VARCHAR(20);

UPDATE SCHEMA_ANALYSIS
SET approval_status =
CASE
    WHEN violation_count = 0 THEN 'Approved'
    WHEN violation_count BETWEEN 1 AND 2 THEN 'Review'
    ELSE 'Rejected'
END;
SELECT * FROM SCHEMA_ANALYSIS;

DO $$
DECLARE
    v_violation_count INT := 2;   -- change value to test
BEGIN
    IF v_violation_count = 0 THEN
        RAISE NOTICE 'Status: Approved (No Violations)';
    ELSIF v_violation_count BETWEEN 1 AND 2 THEN
        RAISE NOTICE 'Status: Review (Minor Violations)';
    ELSE
        RAISE NOTICE 'Status: Rejected (Critical Violations)';
    END IF;
END $$;

CREATE TABLE Student (
    student_id SERIAL PRIMARY KEY,
    student_name VARCHAR(50),
    marks INT CHECK (marks BETWEEN 0 AND 100)
);

INSERT INTO Student (student_name, marks) VALUES
('Nikhil', 85),
('Amit', 72),
('Priya', 64),
('Rahul', 45),
('Sneha', 91);
SELECT * FROM Student;

DO $$
DECLARE
    marks INT := 85;   -- change value to test
BEGIN
    IF marks >= 90 THEN
        RAISE NOTICE 'Grade: A+';
    ELSIF marks >= 80 THEN
        RAISE NOTICE 'Grade: A';
    ELSIF marks >= 70 THEN
        RAISE NOTICE 'Grade: B+';
    ELSIF marks >= 60 THEN
        RAISE NOTICE 'Grade: B';
    ELSIF marks >= 50 THEN
        RAISE NOTICE 'Grade: C';
    ELSE
        RAISE NOTICE 'Fail';
    END IF;
END $$;

SELECT *
FROM SCHEMA_ANALYSIS
ORDER BY
    CASE
        WHEN violation_count = 0 THEN 3        -- Lowest priority
        WHEN violation_count BETWEEN 1 AND 2 THEN 2
        ELSE 1                                 -- Highest priority
    END,
    violation_count DESC;
