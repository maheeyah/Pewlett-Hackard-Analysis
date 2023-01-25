--DELIVERABLE 1
--1. Retrieve the emp_no, first_name, and last_name columns from the Employees table.
SELECT emp_no, first_name, last_name
FROM employees;

--2. Retrieve the title, from_date, and to_date columns from the Titles table.
SELECT title, from_date, to_date
FROM titles;

--3 & 4 Create a new table using the INTO clause and Join both tables on the primary key.

SELECT Employees.emp_no, Employees.first_name, Employees.last_name, Titles.title, Titles.from_date, Titles.to_date
FROM Employees
INNER JOIN Titles ON Employees.emp_no= Titles.emp_no;

--Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955.
--Then, order by the employee number.
SELECT *
FROM Employees
WHERE
	birth_date >= 1952 --this is not right, how do i get to filter just year?
	AND birth_date <= 1955;
ORDER BY emp_no

--Export the Retirement Titles table from the previous step as retirement_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.


--8. Copy the query from the Employee_Challenge_starter_code.sql and add it to your Employee_Database_challenge.sql file.
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (______) _____,
______,
______,
______

INTO nameyourtable
FROM _______
WHERE _______
ORDER BY _____, _____ DESC;

--Retrieve the employee number, first and last name, and title columns from the Retirement Titles table.
--These columns will be in the new table that will hold the most recent title of each employee.

SELECT emp_no, first_name, last_name, titles
FROM retirement_titles

