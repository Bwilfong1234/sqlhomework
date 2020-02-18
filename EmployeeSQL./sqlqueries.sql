DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS titles;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS dept_emp;



CREATE TABLE departments (
  dept_no character varying  NOT NULL,
  dept_name character varying NOT NULL
);

CREATE TABLE titles (
  emp_no integer  NOT NULL,
  title character varying NOT NULL,
  from_date Date ,
  to_date Date NOT NULL
);

CREATE TABLE salaries (
  emp_no integer  NOT NULL,
  salary integer NOT NULL,
  from_date Date ,
  to_date Date NOT NULL
);

CREATE TABLE employees (
    emp_no integer  NOT NULL,
    birth_date Date NOT NULL,
    first_name character varying  NOT NULL,
	last_name character varying NOT NULL,
	gender VARCHAR NOT NULL,
	hire_date Date  NOT NULL
);

CREATE TABLE dept_manager (
  dept_no character varying  NOT NULL,
  emp_no integer NOT NULL,
  from_date Date ,
  to_date Date NOT NULL
);

CREATE TABLE dept_emp (
  emp_no  integer NOT NULL,
  dept_no character varying  NOT NULL,
  from_date Date ,
  to_date Date NOT NULL
);

select *  
from employees;

select *  
from salaries;
------------ number 1
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.gender, salaries.salary
FROM salaries
INNER JOIN employees ON
employees.emp_no=salaries.emp_no;


---------number 2

SELECT emp_no, first_name, last_name,hire_date
FROM employees
WHERE hire_date between '1986-01-01' and  '1987-01-01'



------------------number 3

Select dept_manager.emp_no,dept_manager.from_date ,dept_manager.to_date,departments,employees.last_name, employees.first_name
from employees
join dept_manager on employees.emp_no = dept_manager.emp_no
join departments on departments.dept_no = dept_manager.dept_no;
---------------number 4
Select  dept_emp.emp_no,departments,employees.last_name, employees.first_name
from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on departments.dept_no = dept_emp.dept_no;

---------------number 5
select *
from employees
where employees.first_name= 'Hercules' and employees.last_name Like 'B%'

---------------number 6

Select  dept_emp.emp_no,departments.dept_name,employees.last_name, employees.first_name
from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on departments.dept_no = dept_emp.dept_no
where dept_name like 'Sales'
------------number 7

Select  dept_emp.emp_no,departments.dept_name,employees.last_name, employees.first_name
from employees
join dept_emp on employees.emp_no = dept_emp.emp_no
join departments on departments.dept_no = dept_emp.dept_no
where dept_name like 'Sales' or dept_name like'Development'
----- number 8
SELECT last_name, COUNT(last_name) AS Frequency
FROM employees
GROUP BY last_name
ORDER BY
COUNT(last_name) DESC
