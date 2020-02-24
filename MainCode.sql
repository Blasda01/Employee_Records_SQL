--Returns employee no, name, gender and salary
SELECT e.emp_no, e.first_name, e.last_name, e.gender, s.salary
FROM employee e
JOIN salaries s
ON e.emp_no = s.emp_no;

--Employees hired in 1986
SELECT e.emp_no, e.first_name, e.last_name, e.hire_date
FROM employee e 
WHERE e.hire_date SIMILAR TO '1986%';
 
--List manager information for each department
SELECT man.dept_no, dep.dept_name, e.emp_no, e.last_name, e.first_name, man.from_date, man.to_date
FROM dept_manager man
JOIN departments dep
ON man.dept_no = dep.dept_no
JOIN employee e
ON man.emp_no = e.emp_no;

--List department of each employee
SELECT e.emp_no, e.last_name, e.first_name, dep.dept_name
FROM employee e
JOIN dept_employee demp
ON e.emp_no = demp.emp_no
JOIN departments dep
ON demp.dept_no = dep.dept_no;

--List of employees with name Hercules B.
SELECT e.emp_no, e.first_name, e.last_name
FROM employee e
WHERE e.first_name ILIKE 'Hercules'
AND e.last_name SIMILAR TO 'B%';

--List all employees in Sales Dept
SELECT e.emp_no, e.last_name, e.first_name, dep.dept_name
FROM dept_employee demp
JOIN departments dep
ON demp.dept_no = dep.dept_no
JOIN employee e
ON demp.emp_no = e.emp_no
WHERE dep.dept_name LIKE 'Sales';

--List all employees in Sales and Development depts
SELECT e.emp_no, e.last_name, e.first_name, dep.dept_name
FROM dept_employee demp
JOIN departments dep
ON demp.dept_no = dep.dept_no
JOIN employee e
ON demp.emp_no = e.emp_no
WHERE dep.dept_name LIKE 'Sales'
OR dep.dept_name LIKE 'Development';

--List frequency count of employee last name
SELECT last_name, COUNT(last_name) as Last_name_freq
FROM employee
GROUP BY last_name 
ORDER BY COUNT(last_name) DESC; 
