Data Analysis

/***   List the employee number, last name, first name, sex, and salary of each employee. ***/

SELECT a.emp_id,
       a.last_name,
	   a.first_name,
	   a.sex,
	   b.salary
 FROM  Employees a , Salaries b
WHERE  a.emp_id = b.emp_id;

SELECT a.emp_id,
       a.last_name,
	   a.first_name,
	   a.sex,
	   b.salary
 FROM  Employees a 
  LEFT JOIN  Salaries b 
    ON  a.emp_id = b.emp_id;
	
/***  List the first name, last name, and hire date for the employees who were hired in 1986.  ***/
SELECT  first_name,
	    last_name,
	    Hire_date
 FROM  Employees  
WHERE EXTRACT('Year' FROM HIRE_DATE) = 1986;
	
/*** List the manager of each department along with their department number, department name, employee number, last name, and first name. ***/
SELECT  c.EMP_ID,
		a.DEPT_ID,
        b.DEPT_NAME,
		c.first_name,
	    c.last_name
  FROM  DEPT_MANAGER a, DEPTMTS b, Employees C
WHERE   a.DEPT_ID =b.DEPT_ID
  AND   a.EMP_ID = c.EMP_ID;
  
SELECT  c.EMP_ID,
		a.DEPT_ID,
        b.DEPT_NAME,
		c.first_name,
	    c.last_name
  FROM    DEPT_MANAGER a
LEFT JOIN DEPTMTS b 
       ON  a.DEPT_ID =b.DEPT_ID
LEFT JOIN Employees C
       ON a.EMP_ID = c.EMP_ID; 
  
/*** List the department number for each employee along with that employee’s employee number, last name, first name, and department name.  ***/

SELECT  a.EMP_ID,
		c.DEPT_ID,
        c.DEPT_NAME,
		a.first_name,
	    a.last_name
  FROM  Employees a, DEPT_EMP b, DEPTMTS c
WHERE   a.EMP_ID = b.EMP_ID
  AND   c.DEPT_ID = b.DEPT_ID;
  
SELECT  a.EMP_ID,
		c.DEPT_ID,
        b.DEPT_NAME,
		a.first_name,
	    a.last_name
  FROM  Employees a
LEFT JOIN DEPT_EMP c
       ON a.EMP_ID = c.EMP_ID 
LEFT JOIN DEPTMTS b 
       ON  c.DEPT_ID =b.DEPT_ID;
	   
	   
/*** List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.***/

SELECT  a.first_name,
	    a.last_name,
		a.sex
  FROM  Employees a
WHERE UPPER(first_name) = 'HERCULES'
  and upper(last_name) like 'B%'
     
/***  List each employee in the Sales department, including their employee number, last name, and first name.  ***/

SELECT  a.EMP_ID,
        c.DEPT_NAME,
		a.first_name,
	    a.last_name
  FROM  Employees a, DEPT_EMP b, DEPTMTS c
WHERE   a.EMP_ID = b.EMP_ID
  AND   c.DEPT_ID = b.DEPT_ID
  AND   UPPER(c.DEPT_NAME) = 'SALES';
  
SELECT  a.EMP_ID,
        b.DEPT_NAME,
		a.first_name,
	    a.last_name
  FROM  Employees a
LEFT JOIN DEPT_EMP c
       ON a.EMP_ID = c.EMP_ID 
LEFT JOIN DEPTMTS b 
       ON  c.DEPT_ID =b.DEPT_ID
WHERE  UPPER(b.DEPT_NAME) = 'SALES';

/***  List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.  ***/

SELECT  a.EMP_ID,
        c.DEPT_NAME,
		a.first_name,
	    a.last_name
  FROM  Employees a, DEPT_EMP b, DEPTMTS c
WHERE   a.EMP_ID = b.EMP_ID
  AND   c.DEPT_ID = b.DEPT_ID
  AND   UPPER(c.DEPT_NAME) in ( 'SALES', 'DEVELOPMENT');
  
SELECT  a.EMP_ID,
        b.DEPT_NAME,
		a.first_name,
	    a.last_name
  FROM  Employees a
LEFT JOIN DEPT_EMP c
       ON a.EMP_ID = c.EMP_ID 
LEFT JOIN DEPTMTS b 
       ON  c.DEPT_ID =b.DEPT_ID
WHERE  UPPER(b.DEPT_NAME)  in ( 'SALES', 'DEVELOPMENT');
	 
/***  List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name). ****/

SELECT  last_name, COUNT(*)
  FROM  Employees 
GROUP BY last_name
ORDER BY last_name DESC
  


