CREATE TABLE Students (
    student_id INT,
    name VARCHAR(50),
    city VARCHAR(50),
    percentage DECIMAL(5,2)
);
INSERT INTO Students VALUES
(1, 'Amit', 'Delhi', 96.5),
(2, 'Riya', 'Mumbai', 94.2),
(3, 'Rahul', 'Delhi', 97.8),
(4, 'Sneha', 'Mumbai', 98.1),
(5, 'Ankit', 'Chandigarh', 95.6),
(6, 'Pooja', 'Delhi', 93.4),
(7, 'Karan', 'Chandigarh', 96.2);


-- Without case statement
Select city, count(*) as std_count from students
where percentage>95
group by city;  

-- with case statement
select city, sum(case when percentage > 95 then 1 else 0 end) as std_count from STUDENTS
group by city;

-- question2 
select city, avg(case when percentage >95 then percentage else null end) as avg_stud from students
group by city
order by avg_stud desc;