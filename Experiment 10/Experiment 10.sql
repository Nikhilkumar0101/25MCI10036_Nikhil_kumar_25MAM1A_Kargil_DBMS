Create table payroll(
emp_id int primary key,
emp_name varchar(50),
salary decimal(10,2) check(salary>0)
);

Insert into payroll values
(1,'Amit',30000),
(2,'Neha',40000),
(3,'Ravi',50000);

begin;

update payroll
set salary=-1000
where emp_id=3;

update payroll
set salary=1000
where emp_id=3;

rollback;



select * from payroll;


begin;

update payroll
set salary=salary+5000
where emp_id=1;

savepoint sp1;

update payroll
set salary=salary+7000
where emp_id=2;

update payroll
set salary=-1000
where emp_id=3;

rollback to sp1;

commit;
