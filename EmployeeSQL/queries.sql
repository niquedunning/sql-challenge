--1. List the following details 
/Users/niquedunning/Desktop/Class Homework/uci-irv-data-pt-06-2020-u-c/Homework/sql-challenge/EmployeeSQL/
   
queries.sql
0.0 B
Thu Aug 6 00:48:08 2020
Tables.sql
1.7 kB
Fri Aug 21 02:45:39 2020
Show hidden files and folders?
of each employee: employee number, last name, first name, sex, and salary.
Select employees.emp_no, employees.last_name, employees.first_name, employees.sex, salaries.salary
FROM employees
JOIN salaries
ON employees.emp_no = salaries.emp_no;
--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT employees.first_name, employees.last_name, employees.hire_date
FROM employees
WHERE hire_date BETWEEN '1/1/1986' AND '1/1/1987';
--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT dept.dept_no, dept.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
FROM departments dept
JOIN dept_manager
ON dept.dept_no = dept_manager.dept_no
JOIN employees
ON dept_manager.emp_no = employees.emp_no;
--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no;
--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT first_name, last_name, sex
FROM employees 
WHERE first_name= 'Hercules'
AND last_name LIKE 'B%'; 
--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees 
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM dept_emp
JOIN employees
ON dept_emp.emp_no = employees.emp_no
JOIN departments
ON dept_emp.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales'
OR departments.dept_name = 'Development';
--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name,
COUNT (last_name) AS "Frequency"
FROM employees
GROUP BY last_name
ORDER BY 
COUNT(last_name) DESC;