-- List the employee number, last name, first name, sex, and salary of each employee.
SELECT 
  E.emp_no, 
  E.last_name, 
  E.first_name, 
  E.sex, 
  S.Salary 
FROM 
  public."Employee" AS E 
  INNER JOIN public."Salary" As S ON E.emp_no = S.emp_no;
  
--List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT 
  first_name, 
  last_name, 
  hire_date 
FROM 
  public."Employee" 
Where 
  EXTRACT(
    'year' 
    FROM 
      hire_date
  ) = '1986' 
  
--List the manager of each department along with their department number, department name, employee number, last name, and first name.
SELECT 
  D.dep_no, 
  D.dep_name, 
  DM.emp_no, 
  E.first_name, 
  E.last_name 
FROM 
  public."Dep_Manager" AS DM 
  INNER JOIN Public."Department" AS D ON DM.dep_no = D.dep_no 
  INNER JOIN public."Employee" AS E ON E.emp_no = DM.emp_no;
  
--List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT 
  D.dep_no, 
  D.dep_name, 
  DE.emp_no, 
  E.first_name, 
  E.last_name 
FROM 
  public."Dep_Emp" AS DE 
  INNER JOIN public."Department" AS D ON DE.dep_no = D.dep_no 
  INNER JOIN public."Employee" AS E ON E.emp_no = DE.emp_no;
  
--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
SELECT 
  first_name, 
  last_name, 
  sex 
FROM 
  public."Employee" 
Where 
  first_name = 'Hercules' 
  AND last_name like 'B%' 

--List each employee in the Sales department, including their employee number, last name, and first name.
SELECT 
  DE.emp_no, 
  E.first_name, 
  E.last_name, 
  D.dep_name 
FROM 
  public."Dep_Emp" AS DE 
  INNER JOIN public."Department" AS D ON DE.dep_no = D.dep_no 
  INNER JOIN public."Employee" AS E ON E.emp_no = DE.emp_no 
WHERE 
  D.dep_name = 'Sales' 

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT 
  DE.emp_no, 
  E.first_name, 
  E.last_name, 
  D.dep_name 
FROM 
  public."Dep_Emp" AS DE 
  INNER JOIN public."Department" AS D ON DE.dep_no = D.dep_no 
  INNER JOIN public."Employee" AS E ON E.emp_no = DE.emp_no 
WHERE 
  D.dep_name = 'Sales' 
  or D.dep_name = 'Development' 
  
--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
SELECT 
  last_name, 
  COUNT(last_name) AS count 
FROM 
  public."Employee" 
GROUP BY 
  last_name 
HAVING 
  COUNT(last_name) > 1 
ORDER BY 
  COUNT(last_name) DESC