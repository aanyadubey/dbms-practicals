
# EXPERIMENT – 5

**AIM:** To create SQL views for department salary summary and employee hierarchy, test the updatability of views, and implement a recursive CTE to display reporting chains.

## SOURCE CODE

### 1. Creating Tables

Create three tables: Department, Project, and Employee. The Employee table contains employee details, department ID, project ID, and manager ID, with foreign key constraints referencing the Department and Project tables.

### 2. Inserting Department Records

Insert five departments into the Department table:

1. Human Resources — Delhi
2. Information Technology — Chandigarh
3. Finance — Mumbai
4. Marketing — Bangalore
5. Research and Development — Hyderabad

### 3. Inserting Project Records

Insert eight projects into the Project table:

1. Website Development — 500000
2. Mobile Application — 750000
3. Cyber Security System — 900000
4. Data Analytics Platform — 850000
5. AI Chatbot — 1200000
6. Cloud Migration — 1000000
7. Payroll Management — 400000
8. Market Research System — 600000

### 4. Inserting Employee Records

Insert 30 employee records containing employee ID, employee name, salary, job role, department ID, project ID, and manager ID.

### 5. Department Salary Summary

Create a view named `Department_Salary_Summary` using the Department and Employee tables.

The view uses aggregate functions to calculate:

- Employee count
- Average salary
- Total salary
- Highest salary
- Lowest salary

A LEFT JOIN is used to include departments even when they have no employees.

Query: `SELECT * FROM Department_Salary_Summary;`

OUTPUT: Displays the salary summary for each department.

6. Employee Hierarchy

Create a view named `Employee_Hierarchy` by joining the Employee table with itself.

The view displays:

- Employee ID
- Employee name
- Job role
- Department ID
- Manager ID
- Manager name

Query: `SELECT * FROM Employee_Hierarchy;`

OUTPUT: Displays employees along with their managers' names.

7. Employee Basic View

Create a view named `Employee_Basic_View` containing employee ID, employee name, salary, and department ID.

OUTPUT:Displays basic employee details.

8. Updating a View

Update the salary of employee ID 1 by increasing it by 1000 through the `Employee_Basic_View`.

Query:`UPDATE Employee_Basic_View SET Salary = Salary + 1000 WHERE Emp_ID = 1;`

Then retrieve the updated record using:

`SELECT * FROM Employee_Basic_View WHERE Emp_ID = 1;`

9. Recursive CTE — Reporting Chain

Create a recursive Common Table Expression (CTE) named `Reporting_Chain`.

The query starts with employees whose `Manager_ID` is NULL and assigns them reporting level 0. It then recursively retrieves employees whose manager IDs match the employee IDs in the previous level, increasing the reporting level by 1.

The final result is ordered by reporting level and employee ID.



SQL views were created for department salary summaries and employee hierarchies. The updatability of a view was tested by modifying an employee's salary, and a recursive CTE was used to display employee reporting chains.
