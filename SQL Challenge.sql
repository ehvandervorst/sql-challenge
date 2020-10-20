--1. List of all employees with their employee number, first and last name, sex and salary.
SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	employees.sex,
	salaries.salary
FROM employees
INNER JOIN salaries ON
employees.emp_no = salaries.emp_no;

--2. First and last name and hire date for everyone hired in 1986.
SELECT first_name, last_name, hire_date
FROM employees
WHERE EXTRACT(year FROM hire_date) = 1986;

--3. Namager of each department with department number and name, manager's employee number, last and first name.
SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_no,
	departments.dept_name
FROM employees
LEFT JOIN departmentmanager
ON employees.emp_no = departmentmanager.emp_no
LEFT JOIN departments
ON departments.dept_no = departmentmanager.dept_no
WHERE departments is not null;

--4. List of all employees with their employee number, first and last name, and department name.
SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM employees
LEFT JOIN departmentemployees
ON employees.emp_no = departmentemployees.emp_no
LEFT JOIN departments
ON departments.dept_no = departmentemployees.dept_no;

--5. First name, last name, and sex of all employees with first name Hercules and last name starting with 'B'
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--6. All employees in the Sales department with their employee number and first and last names
SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM employees
LEFT JOIN departmentemployees
ON employees.emp_no = departmentemployees.emp_no
LEFT JOIN departments
ON departments.dept_no = departmentemployees.dept_no
WHERE departments.dept_name = 'Sales';

--7. All employees in the Sales and Development departments with their employee number and first and last names
SELECT employees.emp_no,
	employees.last_name,
	employees.first_name,
	departments.dept_name
FROM employees
LEFT JOIN departmentemployees
ON employees.emp_no = departmentemployees.emp_no
LEFT JOIN departments
ON departments.dept_no = departmentemployees.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development';

--Frequency count of employee last name, descending order
SELECT last_name, COUNT(last_name) AS "Count by Last Name"
FROM employees
GROUP BY last_name
ORDER BY "Count by Last Name" DESC;