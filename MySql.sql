-- SQL: Standard Query Language
-- data : collection of information 
-- structured data : The data which is in tabuler format ; pdf file ,excel sheet
-- unstructured data : The data which is not in tabuler format : image ,video
-- DBMS : Data Base Management System
-- server : A server is a powerful computer or system that provides resources, data, services, or programs to other computers, known as  clients, over a network. 
-- Servers are designed to manage, store, send, and process data 24/7 and can handle many requests from multiple clients simultaneously. 

-- SQL is a query language and Mysql is a client software.
-- SQL is programming language for storing and processing information in a relational database

-- DBMS : A DBMS is a software system that provides a systematic way to create, retrieve, update, and manage data in databases.

-- RDBMS : is a type of database management system that stores data in a structured format, using rows and columns.
--  It provides tools to create, update, manage, and query data in a relational database.

# to Create Database 
create database College;

# use created Database
use College;

-- Data type-- 
-- --Integers -- 
-- Tinyinte - 1 byte memory: Age (0-120):1 byte=8 bit 
-- smallint - 2 bytes
-- mediumint - 3 bytes
-- int- 4 bytes
-- Bigint=8 bytes

--  Fractional : float,double,decimal

-- string/text-- 
-- char()-fixed character length: mobile number ,PAN number,Adhar number
-- varchar(): variable character length : names ,addresses

-- Date :"yyyy-mm-dd"
-- datetime :"yyyy-mm-dd hh:mm:ss"
-- Timestamp-- 

-- operator;
-- > : Greater than 
-- < : Lesser than 
-- >= : Greater than r equal to 
-- >= : less than r equal to
-- <> : not equal 

-- wild card : like % _
-- % : represent 0 or more character 
-- _ : represent exactly single character 

 # To create table 
CREATE TABLE Members (
    S_no INT,
    First_Name VARCHAR(10),
    Last_Name VARCHAR(10),
    Mobile_Number VARCHAR(10),
    USN VARCHAR(10)
);

#To Insert values into table
insert into Members values(1,'Prajwal','Bandi',8586559,'Kalaburgi');
insert into Members values(2,'Jyoti','Yakapur',585654,'Banglore');
insert into Members values(3,'Bhagyashri','Bandi',5646,'Kalaburgi');
insert into Members values(4,'Raju','Bandi',546666666,'Banglore');
insert into Members values(5,'Sharan','Yakapur',6854968745,'Banglore');
select * from Members order by S_no;


-- SQL Commands--
-- DDL-Data Definition Language (change the structure of the table/database)--> create, alter, drop, truncate, rename

# DROP and TRUNCATE are DDL command while DELETE is a DML command. 
-- DELETE removes the specific row based on the given condition.
-- TRUNCATE removes all the record from the table at once.
-- DROP command removes the table or databases and as well as the structure permanently.

#add column
alter table Student add Course char(20);
alter table Student add Age int(2);

#to drop the column
alter table student drop column Age;

# to change column name 
alter table student change column USN Addres char(10);

#to change table name
rename table Student to Members;

#truncate : used to delect all rows from table name 
truncate table Members;
select* from Members;

#drop : to delete database r table
drop database College;


-- DML-Data Manipulation Language(make changes of the data in the table/database)--> insert, update, delete
 
 set sql_safe_updates=0;
 
insert into Members values(7,'Sharan','Yakapur',4579476,'Banglore',' ');

delete from Members where S_no=7;

update Members set First_name='prajwal' where  First_name='Prajwal';


-- DQL-Data Query Language(read/retrieve the data)--> select used to call the data r retrieve the data 
select * from Members;


-- DCL-Data Control Language(gives permissions/access)--> grant, revoke
GRANT privilege_type ON object_name TO user_name;
REVOKE privilege_type ON object_name FROM user_name;

 -- TCL-Transaction Control Language(save changes permanently, temporarily and getting back the saved changes)--> commit, savepoint, rollback
#TCL; transaction control Language
#Savepoint;to save temporarly
#commit; To save permanently
#Rollback; To take the data into original from manipulation or Undo 

-- COMMIT: Saves the changes made by the current transaction permanently to the database.
-- ROLLBACK: Undoes the changes made by the current transaction or to a specified savepoint, reverting the database to its previous state.
-- SAVEPOINT: Sets a savepoint within a transaction, allowing partial rollbacks to this point.
-- SET TRANSACTION: Sets the characteristics for the current transaction, such as isolation level and read/write access.
use excelr;
start transaction; -- auto_commit is turned off 

select*from students;
insert into students values (11,'prajwal',22);
rollback;


insert into students values (12,'pavan',23);
commit;
select* from students;


-- Case :The CASE function in SQL is a versatile conditional expression that allows you to execute a series of conditions and return a specified value when the first condition is met.
--  It is similar to an IF-THEN-ELSE statement in programming languages.

use excelr;
select emp_id, first_name,job_id, salary,
case job_id when 'it_prog' then salary*0.3
	        when 'Ad_vp' then salary*0.2
            else salary*0
            end as Bonus,
case job_id when 'it_prog' then salary*0.3 + salary
	        when 'Ad_vp' then salary*0.2 + salary
            else salary
            end as Total_Salary
            from myemp;
            
-- Null : n SQL, NULL represents the absence of a value in a column. The NULL keyword is used to indicate that a data field does not contain any value.
--  Handling NULL values is a critical part of SQL because they can affect the outcomes of queries, calculations, and data manipulations.

 -- ifnull,isnull,coalesce,not null 

-- isnull() - helps to find out the null values in the table
select *,isnull(Course) from Members;

SELECT first_name Last_name  ,Course
FROM Members
WHERE Course IS NULL;

 -- is not null-- 
SELECT first_name Last_name  ,Course
FROM Members
WHERE Course IS  not NULL;

-- ifnull
update Members  set Course = ifnull(Course," ");

-- constraints : it is a rule r instruction  applied to the data in a table to  ensure integrity,accuracy and consistency of data.

-- Domain type contraints:
-- not null - col which is mentioned as not null will not allow null values
-- unique - col which is mentioned as unique will not allow duplicate values
-- check - filters the columns based on condition
-- default - if we forgot to give any value to the column by default it will take the mentioned default value

create table students(
Sid int unique,
Sname  varchar(30) not null,
age tinyint check(age>21),
course varchar(30) default "mysql",
Gender enum('male','female'));
select * from students;

create table Students (
Sl_no int unique,
First_name char(20) not null,
Age int check(Age>21),
course varchar(20) default('DS')
);
select * from Students;

-- #key type constraints

-- #primary key; the key which is uniquely identifies each row in table
-- no duplicates 
-- no null values

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    Name VARCHAR(100),
    Age INT
);

INSERT INTO Students (StudentID, Name, Age) VALUES
(1, 'John Doe', 20),
(2, 'Jane Smith', 22),
(3, 'Alice Brown', 19),
(4, 'Bob Davis', 21),
(5, 'Charlie White', 23),
(6, 'Diana King', 20),
(7, 'Evan Taylor', 22),
(8, 'Fiona Hall', 19),
(9, 'George Clark', 21),
(10, 'Hannah Lee', 23);

select * from students;

--  foreign key : combination of column in table that established a relationship with primary key r unique key in another table.

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    Course VARCHAR(100),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID)
);

INSERT INTO Enrollments (EnrollmentID, StudentID, Course) VALUES
(101, 1, 'Mathematics'),
(102, 2, 'Physics'),
(103, 3, 'Chemistry'),
(104, 4, 'Biology'),
(105, 5, 'English'),
(106, 1, 'History'),
(107, 2, 'Geography'),
(108, 3, 'Philosophy'),
(109, 4, 'Computer Science'),
(110, 5, 'Economics');

select * from Enrollments;
desc Enrollments;
desc Students;

-- -Aggregate function :  An aggregate function is a function that performs a calculation on a set of values, and returns a single value.

-- MIN() - returns the smallest value within the selected column
-- MAX() - returns the largest value within the selected column
-- COUNT() - returns the number of rows in a set
-- SUM() - returns the total sum of a numerical column
-- AVG() - returns the average value of a numerical column

 select min(Mobile_number) from Members;
 select max(Mobile_number) from Members;
 select avg(mobile_number) from Members;
 select sum(mobile_number) from Members;
 select count(Mobile_number) from Members;

 select * from Members;

-- -- date funciton: year,month,monthname,day,dayname,datediff,timestampdiff

select * from myemp;
select emp_id,hire_date,timestampdiff(year,hire_date,now()) as experience from myemp;
select emp_id,hire_date,timestampdiff(month,hire_date,now()) as experience from myemp;
select emp_id,hire_date,timestampdiff(day,hire_date,now()) as experience from myemp;
select emp_id,hire_date,year(hire_date) as year,month(hire_date) as month,monthname(hire_date) as month_name,day(hire_date) as Day,dayname(hire_date) as Dayname from myemp;

-- Clauses : In SQL, clauses are components of SQL statements that provide additional instructions or conditions to modify or filter the results of the query.


-- Create the Sales table
CREATE TABLE Sales (
    Product VARCHAR(50),
    Category VARCHAR(50),
    Amount INT
);

-- Insert data into the Sales table
INSERT INTO Sales 
VALUES ('Laptop', 'Electronics', 1500),
       ('Smartphone', 'Electronics', 800),
       ('Shirt', 'Clothing', 30),
       ('Dress', 'Clothing', 50),
       ('Tablet', 'Electronics', 600);
       
select * from Sales;

-- Group by : SQL GROUP BY statement is used to arrange identical data into groups. The GROUP BY statement is used with the SQL SELECT statement.

SELECT Category, SUM(Amount) AS Total_Sales
FROM Sales
GROUP BY Category;

select dep_id,avg(salary) from myemp group by dep_id;
select * from myemp;
select job_id, avg(salary) from myemp group by job_id;
                  
-- Having clause :HAVING clause is used to specify a search condition for a group or an aggregate. used with aggregate function.
-- Having is used in a GROUP BY clause. If you are not using GROUP BY clause then you can use HAVING function like a WHERE clause.

use excelr;
select dep_id ,avg(salary) from myemp group by dep_id having avg(salary)>10000;
select dep_id,avg(salary)  from myemp where dep_id in (90,60,100,110) group by dep_id having avg(salary)>10000;
select Category, count(Amount) from sales group by category having count(Amount)<20;
select * from sales;
select count(*)  from sales;

select dep_id ,mgr_id,round(avg(salary),2) from myemp group by dep_id,mgr_id;

-- Order by : The ORDER BY clause sorts the result-set in ascending or descending order.
-- It sorts the records in ascending order by default. DESC keyword is used to sort the records in descending order.

select * from Sales order by Amount;
select * from Sales order by Amount desc;


-- --joins-- 
-- SQL joins are a way to combine rows from two or more tables based on a related column between them.
--  Joins are used to retrieve data that is spread across multiple tables in a relational database. 

-- inner joins : The INNER JOIN keyword selects records that have matching r common  records in both tables.
use excelr;
select * from books inner join authors on books.authorid=authors.authorid;
select * from movies;
select * from members;
select mo.id,mo.title,me.first_name,me.last_name from movies mo inner join  members me on mo.id=me.movieid;
select b.bookid,b.title ,a.authorid,a.name from books  b inner join authors a on b.bookid=a.authorid;
CREATE TABLE employees (
    id INT PRIMARY KEY,
    name VARCHAR(50),
    dept_id INT
);

INSERT INTO employees (id, name, dept_id) VALUES
(1, 'John', 1),
(2, 'Jane', 2),
(3, 'Mike', 1),
(4, 'Alice', 3),
(5, 'Bob', NULL),
(6, 'Carol', 4),
(7, 'Dave', 2),
(8, 'Eve', 3),
(9, 'Frank', 5);

select * from employees;

CREATE TABLE departments (
    id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

INSERT INTO departments (id, dept_name) VALUES
(1, 'Sales'),
(2, 'Marketing'),
(3, 'IT');

SELECT employees.name, departments.dept_name
FROM employees
INNER JOIN departments ON employees.dept_id = departments.id;


-- left join : he LEFT JOIN keyword returns all records from the left table (table1), and the matching records from the right table (table2). 
-- The result is 0 records from the right side, if there is no match.

select mo.id,mo.title,me.first_name,me.last_name from movies mo left join  members me on mo.id=me.movieid;

SELECT employees.name, departments.dept_name
FROM employees
right  JOIN departments ON employees.dept_id = departments.id;

-- Right join : he LEFT JOIN keyword returns all records from the right table (table1), and the matching records from the left table (table2). 
-- The result is 0 records from the right side, if there is no match.

select mo.id,mo.title,me.first_name,me.last_name from movies mo right join  members me on mo.id=me.movieid;

select memid,first_name,last_name,ifnull(movieid,'--')as movie_id,ifnull(title,'--')as movie_id from movies right join  members on movies.id=members.movieid;

select * from myemp;
SELECT employees.name, departments.dept_name
FROM employees
INNER JOIN departments ON employees.dept_id = departments.id;

-- Full join : The FULL OUTER JOIN keyword returns all records when there is a match in left (table1) or right (table2) table records.

-- SELECT employees.name, departments.dept_name
-- FROM employees
--  full outer JOIN departments ON employees.dept_id = departments.id;


-- self join : joining the table with itself
select e.emp_id ,concat(e.first_name,' ',e.last_name) as emp_full_name,
e.mgr_id,concat(m.first_name,' ',m.last_name) as mgr_full_name
from myemp as e inner join myemp as m on e.mgr_id=m.emp_id order by emp_id;

-- cross join : used to combine each row of one table with each row of another table, and return the Cartesian product of the sets of rows from the tables that are joined-- 
select* from meals;
select * from drinks;
select * from meals cross join drinks;

select m.mealname,m.rate as mean_rate ,d.drinkname,d.rate as drinkrate ,(m.rate+d.rate) as total_rate from meals as m cross join drinks as d ;

-- union : Combining two are more table excluding duplicate data -- 
select * from  movies left join  members  on  movies.id=members.movieid
union 
select * from movies right join members on movies.id=members.movieid;

-- union all : combining two or more table including duplicate data
select * from movies left join members on movies.id=members.movieid
union all
select * from movies right join members on movies.id=members.movieid;


-- views : it is a virtual table that represents the result of stored query which is created on the basis of real table 
-- 2 types of view 
-- simple view : it is created on the basis of 1 table 
-- complex view : it is created on the basis of 2 table 

create view  book_5 as 
select * from books where bookid<=5;  # simple view
-- insert into book_5 value (12,'jbvifd',1);
select* from books;

create view stats_of_myemp as  # complex view
select job_id, max(salary) as maximum_salary,min(salary) as minimum_salary,avg(salary) as avg_salary,count(*) as no_of_emp
 from myemp group by job_id;

select * from stats_of_myemp;

use excelr;

--  stored procedure: 	collection of precompiled sql statements  in the database  # in and out parameter
call new_procedure();

-- select * ,1.1*salary as hiked_salary from myemp  where hiked_salary>100;

-- A CTE (Common Table Expression) is a one-time result set that only exists for the duration of the query
-- fetch all column from myemp and new column called codename
with cte as(
select *,upper(concat(left(first_name,2),left(last_name,2))) as Codename from myemp
) select * from cte where Codename='NEKO';

with cte as (
select * ,1.1*salary as hiked_salary from myemp )
select * from cte where hiked_salary>10000;
 

-- stored procedure with if function 
Delimiter //
create procedure proc_if (in num int)
Begin
if num>0 then 
select  "The number is positive" as msg;
elseif num<0 then 
select "The number is negative" as msg ;
else
select "Number  is Zero" as msg ;
end if ;
End //
Delimiter ;

call proc_if(12);

Delimiter //
create procedure square (in num int )
Begin 
select concat(" square of the number ",num*num) as msg;
end//
delimiter ;


-- stored procedure with looping statement 
Delimiter //
create procedure proc_loop(in num int)
Begin
declare cnt int default 0; # declare the condition
myloop : loop # start loop
select "Hello world" as msg;
set cnt=cnt+1;
if cnt=num then 
leave myloop;
end if;
end loop myloop;  # stop loop
end // 
 Delimiter ;
 
 call proc_loop(2);

--  function : it is a stored program that can be invoked to perform a specific and return single value 
-- system defined function : aggregate function,string function ,date and time ,window function
-- user defined function : the function which is created by user

-- windows function : these are the powerful feature in sql that allow to perform calculation across a set of rows related to the current row without grouping the rows into a single output row like with aggregate function
select* from myemp;
select avg(salary) from myemp;
select *,avg(salary) over() as avg_sal from myemp;

-- using over clause and CTE  fetch whose  salary is greater than  avg salary
with cte as (
select *,avg(salary) over() as avg_sal from myemp)
select * from cte where salary>avg_sal;

select*,avg(salary) over(partition by dep_id) as avg_sal from myemp;

-- order clause 
create table  marks (Sid int ,score int);
insert into marks values(1,90),(2,85),(3,80),(4,90),(5,75);
select * from marks;
select *,rank() over (order by score desc) as rnk, dense_rank() over(order by score desc) as dense_rnk from marks; # rank 
select *,dense_rank() over(order by score) as den_ran from marks ;-- 

# Ranking function 
#rank : double rank may skips 
#dense_rank : values not skipping 
# row number : serial number column 
# percentile rank : percentage calculation 

select* from sales;
select *,dense_rank() over (partition by fiscal_year order by sale) as rnk from sales ; 

select *,row_number() over(order by salary  desc) as SlNo, 
dense_rank() over(order by salary desc)as org_rnk from myemp;

select *,percent_rank() over (partition  by dep_id order by salary ) as percent from myemp;
use excelr;

-- Analytics function
-- lag: previous row data
-- lead: next row data
-- first_value: displays highest 1st value 
-- nth_value: display which number highest we wants 

select* from trains;
select*,lead(time,1) over(partition by train_id ) as nxt_st_time from trains;
select*,lag(time) over(partition by train_id) as prs_st_time from trains;
select Train_id,station,lag(time,1) over(partition by train_id) as prs_st_time ,time,lead(time) over (partition by train_id) as Nxt_st_time from trains;
select*,first_value(emp_id) over(partition by dep_id order by salary) as high_salary from myemp;
select *,nth_value(first_name,3) over (partition by dep_id order by salary desc) as sec_high_salary from myemp;
select *,last_value(first_name) over(partition by dep_id order by salary desc) as lowest_value from myemp;

-- aggregate function : sum,min,max,avg,count
-- ranking function : rank,dence_rank,percent_rank,row_number;
-- Analytic function : ntile,lag,lead,fisrt_value,last_value,nth_value

-- sub query:In SQL, a subquery (also known as an inner query or nested query) is a query nested within another SQL query. It allows you to use the result of one query as a part of another query. 
-- --Subqueries can be used in different parts of a SQL statement where expressions are allowed, such as SELECT, INSERT, UPDATE, or DELETE statements.
select* from myemp;
select * from myemp where salary=24000;
select* from myemp where salary=(select max(salary) from myemp); # sub query

select * from myemp where salary in(2400,2100);
select * from myemp where salary in ((select max(salary) from myemp),(select min(salary) from myemp));
-- salary is greater than avg salary
select * from myemp where salary > (select avg(salary) from myemp);

-- select employee working with each dep_id
select dep_id,count(emp_id) as num_emp from myemp group by dep_id;

with cte as (
select dep_id,count(emp_id) as num_emp from myemp group by dep_id
)select max(num_emp),min(num_emp),avg(num_emp) from cte;

select * from products;
select * from products where mrp in ((select max(mrp) from products),(select min(mrp) from products));

select dep_id,avg(salary) from myemp group by dep_id;
select * from myemp me where salary >(select avg(salary) from myemp where dep_id =me.dep_id);

-- fetch those authors who written books
select * from authors where authorid in (select authorid from  books);

-- user defined function : function defined by the user
set global log_bin_trust_function_creators= 1;
select * from myemp;
select *,experience(emp_id) from myemp;


-- Normalization : Normalization is the process of organizing data in a database to reduce redundancy and improve data integrity.--
-- The primary goal of normalization are eliminate duplicate data,ensure data dependencies are logical and improve efficiency of the database--
-- This is typically achieved by dividing large table into smaller,related tables and defining relationship between them--
-- Normalization ia carried out through a series of stage called normal forms--

-- First Normal Form (1NF):
-- Ensure that the table has a primary key.
-- Eliminate repeating groups (each column should contain atomic, indivisible values).
-- Ensure each column contains only one value (no multi-valued attributes).

-- Second Normal Form (2NF):
-- Meet all the requirements of 1NF.
-- Remove subsets of data that apply to multiple rows and place them in separate tables.
-- Create relationships between these new tables and their predecessors using foreign keys.
-- Ensure that all non-key attributes are fully functional dependent on the primary key.

--  Third Normal Form (3NF) :
-- Meets all the requirements of the Second Normal Form.
-- Ensures that all the attributes are functionally dependent only on the primary key, i.e., there are no transitive dependencies.

-- Boyce-Codd Normal Form (BCNF): 
-- A stricter version of the Third Normal Form.
-- Every determinant must be a candidate key.

-- Fourth Normal Form (4NF) :
-- Meets all the requirements of Boyce-Codd Normal Form.
-- Ensures that there are no multi-valued dependencies.

-- Fifth Normal Form (5NF) :
-- Meets all the requirements of the Fourth Normal Form.
-- Deals with cases where information can be reconstructed from smaller pieces of information that are stored in a database.

-- Normalization helps in maintaining data integrity and optimizing query performance. However, it can sometimes lead to complex queries and joins,
--  so a balance must be struck based on the specific requirements of the database system.


-- Index :In SQL, an index is a database object created to improve the speed of data retrieval operations on a table. 
-- Indexes are used to quickly locate data without having to search every row in a database table each time a database table is accessed.


select * from employees limit 3;
select * from employees limit 5  offset 3;
