-- Filename: parks_recreation_employee_analysis.sql
-- Author: Amudipe Ayomide 
-- Date: 2025-11-25
-- Description: SQL queries to explore employee demographics, salary, and department data.
-- Tables used:
--   employee_demographics (id, first_name, last_name, birthdate, gender, occupation_id, department_id, ...)
--   employee_salary (employee_id, salary, salary_effective_date, ...)
--   parks_departments (department_id, department_name, ...)


# SELECT ALL TABLES 

SELECT *
FROM employee_demographics;

SELECT *
FROM employee_salary;

SELECT *
FROM parks_departments;

# total number of employees
SELECT COUNT(*) AS `Total Emloyees`
FROM employee_demographics;


# age distribution
SELECT 
    CASE 
        WHEN age < 25 THEN 'YOUTH'
        WHEN age BETWEEN 25 AND 34 THEN 'YOUNG ADULT'
        WHEN age BETWEEN 35 AND 44 THEN 'ADULT'
        WHEN age BETWEEN 45 AND 54 THEN 'SENIOR'
        ELSE 'OLD'
    END AS `Age Group`,
    COUNT(*) AS `Count in Group`
FROM employee_demographics
GROUP BY `Age Group`
ORDER BY `Count in Group` DESC;


# gender counts
SELECT gender, COUNT(*) AS `Gender Count`
FROM employee_demographics
GROUP BY gender;

# the list of occupations in the organization
SELECT DISTINCT occupation
FROM employee_salary
ORDER BY occupation;

# demographic analysis determining the youngest and oldest employees
SELECT *
FROM employee_demographics
ORDER BY age ASC;

# identifying all staff older than 40
SELECT *
FROM employee_demographics
WHERE age > 40;


# listing employees born before 1985
SELECT *
FROM employee_demographics
WHERE birth_date < '1985-01-01';


# retrieving employees whose names begin with A, B, or C
SELECT *
FROM employee_demographics
WHERE first_name LIKE 'A%' 
   OR first_name LIKE 'B%' 
   OR first_name LIKE 'C%';
   
# sort employees by age
SELECT *
FROM employee_demographics
ORDER BY age DESC;

# calculate minimum and maximum salaries
SELECT 
    MIN(salary) AS `Low Salary`,
    MAX(salary) AS `High Salary`
FROM employee_salary;

# how many employees earn above 60,000
SELECT COUNT(*) AS `Earnings above 60000`
FROM employee_salary
WHERE salary > 60000;

# average salaries by occupation
SELECT 
    occupation,
    AVG(salary) AS `Average Salary`
FROM employee_salary
GROUP BY occupation
ORDER BY `Average Salary` DESC;


# top five highest-earning employees and their name, age, gender, role, and salary.
SELECT 
    employee_demographics.first_name,
    employee_demographics.last_name,
    employee_demographics.age,
    employee_demographics.gender,
    employee_salary.occupation AS Position,
    employee_salary.salary
FROM employee_demographics 
JOIN employee_salary 
    ON employee_demographics.employee_id = employee_salary.employee_id
ORDER BY employee_salary.salary DESC
LIMIT 5;


# join tables to build a unified employee report that includes demographic information, job title, salary, and department name
SELECT employee_demographics.employee_id,
 employee_demographics.first_name, 
 employee_demographics.last_name,
 employee_demographics.gender, 
 employee_demographics.age, 
 employee_salary.occupation,
 employee_salary.salary,
 parks_departments.department_name
FROM employee_demographics 
LEFT JOIN employee_salary 
    ON employee_demographics.employee_id = employee_salary.employee_id
LEFT JOIN parks_departments 
    ON employee_salary.dept_id = parks_departments.department_id;
    
    
# identify employees who are missing salary records and departments without employees.
    SELECT employee_demographics.employee_id, 
    employee_demographics.first_name, 
    employee_demographics.last_name,
    employee_demographics.age, 
    employee_demographics.gender
FROM employee_demographics 
LEFT JOIN employee_salary 
    ON employee_demographics.employee_id = employee_salary.employee_id
WHERE employee_salary.salary IS NULL;


SELECT 
    parks_departments.department_id,
    parks_departments.department_name
FROM parks_departments 
LEFT JOIN employee_salary 
    ON parks_departments.department_id = employee_salary.dept_id
WHERE employee_salary.dept_id IS NULL;


#
SELECT 
    p.department_id,
    p.department_name
FROM parks_departments p
LEFT JOIN employee_salary s
    ON p.department_id = s.department_id
WHERE s.department_id IS NULL;

# Using SQL logic, create a calculated age_group column that classifies employees as “Young,” “Mid-Level,” or “Senior,” 
SELECT 
    employee_demographics.employee_id,
    employee_demographics.first_name,
    employee_demographics.last_name,
    employee_demographics.gender,
    employee_demographics.age,
    CASE 
        WHEN employee_demographics.age < 30 THEN 'Young'
        WHEN employee_demographics.age BETWEEN 30 AND 49 THEN 'Mid-Level'
        ELSE 'Senior'
    END AS `Age Group`,
    employee_salary.occupation,
    employee_salary.salary,
    parks_departments.department_name
FROM employee_demographics 
LEFT JOIN employee_salary 
    ON employee_demographics.employee_id = employee_salary.employee_id
LEFT JOIN parks_departments 
    ON employee_salary.dept_id = parks_departments.department_id;
    
    
   
    SELECT 
    CASE 
        WHEN age < 30 THEN 'Young'
        WHEN age BETWEEN 30 AND 49 THEN 'Mid-Level'
        ELSE 'Senior'
    END AS `Age Group`,
    COUNT(*) AS `Employee Count`
FROM employee_demographics
GROUP BY `Age Group`
ORDER BY `Employee Count` DESC;

# analyze both the number of employees in each age group and the average salary per age group. 
SELECT 
    CASE 
        WHEN employee_demographics.age < 30 THEN 'Young'
        WHEN employee_demographics.age BETWEEN 30 AND 49 THEN 'Mid-Level'
        ELSE 'Senior'
    END AS `Age Group`,
    AVG(employee_salary.salary) AS `Average Salary`
FROM employee_demographics 
JOIN employee_salary 
    ON employee_demographics.employee_id = employee_salary.employee_id
GROUP BY `Age Group`;


# a CTE that calculates the total salary cost per occupation and then filter it to show occupations with a combined salary cost above 100,000
SELECT *
FROM (
    SELECT occupation, SUM(salary) AS `Total Salary Cost`
    FROM employee_salary
    GROUP BY occupation
) AS `Salary Cost`
WHERE `Total Salary Cost` > 100000;


## The company has more of one gender than the other and, one department spends the most on salaries, either because it has more employees or because those earn higher pay
## As expected, senior positions pay the most and take up a large portion of the salary budget.
## Most Employees are between 30 and 49 years showing the company has senior and experienced workers however, the the company are not hiring enough entry-level worker hence the younger employees
## Overall, the company has a table workforce, there is room to improve gender balance, hire younger people, and plan better for future staffing needs.















