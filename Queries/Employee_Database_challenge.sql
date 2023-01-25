SELECT *
FROM TITLES;
--DELIVERABLE 1
--1. Retrieve the emp_no, first_name, and last_name columns from the Employees table.
SELECT emp_no, first_name, last_name
FROM employees;

--2. Retrieve the title, from_date, and to_date columns from the Titles table.
SELECT title, from_date, to_date
FROM titles;

--3 & 4 Create a new table using the INTO clause and Join both tables on the primary key.
--Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955.
--Then, order by the employee number.

--Export the Retirement Titles table from the previous step as retirement_titles.csv and save it to your Data folder in the Pewlett-Hackard-Analysis folder.


SELECT Employees.emp_no,
	Employees.first_name,
	Employees.last_name, 
	Titles.title, 
	Titles.from_date, 
	Titles.to_date
INTO Retirement_Titles
FROM Employees
INNER JOIN Titles 
	ON Employees.emp_no= Titles.emp_no
WHERE
	birth_date BETWEEN '1952-01-01' AND '1955-12-31'
ORDER BY Employees.emp_no;



--8. Copy the query from the Employee_Challenge_starter_code.sql and add it to your Employee_Database_challenge.sql file.
-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
	first_name,
	last_name,
	title
INTO unique_titles
FROM retirement_titles
WHERE to_date = ('9999-01-01')
ORDER BY emp_no ASC;


SELECT 
    Title, COUNT(*) AS Count
INTO retiring_titles
FROM unique_titles
GROUP BY Title
ORDER BY Count DESC;

--Deliverable 2
--Create Mentorship Eligibility Table
SELECT DISTINCT ON (emp_no) Employees.emp_no,
	Employees.first_name,
	Employees.last_name, 
	Employees.birth_date,
	Dept_emp.from_date,
	Dept_emp.to_date,
	Titles.title 
INTO Mentorship_Eligibility
FROM Employees
INNER JOIN Dept_Emp 
	ON Employees.emp_no= Dept_Emp.emp_no
INNER JOIN Titles 
	ON Employees.emp_no= Titles.emp_no
WHERE dept_emp.to_date = ('9999-01-01')
	AND	birth_date BETWEEN '1965-01-01' AND '1965-12-31'
ORDER BY emp_no;

SELECT *
FROM Mentorship_Eligibility