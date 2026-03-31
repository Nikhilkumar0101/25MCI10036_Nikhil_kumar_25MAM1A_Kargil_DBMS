-- Table creation and data insertion
Create table students(
stud_id int primary key,
name varchar(50),
dept_id int
);

create table courses(
course_id int primary key,
course_name varchar(50)
);

create table enrollments(
stud_id int,
course_id int,
primary key(stud_id, course_id),
foreign key(stud_id) references students(stud_id),
foreign key(course_id) references courses(course_id)
);

create table departments(
dept_id int primary key,
dept_name varchar(50) 
);

insert into students values
(1,'Nikhil',101),
(2,'Aman',102),
(3,'Riya',101),
(4,'Sanya',103),
(5,'Rahul',Null);

insert into courses values
(201,'DBMS'),
(202,'OS'),
(203,'CN'),
(204,'AI');

insert into enrollments values
(1,201),
(1,202),
(2,201),
(3,203);

insert into departments values
(101,'Computer science'),
(102,'Electronics'),
(103,'Mechanical');

-- Answer 1
select s.name,c.course_name
from students s
inner join enrollments e on s.stud_id=e.stud_id
inner join courses c on e.course_id=c.course_id;

-- Answer 2
select s.name from students s
left join enrollments e on s.stud_id=e.stud_id
where e.stud_id is Null;

-- Answer 3
select c.course_name,s.name
from students s
right join enrollments e on s.stud_id=e.stud_id
right join courses c on e.course_id=c.course_id; 

-- Answer 4
select s.name,d.dept_name
from students s
left join departments d
on s.dept_id=d.dept_id;

-- Answer 5
select s.name,c.course_name
from students s
cross join courses c;