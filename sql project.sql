

create database employee;
use employee;

-- changing the datatype of emp_id
alter table emp_record_table
modify column emp_id varchar(10);

alter table emp_record_table
modify column proj_id varchar(10);


-- addigning emp_id as PK

alter table emp_record_table
add primary key (emp_id);

-- changing the datatype of proj_id

alter table proj_table
modify column PROJECT_ID varchar(10);

-- addigning PROJECT_ID as PK

alter table proj_table
add primary key (PROJECT_ID);
data_science_tem

--- Making proj id in employee 

select * from data_science_tem
alter table data_science_team
modify column EMP_ID varchar(10);

ALTER TABLE data_science_team
ADD FOREIGN KEY (emp_id) REFERENCES emp_record_table(emp_id)



Q3. Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, and DEPARTMENT from the employee record table, and make a list of employees and details of their department.

select emp_id, first_name, last_name, gender, dept 
from emp_record_table;


Q.4 Write a query to fetch EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPARTMENT, and EMP_RATING if the EMP_RATING is: 

Select EMP_ID, FIRST_NAME, LAST_NAME, GENDER, DEPT, EMP_RATING from emp_record_table
	where emp_rating<2 or emp_rating>4 or emp_rating between 2 and 4
---------------------------------------------------------------------------------------------------------------------
Q.5 Write a query to concatenate the FIRST_NAME and the LAST_NAME of employees in the Finance department from the employee table and then give the resultant column alias as NAME.

select concat(first_name,' ',last_name) AS NAME from emp_record_table
 where dept='finance';
---------------------------------------------------------------------------------------------------------------------
Q.6 Write a query to list only those employees who have someone reporting to them. Also, show the number of reporters (including the President).

select et1.emp_id, et1.first_name, et1.last_name,et1.role , count(*)from emp_record_table as ET1
inner join emp_record_table as ET2 
on et1.emp_id=et2.manager_id
group by et1.emp_id, et1.first_name, et1.last_name,et1.role
--------------------------------------------------------------------------------------------------------------------
Q.7  Write a query to list down all the employees from the healthcare and finance departments using union. Take data from the employee record table.

select * from emp_record_table
where dept="healthcare"
union
select * from emp_record_table
where dept="finance"
--------------------------------------------------------------------------------------------------------------------
Q. 8  Write a query to list down employee details such as EMP_ID, FIRST_NAME, LAST_NAME, ROLE, DEPARTMENT, and EMP_RATING grouped by dept. Also include the respective employee rating along with the max emp rating for the department.

select EMP_ID, FIRST_NAME, LAST_NAME, ROLE, DEPt, EMP_RATING, 
max(emp_rating) over( Partition by Dept) as max
from emp_record_table
order by dept
---------------------------------------------------------------------------------------------------------------------
Q.9 Write a query to calculate the minimum and the maximum salary of the employees in each role. Take data from the employee record table.

Select role, max(Salary), min(Salary) FROM emp_record_table
group by role
-------------------------------------------------------------------------------------------------------------------
Q.10 Write a query to assign ranks to each employee based on their experience. Take data from the employee record table.

select *, rank() over(order by exp desc) as rank__ from emp_record_table
--------------------------------------------------------------------------------------------------------------------
Q.15 Create an index to improve the cost and performance of the query to find the employee whose FIRST_NAME is ‘Eric’ in the employee table after checking the execution plan.

explain Select * from emp_record_table
where first_name = "Eric"

Create index ix_lastname on emp_record_table(first_name)
-------------------------------------------------------------------------------------------------------------

Q.16 Write a query to calculate the bonus for all the employees, based on their ratings and salaries (Use the formula: 5% of salary * employee rating).

Select *, (5*salary*emp_rating)/100 as bonus from emp_record_table

-------------------------------------------------------------------------------------------------------------------

Q.17 Write a query to calculate the average salary distribution based on the continent and country. Take data from the employee record table.

select continent avg(salary), from emp_record_table
group by ----

------------------------------------------------------------------------------------------------------------
Q14
select *,
	case when exp <2 then 'JUNIOR DATA SCIENTIST'
    when exp<=5 then 'ASSOCIATE DATA SCIENTIST'
      when exp<=10 then   'SENIOR DATA SCIENTIST'
      when exp<=12 then   'Lead DATA SCIENTIST'
    else "Manager" end as Status

 from emp_record_table

---------------------------------------------------------------------------------------------
Q 12
-- 12 
select first_name, last_name from (
select * from emp_record_table
where exp>10) as B
-------------------------------------------------------------------------------------

alter table emp_record_table
modify column first_name varchar(100)