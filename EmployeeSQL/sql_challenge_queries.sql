-- 1. List the following details of each employee: employee number, last name, 
-- first name, gender, and salary.

SELECT 
	employees.emp_no,
	first_name,
	last_name,
	gender,
	salaries.salary
FROM 
	employees
JOIN
	salaries
ON
	employees.emp_no = salaries.emp_no;

-- 2. List employees who were hired in 1986.

SELECT 
	emp_no, 
	first_name, 
	last_name, 
	hire_date 
FROM employees WHERE hire_date like '1986%';

-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, 
-- last name, first name, and start and end employment dates.

SELECT 
	employees.emp_no,
	first_name,
	last_name,
	dept_manager.dept_no,
	dept_manager.from_date,
	dept_manager.to_date,
	departments.dept_name
FROM 
	employees
	JOIN
		dept_manager
	ON
		employees.emp_no = dept_manager.emp_no
		JOIN
			departments
		ON
			departments.dept_no = dept_manager.dept_no;

-- 4. List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

SELECT 
	employees.emp_no,
	first_name,
	last_name,
	departments.dept_name
FROM 
	employees
	JOIN
		dept_emp
	ON
		employees.emp_no = dept_emp.emp_no
		JOIN
			departments
		ON
			departments.dept_no = dept_emp.dept_no;

-- 5. List all employees whose first name is "Hercules" and last names begin 
-- with "B."

SELECT 
	emp_no, 
	first_name, 
	last_name
FROM employees WHERE first_name like 'Hercules' AND last_name like 'B%';

-- 6. List all employees in the Sales department, including their employee number, 
-- last name, first name, and department name.

SELECT 
	employees.emp_no,
	first_name,
	last_name,
	departments.dept_name
FROM 
	employees 
	JOIN
		dept_emp
	ON
		employees.emp_no = dept_emp.emp_no
		JOIN
			departments
		ON
			departments.dept_no = dept_emp.dept_no
	WHERE dept_name like 'Sales'

-- 7. List all employees in the Sales and Development departments, including 
-- their employee number, last name, first name, and department name.

SELECT 
	employees.emp_no,
	first_name,
	last_name,
	departments.dept_name
FROM 
	employees 
	JOIN
		dept_emp
	ON
		employees.emp_no = dept_emp.emp_no
		JOIN
			departments
		ON
			departments.dept_no = dept_emp.dept_no
	WHERE dept_name in ('Sales', 'Development');

-- 8. In descending order, list the frequency count of 
-- employee last names, i.e., how many employees share each last name.

SELECT 
	last_name, COUNT(last_name) as name_count
FROM
	employees
GROUP BY last_name
ORDER BY name_count DESC;
