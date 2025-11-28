# Employee Data Analysis
This project explores and analyzes employee demographic and salary data for a fictional Parks & Recreation Department. The dataset includes three tables; employee_demographics, employee_salary, and parks_departments, and the goal is to understand workforce patterns, salary distribution, department composition, and demographic trends using SQL.

The analysis covers data exploration, demographic insights, salary metrics, table joins, CTE-based aggregations, and an age group classification. All queries and insights are included in the accompanying SQL file.


## 🛠️ Technologies Used
- SQL
- Relational database concepts
- Aggregrate functions
- Common Table Expressions (CTEs)

## 🧠 Methodology
The workflow followed a structured SQL-driven process:

-Data Exploration
Retrieved all rows to understand structure, completeness, and relationships.

Demographic Analysis
- Total number of employees
- Age distribution
- Gender counts
- Employees older than 40
- Birth year filtering
- Names starting with A, B, or C
- Youngest and oldest employees
 Salary Analysis
- Minimum and maximum salaries
- Employees earning above 60,000
- Average salary per occupation
- Top 5 highest earners

Data Integration (Joins)
 - Combined demographic data with salary and department information for a full employee view.

Age Group Classification
- Created logic to assign employees into “Young,” “Mid-Level,” or “Senior” brackets.
Compared:
- Employee counts per age group
- Average salary per age group

CTE for Salary Cost
- Used a Common Table Expression to calculate total salary cost per occupation, then filtered for occupations with spending above 100,000.
- 
📈 Key Insights
- The company has more of one gender than the other and, one department spends the most on salaries, either because it has more employees or because those earn higher pay
- As expected, senior positions pay the most and take up a large portion of the salary budget.
- Most Employees are between 30 and 49 years showing the company has senior and experienced workers however, the the company are not hiring enough entry-level worker hence the younger employees
- Overall, the company has a table workforce, there is room to improve gender balance, hire younger people, and plan better for future staffing needs.

  📂 Project Files
  https://github.com/amudipeayomide/SQL-parks-and-employee-analysis
  https://github.com/amudipeayomide/SQL-parks-and-employee-analysis/README.md

> click on this link above to see the queries of my analysis.


 SQL-parks-and-employee-analysis
This repository contains SQL queries and a written insight summary for an employee demographics and salary analysis performed on the Parks &amp; Recreation Department dataset (employee_demographics, employee_salary, parks_departments).
